import sys
import tty
import termios
import time
import select

import rclpy
from rclpy.node import Node

from geometry_msgs.msg import Twist
from ghost_manager_interfaces.srv import EnsureMode


# ------------------------------------------------------
# 터미널 raw 입력용 함수 (Non-blocking)
# ------------------------------------------------------
def get_key_nonblocking():
    dr, _, _ = select.select([sys.stdin], [], [], 0)
    if dr:
        return sys.stdin.read(1)
    return ''


def set_terminal_raw():
    fd = sys.stdin.fileno()
    old = termios.tcgetattr(fd)
    tty.setraw(fd)
    return old


def restore_terminal(old_settings):
    fd = sys.stdin.fileno()
    termios.tcsetattr(fd, termios.TCSADRAIN, old_settings)


# ------------------------------------------------------
# ROS2 Keyboard Teleop Node (10Hz continuous publish)
# ------------------------------------------------------
class KeyboardControlNode(Node):
    def __init__(self):
        super().__init__("keyboard_control_node")

        self.twist_cmd_pub = self.create_publisher(
            Twist,
            "/mcu/command/manual_twist",
            10
        )
        self.ensure_mode_client = self.create_client(
            EnsureMode,
            "/ensure_mode"
        )

        # pressed keys
        self.pressed_keys = set()
        # track when each key was last seen (to handle key release)
        self.key_last_seen = {}

        # current velocities (Timer publishes this)
        self.vx = 0.0
        self.vy = 0.0
        self.vyaw = 0.0

        # -------------------------
        # ★ 속도 조절 변수
        # -------------------------
        self.default_speed = 0.2  # 기본 속도
        self.speed = self.default_speed

        # Timer 20Hz (= 0.05s)
        self.timer = self.create_timer(0.05, self.timer_callback)

        self.print_help()
        self.get_logger().info("KeyboardControlNode initialized (20Hz Continuous Mode).")


    # -----------------------------------------
    def timer_callback(self):
        msg = Twist()
        msg.linear.x = self.vx
        msg.linear.y = self.vy
        msg.angular.z = self.vyaw
        self.twist_cmd_pub.publish(msg)

    # -----------------------------------------
    def call_ensure_mode(self, field: str, valdes: int):
        if not self.ensure_mode_client.wait_for_service(timeout_sec=1.0):
            self.get_logger().error("ensure_mode 서비스 사용 불가")
            return

        request = EnsureMode.Request()
        request.field = field
        request.valdes = valdes

        future = self.ensure_mode_client.call_async(request)

        def cb(fut):
            try:
                res = fut.result()
                if res.result:  
                    self.get_logger().info(
                        f"[SERVICE OK] {res.result_str} (val={res.val})"
                    )
                else:
                    self.get_logger().warn(
                        f"[SERVICE FAIL] {res.result_str} (val={res.val})"
                    )
            except Exception as e:
                self.get_logger().error(f"[SERVICE ERROR] {e}")

        future.add_done_callback(cb)

    # -----------------------------------------
    def update_velocity_state(self):
        vx = vy = vyaw = 0.0

        if "w" in self.pressed_keys:
            vx = self.speed
        if "s" in self.pressed_keys:
            vx = -self.speed
        if "a" in self.pressed_keys:
            vy = self.speed
        if "d" in self.pressed_keys:
            vy = -self.speed
        if "q" in self.pressed_keys:
            vyaw = self.speed
        if "e" in self.pressed_keys:
            vyaw = -self.speed

        self.vx = vx
        self.vy = vy
        self.vyaw = vyaw

    # -----------------------------------------
    def adjust_speed(self, delta):
        new_speed = self.speed + delta
        new_speed = max(0.0, min(new_speed, 1.0))

        self.speed = new_speed
        self.get_logger().info(f"[SPEED] Speed changed → {self.speed:.2f}")

    # -----------------------------------------
    def keyboard_loop_once(self):
        """한 번만 키 입력 읽고 pressed_keys 업데이트."""
        key = get_key_nonblocking()
        current_time = time.time()

        if key:
            if key == "\x03":  # Ctrl+C
                raise KeyboardInterrupt

            # Movement
            if key in ("w", "a", "s", "d", "q", "e"):
                self.pressed_keys.add(key)
                self.key_last_seen[key] = current_time

            # Speed control
            elif key == "[":
                self.adjust_speed(-0.1)
            elif key == "]":
                self.adjust_speed(+0.1)

            # control mode
            elif key == "m":
                self.call_ensure_mode("control_mode", 140)
            elif key == "n":
                self.call_ensure_mode("control_mode", 180)

            # actions
            elif key == "z":
                self.call_ensure_mode("action", 0)
            elif key == "x":
                self.call_ensure_mode("action", 1)
            elif key == "c":
                self.call_ensure_mode("action", 2)

            elif key == "h":
                self.print_help()

        # Remove keys that haven't been seen in the last 0.15 seconds
        # This handles key release detection
        keys_to_remove = []
        for k in self.pressed_keys:
            if k in self.key_last_seen:
                if current_time - self.key_last_seen[k] > 0.15:
                    keys_to_remove.append(k)
            else:
                keys_to_remove.append(k)
        
        for k in keys_to_remove:
            self.pressed_keys.discard(k)
            self.key_last_seen.pop(k, None)

        self.update_velocity_state()

    # -----------------------------------------
    def print_help(self):
        msg = f"""
================ Keyboard Control Help ================
키를 누르고 있는 동안 20Hz로 Twist가 발행됩니다.
현재 속도(speed): {self.speed:.2f}

[이동 / 회전]
  w : 전진
  s : 후진
  a : 좌이동
  d : 우이동
  q : 좌회전
  e : 우회전

[속도 조절]
  [ : 속도 -0.1
  ] : 속도 +0.1

[제어권 변경]
  m : control_mode → 140
  n : control_mode → 180

[상태 변경]
  z : action → 0
  x : action → 1
  c : action → 2

[h] 도움말 출력
[Ctrl+C] 종료
=======================================================
"""
        self.get_logger().info(msg)


# ------------------------------------------------------
def main(args=None):
    rclpy.init(args=args)
    node = KeyboardControlNode()

    old_settings = set_terminal_raw()

    try:
        while rclpy.ok():
            rclpy.spin_once(node, timeout_sec=0.0)  # ROS Timer & Service callback 처리
            node.keyboard_loop_once()              # 키보드 입력 1회 처리
            time.sleep(0.01)

    except KeyboardInterrupt:
        node.get_logger().info("KeyboardInterrupt -> 종료")

    finally:
        restore_terminal(old_settings)
        node.destroy_node()
        rclpy.shutdown()


if __name__ == "__main__":
    main()
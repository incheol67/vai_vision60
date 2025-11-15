# Ghost Custom Messages

## Install guide

```bash
sudo apt-get install ros-${ROS_DISTRO}-nav2-msgs*
sudo apt install ros-${ROS_DISTRO}-sensor-msgs
sudo apt install ros-${ROS_DISTRO}-libstatistics-collector*
sudo apt install ros-${ROS_DISTRO}-ouster-msg*
```

```bash
mkdir -p ~/krm_ros2_ws/src && cd ~/krm_ros2_ws/src 
git clone https://github.com/Korea-Robot/ghost_custom_msgs.git
cd ~/krm_ros2_ws
colcon build
```
# ctrl::GoalType_t
uint8 GOAL_FROM_TWIST = 0
uint8 GOAL_WAYPOINT = 1
uint8 GOAL_DOCK = 2
uint8 GOAL_UNDOCK = 3
uint8 GOAL_INSPECT = 4
uint8 GOAL_UNINSPECT = 5
uint8 GOAL_DOCK_CLOSE = 6

std_msgs/Header header
uint8 goal_type
float64[] goal

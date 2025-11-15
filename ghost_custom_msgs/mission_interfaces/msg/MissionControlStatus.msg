uint8 TASK_SUCCEEDED = 0
uint8 TASK_CANCELED = 1
uint8 TASK_FAILED = 2
# true if we are executing a mission
bool is_executing
bool pausable  # can be paused
bool is_paused  # is currently paused
# mission status when executing
MissionStatus mission_status
# Information about the last task to execute
string last_task_type
string last_task_name
string last_task_result_str
uint8 last_task_result

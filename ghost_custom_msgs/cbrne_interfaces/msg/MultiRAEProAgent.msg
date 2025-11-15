# ROS2 Message for the MultiRae Pro agent
std_msgs/Header header
# Maps to U command, unit of measure
string unit_description
# Maps to R, latest reading
ValidatedFloat32 current_reading
# Maps to C, runtime ranges
ValidatedFloat32 calculated_high
ValidatedFloat32 calculated_low
ValidatedFloat32 calculated_stel
ValidatedFloat32 calculated_twa
# Maps to L command, alarm limits
ValidatedFloat32 limits_high
ValidatedFloat32 limits_low
ValidatedFloat32 limits_stel
ValidatedFloat32 limits_twa
# Maps to E command, active alarm values
bool over_range  
bool saturated  
bool failure    
bool alarm_high
bool alarm_low 
bool stel  
bool twa 
bool drift
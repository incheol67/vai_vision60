# Message for the Verifinder Alarms and Alerts
std_msgs/Header header

# Alerts
int32 alerts_battery_low_count
int32 alerts_fault_count
int32 alerts_gamma_detection_count
int32 alerts_general_count
int32 alerts_hazard_count
int32 alerts_innocent_detection_count
int32 alerts_instrument_failure_count
int32 alerts_neutron_detection_count

# Alarms
string  alarm_battery_low
string  alarm_fault
string  alarm_gamma_background_invalid
string  alarm_gamma_detection
string  alarm_high_count_rate
string  alarm_high_dose
string  alarm_neutron_background_invalid
string  alarm_neutron_detection
string  alarm_ok
string  alarm_stabilization

# Null  alarm_saturated
# Null  alarm_neutron_detection_prologue
# Null  alarm_GammaBackgroundChange
# Null  alarm_NeutronBackgroundChange

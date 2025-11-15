# Message for describing a threat
std_msgs/Header header

string data_str        # Date string of reading

string threat          # Threat
string threat_level    # Threat level

float64 lat            # Latitude of detection
float64 lon            # Longitude of detection

float32 max_gamma_dose_rate
float32 max_gamma_count_rate

float32 max_neutron_count_rate
float32 total_neutron_counts
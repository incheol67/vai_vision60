# Message for the Verifinder Neutron Monitor
std_msgs/Header header

string instrument_status # [ - ]

#BiasVoltage","Units":"mV","LastUpdated":"5884.843698993","Type":"Double","ErrorCode":"SUCCESS",".":"67649"
#CPLDVersion","LastUpdated":"7.457388084","Type":"String","ErrorCode":"SUCCESS",".":"26909"
float64 count_rate # [ counts / s ]
#FirmwareVersion","LastUpdated":"7.456243334","Type":"String","ErrorCode":"SUCCESS",".":"trunk.32797"
float64 last_count # [ counts ]
#LiveTime","Units":"s","LastUpdated":"5885.039496868","Type":"Double","ErrorCode":"SUCCESS","Flags":"1",".":"0x1.99999aced66ffp-3"
#RealTime","Units":"s","LastUpdated":"5885.039492993","Type":"Double","ErrorCode":"SUCCESS","Flags":"1",".":"0x1.99999aced66ffp-3"
#TimeSinceLastNeutron","Units":"s","LastUpdated":"5885.039502826","Type":"Double","ErrorCode":"SUCCESS",".":"0x1.f3182704c072ep+3"

float64 log_neutron_probability  # !! NO UNIT IN FIELD !!

bool background_valid       # [ - ]
string background_timestamp # [ - ]
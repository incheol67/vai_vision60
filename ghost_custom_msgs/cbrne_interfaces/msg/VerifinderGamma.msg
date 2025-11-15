# Message for the Verifinder Gamma Monitor
std_msgs/Header header

string instrument_status # [ - ]

int32 beta_count # !! NO UNIT IN FIELD
float32 beta_rate # [ counts / s ]
float64 dose # [ μSv/h ]
#BiasVoltage","Units":"V","LastUpdated":"5885.033545868","Type":"Float","ErrorCode":"SUCCESS",".":"0x1.09717p+6"
#CalibrationName","LastUpdated":"9.566037293","Type":"String","ErrorCode":"SUCCESS",".":"Gamma-A18738"
float64 count_rate # [ counts / s ]
float32 excess_beta_count  # !! NO UNIT IN FIELD !!
#FineGain","Units":"unitless","LastUpdated":"5550.155688995","Type":"Float","ErrorCode":"SUCCESS",".":"0x1.a0dp-1"
#FirmwareVersion","LastUpdated":"7.888240751","Type":"String","ErrorCode":"SUCCESS",".":"tmeeks:trunk/500-0026 - New MCA Firmware@45124"
#HighVoltage","Units":"V","LastUpdated":"5884.817842035","Type":"Double","ErrorCode":"SUCCESS",".":"0x1.1c43c6p+9"
float64 last_count  # [ counts ]  # might be int...
#LiveTime","Units":"s","LastUpdated":"5885.035729243","Type":"Double","ErrorCode":"SUCCESS","Flags":"1",".":"0x1.99a4aep-3"
#RealTime","Units":"s","LastUpdated":"5885.035723368","Type":"Double","ErrorCode":"SUCCESS","Flags":"1",".":"0x1.9a57a4p-3"
float64 stab_count_rate # [ counts / s ]

bool background_valid       # [ - ]
string background_timestamp # [ - ]

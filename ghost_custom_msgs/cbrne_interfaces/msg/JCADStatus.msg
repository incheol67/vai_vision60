# Gas Message for the JCAD agent detection
std_msgs/Header header

uint16 light_mode            # Detected agent [ - ]
uint16 system_status         # System status bitmap
uint16 operating_mode        # Operating mode [ enum ]
uint16 sieve_life_remaining  # Number of hours remaining on seive [ h ]
uint16 runtime_hours         # Runtime hours [ h ]
uint16 runtime_minutes       # Runtime minutes [ mins ]
uint16 battery_bars          # Battery Bars [ 0-5 ] or external power [ 5 ]

# Operating Modes
uint16 WAIT = 1
uint16 SAMPLING = 2
uint16 FAULT = 3
uint16 MAJOR_FAULT = 4
uint16 HW_TEST = 5
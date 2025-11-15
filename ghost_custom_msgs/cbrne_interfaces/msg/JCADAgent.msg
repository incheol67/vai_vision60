# Gas Message for the JCAD agent detection
std_msgs/Header header
string id          # Detected agent [ - ]
float32 concentration  # Agent concentration [ mg/m^3 ]
uint16 bars             # Bars [ 0-8 ]
uint16 peak_bars        # Peak bars [ 0-8 ]
ValidatedFloat32 dose           # Dose [ mg/m^3 . min ]
ValidatedUint16 hazard           # Hazard level [ 0-3 ]

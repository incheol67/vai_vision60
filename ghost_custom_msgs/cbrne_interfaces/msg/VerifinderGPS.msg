# Message for the Verifinder
std_msgs/Header header

float64 latitude      # Latitude in [ deg ]
float64 longitude     # Longitude in [ deg ]
float32 elevation     # Unfiltered dose rate in [ R/h ]

float32 speed         # Speed in [ m/s ]
float32 direction     # Heading True in [ deg ]
float32 declination

float32 hdop          # Horizontal dilution of precision
float32 vdop          # Vertical dilution of precision
float32 pdop          # Position dilution of precision

int32 num_satellites  # number of satellites [ - ]
float32 t

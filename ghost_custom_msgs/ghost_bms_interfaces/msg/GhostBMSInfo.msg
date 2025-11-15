# This is a message to describe the battery info produced by the BMS board  (TI BQ76942)

std_msgs/Header header

float32 stack_voltage # [V] top of stack voltage (VC10 pin)
float32 pack_voltage  # [V] PACK pin voltage
float32 ld_voltage  # [V] Load pin voltage

float32 pack_current  # [A] filtered pack current measurement (hardware CC2 filter)

float32[10] cells_voltage  # [V] Cell 1..10 Voltages

float32[2] pack_temperature  # [deg C] External NTC thermistor measured temperature on battery external package (one on each side)
float32 dsg_fet_temperature  # [deg C] onboard SMD NTC thermistor measuring temperature near the discharge FET PCB area.
float32 chg_fet_temperature  # [deg C] onboard SMD NTC thermistor measuring temperature near the charge FET PCB area.

float32 accumulated_charge  # [Ah]  Integrated passed charge
uint32 accumulated_charge_time  # [sec]  accumulated time over which the charge has been integrated

#  Safety Status A (Reg_addr: 0x03): 
#SCD   Short Circuit in Discharge safety fault (system_status: bit 15)
uint16 SCD_BIT = 0x8000
#OCD2  Overcurrent in Discharge 2 safety fault (system_status: bit 14)
uint16 OCD2_BIT = 0x4000
#OCD1  Overcurrent in Discharge 1 safety fault (system_status: bit 13)
uint16 OCD1_BIT = 0x2000
#OCC   Overcurrent in Charge safety fault (system_status: bit 12)
uint16 OCC_BIT = 0x1000
#COV   Cell Overvoltage safety fault (system_status: bit 11)
uint16 COV_BIT = 0x0800
#CUV   Cell Undervoltage safety fault (system_status: bit 10)
uint16 CUV_BIT = 0x0400
#
##  Safety Status C (Reg_addr: 0x07):
##SCDL Latched Short Circuit in Discharge safety fault (system_status: bit 9)
uint16 SCDL_BIT = 0x0200
##OCDL Latched Overcurrent in Discharge safety fault (system_status: bit 8)
uint16 OCDL_BIT = 0x0100
#
##  Safety Status B (Reg_addr: 0x05):
##OTD  Over-temperature in Discharge safety fault (system_status: bit 7)
uint16 OTD_BIT = 0x0080
##OTC  Over-temperature in Charge safety fault (system_status: bit 6)
uint16 OTC_BIT = 0x0040
##UTD  Under-temperature in Discharge safety fault (system_status: bit 5)
uint16 UTD_BIT = 0x0020
##UTC  Under-temperature in Charge safety fault (system_status: bit 4)
uint16 UTC_BIT = 0x0010

#  FET Status (Reg_addr: 0x7F)     : 
#PDSG Indicates the status of the PDSG (Pre-discharge) FET (0: OFF; 1: ON) (system_status: bit 3)
uint16 PDSG_BIT = 0x0008
#DSG  Indicates the status of the DSG (Discharge) FET (0: OFF; 1: ON) (system_status: bit 2)
uint16 DSG_BIT = 0x0004
#PCHG Indicates the status of the PCHG (Pre-charge) FET (0: OFF; 1: ON) (system_status: bit 1)
uint16 PCHG_BIT = 0x0002
#CHG  Indicates the status of the CHG (Charge) FET (0: OFF; 1: ON) (system_status: bit 0)
uint16 CHG_BIT = 0x0001

# Status variable containing combined: Safety Status A+B+C + FET status
uint16 system_status

# True: Cyphal node online (heartbeat detected) ; False : Cyphal node offline (no heartbeat).
bool node_online



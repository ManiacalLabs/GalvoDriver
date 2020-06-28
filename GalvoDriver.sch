EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Analog_DAC:MCP4822 U2
U 1 1 5EF3F4A2
P 2550 2400
F 0 "U2" H 2550 2981 50  0000 C CNN
F 1 "MCP4822" H 2550 2890 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 3350 2100 50  0001 C CNN
F 3 "http://ww1.microchip.com/downloads/en/DeviceDoc/20002249B.pdf" H 3350 2100 50  0001 C CNN
	1    2550 2400
	1    0    0    -1  
$EndComp
$Comp
L Amplifier_Operational:TL082 U1
U 1 1 5EF41E85
P 5150 1550
F 0 "U1" H 5300 1450 50  0000 C CNN
F 1 "TL082" H 5150 1550 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 5150 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 5150 1550 50  0001 C CNN
	1    5150 1550
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL082 U1
U 2 1 5EF45C12
P 6300 1650
F 0 "U1" H 6350 1500 50  0000 C CNN
F 1 "TL082" H 6250 1650 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 6300 1650 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 6300 1650 50  0001 C CNN
	2    6300 1650
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL082 U1
U 3 1 5EF49150
P 5200 1550
F 0 "U1" H 5150 1350 50  0000 L CNN
F 1 "TL082" H 5300 1350 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 5200 1550 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 5200 1550 50  0001 C CNN
	3    5200 1550
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM_US RV2
U 1 1 5EF5492F
P 4900 2050
F 0 "RV2" V 5150 2050 50  0000 C CNN
F 1 "10K_TRIM_OFFSET" V 5250 2050 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 4900 2050 50  0001 C CNN
F 3 "~" H 4900 2050 50  0001 C CNN
	1    4900 2050
	0    -1   1    0   
$EndComp
$Comp
L Device:R_POT_TRIM_US RV1
U 1 1 5EF5511C
P 5000 1000
F 0 "RV1" V 4795 1000 50  0000 C CNN
F 1 "10K_TRIM_GAIN" V 4886 1000 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 5000 1000 50  0001 C CNN
F 3 "~" H 5000 1000 50  0001 C CNN
	1    5000 1000
	0    -1   1    0   
$EndComp
$Comp
L Device:R_US R2
U 1 1 5EF5564C
P 4200 1250
F 0 "R2" V 3995 1250 50  0000 C CNN
F 1 "1K" V 4086 1250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4240 1240 50  0001 C CNN
F 3 "~" H 4200 1250 50  0001 C CNN
	1    4200 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R1
U 1 1 5EF568E4
P 6150 1250
F 0 "R1" V 5945 1250 50  0000 C CNN
F 1 "10K" V 6036 1250 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6190 1240 50  0001 C CNN
F 3 "~" H 6150 1250 50  0001 C CNN
	1    6150 1250
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R3
U 1 1 5EF56E2E
P 5750 1550
F 0 "R3" V 5545 1550 50  0000 C CNN
F 1 "10K" V 5636 1550 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5790 1540 50  0001 C CNN
F 3 "~" H 5750 1550 50  0001 C CNN
	1    5750 1550
	0    1    1    0   
$EndComp
Text GLabel 5650 2150 2    50   Input ~ 0
GND
Wire Wire Line
	5650 2050 5650 2150
Wire Wire Line
	5450 1550 5600 1550
Wire Wire Line
	5900 1550 6000 1550
Connection ~ 6000 1550
Wire Wire Line
	6000 1250 6000 1550
Wire Wire Line
	6300 1250 6600 1250
Wire Wire Line
	6600 1250 6600 1650
Wire Wire Line
	6600 1650 6800 1650
Connection ~ 6600 1650
Wire Wire Line
	4500 1450 4850 1450
$Comp
L Device:R_US R4
U 1 1 5EF5667A
P 4700 1850
F 0 "R4" H 4632 1804 50  0000 R CNN
F 1 "47K" H 4632 1895 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4740 1840 50  0001 C CNN
F 3 "~" H 4700 1850 50  0001 C CNN
	1    4700 1850
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 2200 4550 2200
Wire Wire Line
	4550 2200 4550 1650
Wire Wire Line
	4550 1650 4850 1650
Wire Wire Line
	4750 2050 4700 2050
Wire Wire Line
	4700 2050 4700 2000
Wire Wire Line
	5100 1250 4700 1250
Wire Wire Line
	4700 1250 4700 1700
Wire Wire Line
	4850 1450 4850 1000
Connection ~ 4850 1450
Wire Wire Line
	5000 1150 5450 1150
Wire Wire Line
	5450 1150 5450 1550
Connection ~ 5450 1550
Text GLabel 5150 1250 2    50   Input ~ 0
+VIN
Text GLabel 5150 1850 2    50   Input ~ 0
-VIN
Wire Wire Line
	5150 1250 5100 1250
Connection ~ 5100 1250
Wire Wire Line
	5150 1850 5100 1850
Wire Wire Line
	6000 1750 6000 2050
Wire Wire Line
	6000 2050 5650 2050
Connection ~ 5650 2050
Wire Wire Line
	5600 1550 5600 1900
Wire Wire Line
	5600 1900 6800 1900
Connection ~ 5600 1550
Text GLabel 6800 1650 2    50   Input ~ 0
A_ILDA+
$Comp
L Amplifier_Operational:TL082 U3
U 1 1 5EFDB423
P 5150 3600
F 0 "U3" H 5300 3500 50  0000 C CNN
F 1 "TL082" H 5150 3600 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 5150 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 5150 3600 50  0001 C CNN
	1    5150 3600
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL082 U3
U 2 1 5EFDB429
P 6300 3700
F 0 "U3" H 6350 3550 50  0000 C CNN
F 1 "TL082" H 6250 3700 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 6300 3700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 6300 3700 50  0001 C CNN
	2    6300 3700
	1    0    0    1   
$EndComp
$Comp
L Device:R_POT_TRIM_US RV4
U 1 1 5EFDB435
P 4900 4100
F 0 "RV4" V 5150 4100 50  0000 C CNN
F 1 "10K_TRIM_OFFSET" V 5250 4100 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 4900 4100 50  0001 C CNN
F 3 "~" H 4900 4100 50  0001 C CNN
	1    4900 4100
	0    -1   1    0   
$EndComp
$Comp
L Device:R_POT_TRIM_US RV3
U 1 1 5EFDB43B
P 5000 3050
F 0 "RV3" V 4795 3050 50  0000 C CNN
F 1 "10K_TRIM_GAIN" V 4886 3050 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 5000 3050 50  0001 C CNN
F 3 "~" H 5000 3050 50  0001 C CNN
	1    5000 3050
	0    -1   1    0   
$EndComp
$Comp
L Device:R_US R6
U 1 1 5EFDB441
P 4200 3300
F 0 "R6" V 3995 3300 50  0000 C CNN
F 1 "1K" V 4086 3300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4240 3290 50  0001 C CNN
F 3 "~" H 4200 3300 50  0001 C CNN
	1    4200 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R5
U 1 1 5EFDB447
P 6150 3300
F 0 "R5" V 5945 3300 50  0000 C CNN
F 1 "10K" V 6036 3300 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6190 3290 50  0001 C CNN
F 3 "~" H 6150 3300 50  0001 C CNN
	1    6150 3300
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R7
U 1 1 5EFDB44D
P 5750 3600
F 0 "R7" V 5545 3600 50  0000 C CNN
F 1 "10K" V 5636 3600 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5790 3590 50  0001 C CNN
F 3 "~" H 5750 3600 50  0001 C CNN
	1    5750 3600
	0    1    1    0   
$EndComp
Text GLabel 5650 4200 2    50   Input ~ 0
GND
Wire Wire Line
	5650 4100 5650 4200
Wire Wire Line
	5450 3600 5600 3600
Wire Wire Line
	5900 3600 6000 3600
Connection ~ 6000 3600
Wire Wire Line
	6000 3300 6000 3600
Wire Wire Line
	6300 3300 6600 3300
Wire Wire Line
	6600 3300 6600 3700
Wire Wire Line
	6600 3700 6800 3700
Connection ~ 6600 3700
Wire Wire Line
	4500 3500 4850 3500
$Comp
L Device:R_US R8
U 1 1 5EFDB462
P 4700 3900
F 0 "R8" H 4632 3854 50  0000 R CNN
F 1 "47K" H 4632 3945 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4740 3890 50  0001 C CNN
F 3 "~" H 4700 3900 50  0001 C CNN
	1    4700 3900
	-1   0    0    1   
$EndComp
Wire Wire Line
	4900 4250 4550 4250
Wire Wire Line
	4550 4250 4550 3700
Wire Wire Line
	4550 3700 4850 3700
Wire Wire Line
	4750 4100 4700 4100
Wire Wire Line
	4700 4100 4700 4050
Wire Wire Line
	4700 3300 4700 3750
Wire Wire Line
	4850 3500 4850 3050
Connection ~ 4850 3500
Wire Wire Line
	5000 3200 5450 3200
Wire Wire Line
	5450 3200 5450 3600
Connection ~ 5450 3600
Text GLabel 5150 3300 2    50   Input ~ 0
+VIN
Text GLabel 5150 3900 2    50   Input ~ 0
-VIN
Wire Wire Line
	6000 3800 6000 4100
Wire Wire Line
	6000 4100 5650 4100
Connection ~ 5650 4100
Wire Wire Line
	5600 3600 5600 3950
Wire Wire Line
	5600 3950 6800 3950
Connection ~ 5600 3600
Text GLabel 6800 3950 2    50   Input ~ 0
B_ILDA-
Text GLabel 6800 3700 2    50   Input ~ 0
B_ILDA+
Text GLabel 4000 3300 0    50   Input ~ 0
DAC_B
Text GLabel 3150 2600 2    50   Input ~ 0
DAC_B
Wire Wire Line
	3150 2600 3050 2600
Text GLabel 3150 2300 2    50   Input ~ 0
DAC_A
Wire Wire Line
	3150 2300 3050 2300
$Comp
L Connector:Screw_Terminal_01x03 J1
U 1 1 5EFE26DC
P 1400 1350
F 0 "J1" H 1400 1550 50  0000 C CNN
F 1 "Screw_Terminal_01x03" V 1550 1350 50  0000 C CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_PT-3.5mm_3pol" H 1400 1350 50  0001 C CNN
F 3 "~" H 1400 1350 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/phoenix-contact/1935174/277-1578-ND/568615" H 1400 1350 50  0001 C CNN "DigiKey"
	1    1400 1350
	-1   0    0    -1  
$EndComp
Text GLabel 1700 1250 2    50   Input ~ 0
+VIN
Text GLabel 1700 1450 2    50   Input ~ 0
-VIN
Text GLabel 1700 1350 2    50   Input ~ 0
GND
Wire Wire Line
	1700 1250 1600 1250
Wire Wire Line
	1700 1350 1600 1350
Wire Wire Line
	1700 1450 1600 1450
$Comp
L Connector:Conn_01x06_Male J3
U 1 1 5EFED4AC
P 1350 2400
F 0 "J3" H 1400 2700 50  0000 C CNN
F 1 "Conn_01x06_Male" V 1250 2400 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x06_Pitch2.54mm" H 1350 2400 50  0001 C CNN
F 3 "~" H 1350 2400 50  0001 C CNN
	1    1350 2400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 2200 1900 2200
Wire Wire Line
	1900 2200 1900 2000
Wire Wire Line
	1900 2000 2550 2000
Wire Wire Line
	1550 2300 2050 2300
Wire Wire Line
	1550 2400 2050 2400
Wire Wire Line
	1550 2500 2050 2500
Wire Wire Line
	1550 2600 2050 2600
Wire Wire Line
	1550 2700 1900 2700
Wire Wire Line
	1900 2700 1900 2900
Wire Wire Line
	1900 2900 2550 2900
Text Notes 1150 3350 0    50   ~ 0
Connector Labels:\n1 - 3V3-5V\n2 - CLK\n3 - LATCH\n4 - MOSI\n5 - CS\n6 - GND
Text GLabel 7900 1650 0    50   Input ~ 0
A_ILDA+
Text GLabel 6800 1900 2    50   Input ~ 0
A_ILDA-
Text GLabel 7900 1850 0    50   Input ~ 0
A_ILDA-
Text GLabel 7900 3700 0    50   Input ~ 0
B_ILDA+
Text GLabel 7900 3900 0    50   Input ~ 0
B_ILDA-
$Comp
L power:VDD #PWR0101
U 1 1 5F007EE1
P 1900 1900
F 0 "#PWR0101" H 1900 1750 50  0001 C CNN
F 1 "VDD" H 1915 2073 50  0000 C CNN
F 2 "" H 1900 1900 50  0001 C CNN
F 3 "" H 1900 1900 50  0001 C CNN
	1    1900 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0102
U 1 1 5F0099F3
P 1900 3050
F 0 "#PWR0102" H 1900 2800 50  0001 C CNN
F 1 "GND" H 1905 2877 50  0000 C CNN
F 2 "" H 1900 3050 50  0001 C CNN
F 3 "" H 1900 3050 50  0001 C CNN
	1    1900 3050
	1    0    0    -1  
$EndComp
Text GLabel 2650 2900 2    50   Input ~ 0
GND
Wire Wire Line
	2650 2900 2550 2900
Connection ~ 2550 2900
$Comp
L power:+15V #PWR0103
U 1 1 5F012686
P 1600 1050
F 0 "#PWR0103" H 1600 900 50  0001 C CNN
F 1 "+15V" H 1615 1223 50  0000 C CNN
F 2 "" H 1600 1050 50  0001 C CNN
F 3 "" H 1600 1050 50  0001 C CNN
	1    1600 1050
	1    0    0    -1  
$EndComp
$Comp
L power:-15V #PWR0104
U 1 1 5F013021
P 1600 1650
F 0 "#PWR0104" H 1600 1750 50  0001 C CNN
F 1 "-15V" H 1615 1823 50  0000 C CNN
F 2 "" H 1600 1650 50  0001 C CNN
F 3 "" H 1600 1650 50  0001 C CNN
	1    1600 1650
	-1   0    0    1   
$EndComp
Wire Wire Line
	1600 1050 1600 1250
Connection ~ 1600 1250
Wire Wire Line
	1600 1650 1600 1450
Connection ~ 1600 1450
NoConn ~ 5150 1000
NoConn ~ 5150 3050
$Comp
L Amplifier_Operational:TL082 U3
U 3 1 5EFDB42F
P 5200 3600
F 0 "U3" H 5150 3400 50  0000 L CNN
F 1 "TL082" H 5300 3400 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 5200 3600 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 5200 3600 50  0001 C CNN
	3    5200 3600
	1    0    0    -1  
$EndComp
Wire Wire Line
	5150 3300 5100 3300
Wire Wire Line
	5100 3300 4700 3300
Connection ~ 5100 3300
Wire Wire Line
	5150 3900 5100 3900
Wire Wire Line
	1900 3050 1900 2900
Connection ~ 1900 2900
Wire Wire Line
	1900 1900 1900 2000
Connection ~ 1900 2000
Wire Wire Line
	5050 2050 5650 2050
Wire Wire Line
	5050 4100 5650 4100
$Comp
L pspice:C C1
U 1 1 5EF573EB
P 2550 3350
F 0 "C1" V 2865 3350 50  0000 C CNN
F 1 "1uF" V 2774 3350 50  0000 C CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2550 3350 50  0001 C CNN
F 3 "~" H 2550 3350 50  0001 C CNN
	1    2550 3350
	0    -1   -1   0   
$EndComp
Text GLabel 2650 2000 2    50   Input ~ 0
VDD
Wire Wire Line
	2650 2000 2550 2000
Connection ~ 2550 2000
Text GLabel 2250 3350 0    50   Input ~ 0
VDD
Text GLabel 2850 3350 2    50   Input ~ 0
GND
Wire Wire Line
	2250 3350 2300 3350
Wire Wire Line
	2850 3350 2800 3350
Text GLabel 1900 3950 2    50   Input ~ 0
AUDIO_R
Text GLabel 1900 3850 2    50   Input ~ 0
GND
Text GLabel 1900 4050 2    50   Input ~ 0
AUDIO_L
Text GLabel 4000 1650 0    50   Input ~ 0
AUDIO_L
$Comp
L Connector:AudioJack3 J6
U 1 1 5EF780C5
P 1600 3950
F 0 "J6" H 1550 4300 50  0000 C CNN
F 1 "AudioJack3" H 1550 4200 50  0000 C CNN
F 2 "Connector_Audio:Jack_3.5mm_CUI_SJ1-3533NG_Horizontal" H 1650 3650 50  0000 C CNN
F 3 "https://www.cuidevices.com/product/resource/sj1-353xng.pdf" H 1600 3950 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/cui-devices/SJ1-3533NG/CP1-3533NG-ND/738701" H 1600 3950 50  0001 C CNN "DigiKey"
	1    1600 3950
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 3850 1800 3850
Wire Wire Line
	1800 3950 1900 3950
Wire Wire Line
	1900 4050 1800 4050
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 5EF8C738
P 4300 3500
F 0 "J5" H 4408 3781 50  0000 C CNN
F 1 "JUMPER_B" H 4050 3500 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4300 3500 50  0001 C CNN
F 3 "~" H 4300 3500 50  0001 C CNN
	1    4300 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R10
U 1 1 5EF8DED2
P 4200 3700
F 0 "R10" V 4300 3700 50  0000 C CNN
F 1 "330" V 4400 3700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4240 3690 50  0001 C CNN
F 3 "~" H 4200 3700 50  0001 C CNN
	1    4200 3700
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 3300 4500 3300
Wire Wire Line
	4500 3300 4500 3400
Wire Wire Line
	4000 3300 4050 3300
Wire Wire Line
	4350 3700 4500 3700
Wire Wire Line
	4500 3700 4500 3600
Wire Wire Line
	4000 3700 4050 3700
Text GLabel 4000 1250 0    50   Input ~ 0
DAC_A
Text GLabel 4000 3700 0    50   Input ~ 0
AUDIO_R
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5EFA8C44
P 4300 1450
F 0 "J4" H 4408 1731 50  0000 C CNN
F 1 "JUMPER_A" H 4050 1450 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 4300 1450 50  0001 C CNN
F 3 "~" H 4300 1450 50  0001 C CNN
	1    4300 1450
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R9
U 1 1 5EFA8C4A
P 4200 1650
F 0 "R9" V 4300 1650 50  0000 C CNN
F 1 "330" V 4400 1650 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4240 1640 50  0001 C CNN
F 3 "~" H 4200 1650 50  0001 C CNN
	1    4200 1650
	0    1    1    0   
$EndComp
Wire Wire Line
	4350 1250 4500 1250
Wire Wire Line
	4000 1250 4050 1250
Wire Wire Line
	4350 1650 4500 1650
Wire Wire Line
	4000 1650 4050 1650
Wire Wire Line
	4500 1650 4500 1550
Wire Wire Line
	4500 1250 4500 1350
Wire Notes Line
	7300 2500 3550 2500
Wire Notes Line
	3550 2500 3550 750 
Wire Notes Line
	3550 750  7300 750 
Wire Notes Line
	7300 750  7300 2500
Wire Notes Line
	3550 2800 7300 2800
Wire Notes Line
	7300 2800 7300 4550
Wire Notes Line
	7300 4550 3550 4550
Wire Notes Line
	3550 4550 3550 2800
Text Notes 3600 2900 0    50   ~ 0
Y Axis Control
Text Notes 3600 850  0    50   ~ 0
X Axis Control
Text GLabel 7900 1750 0    50   Input ~ 0
GND
Text GLabel 7900 3800 0    50   Input ~ 0
GND
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5EF7E5A3
P 8200 1750
F 0 "J2" H 8280 1792 50  0000 L CNN
F 1 "Conn_01x03" H 8280 1701 50  0000 L CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 8200 1750 50  0001 C CNN
F 3 "~" H 8200 1750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/jst-sales-america-inc/XHP-3/455-2219-ND/1651017" H 8200 1750 50  0001 C CNN "DigiKey"
	1    8200 1750
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5EF7EEC3
P 8200 3800
F 0 "J7" H 8280 3842 50  0000 L CNN
F 1 "Conn_01x03" H 8280 3751 50  0000 L CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 8200 3800 50  0001 C CNN
F 3 "~" H 8200 3800 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/jst-sales-america-inc/XHP-3/455-2219-ND/1651017" H 8200 3800 50  0001 C CNN "DigiKey"
	1    8200 3800
	1    0    0    -1  
$EndComp
Wire Wire Line
	7900 1650 8000 1650
Wire Wire Line
	7900 1750 8000 1750
Wire Wire Line
	7900 1850 8000 1850
Wire Wire Line
	7900 3700 8000 3700
Wire Wire Line
	7900 3800 8000 3800
Wire Wire Line
	7900 3900 8000 3900
$EndSCHEMATC

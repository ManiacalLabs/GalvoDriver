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
P 5900 2700
F 0 "U1" H 6050 2600 50  0000 C CNN
F 1 "TL082" H 5900 2700 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 5900 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 5900 2700 50  0001 C CNN
	1    5900 2700
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL082 U1
U 2 1 5EF45C12
P 7050 2800
F 0 "U1" H 7100 2650 50  0000 C CNN
F 1 "TL082" H 7000 2800 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 7050 2800 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 7050 2800 50  0001 C CNN
	2    7050 2800
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL082 U1
U 3 1 5EF49150
P 5950 2700
F 0 "U1" H 5900 2500 50  0000 L CNN
F 1 "TL082" H 6050 2500 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 5950 2700 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 5950 2700 50  0001 C CNN
	3    5950 2700
	1    0    0    -1  
$EndComp
$Comp
L Device:R_POT_TRIM_US RV2
U 1 1 5EF5492F
P 5650 3200
F 0 "RV2" V 5900 3200 50  0000 C CNN
F 1 "10K_TRIM_OFFSET" V 6000 3200 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 5650 3200 50  0001 C CNN
F 3 "~" H 5650 3200 50  0001 C CNN
	1    5650 3200
	0    -1   1    0   
$EndComp
$Comp
L Device:R_POT_TRIM_US RV1
U 1 1 5EF5511C
P 5750 2150
F 0 "RV1" V 5545 2150 50  0000 C CNN
F 1 "10K_TRIM_GAIN" V 5636 2150 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 5750 2150 50  0001 C CNN
F 3 "~" H 5750 2150 50  0001 C CNN
	1    5750 2150
	0    -1   1    0   
$EndComp
$Comp
L Device:R_US R2
U 1 1 5EF5564C
P 4950 2400
F 0 "R2" V 4745 2400 50  0000 C CNN
F 1 "1K" V 4836 2400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4990 2390 50  0001 C CNN
F 3 "~" H 4950 2400 50  0001 C CNN
	1    4950 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R1
U 1 1 5EF568E4
P 6900 2400
F 0 "R1" V 6695 2400 50  0000 C CNN
F 1 "10K" V 6786 2400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6940 2390 50  0001 C CNN
F 3 "~" H 6900 2400 50  0001 C CNN
	1    6900 2400
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R3
U 1 1 5EF56E2E
P 6500 2700
F 0 "R3" V 6295 2700 50  0000 C CNN
F 1 "10K" V 6386 2700 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6540 2690 50  0001 C CNN
F 3 "~" H 6500 2700 50  0001 C CNN
	1    6500 2700
	0    1    1    0   
$EndComp
Text GLabel 6400 3300 2    50   Input ~ 0
GND
Wire Wire Line
	6400 3200 6400 3300
Wire Wire Line
	6200 2700 6350 2700
Wire Wire Line
	6650 2700 6750 2700
Connection ~ 6750 2700
Wire Wire Line
	6750 2400 6750 2700
Wire Wire Line
	7050 2400 7350 2400
Wire Wire Line
	7350 2400 7350 2800
Wire Wire Line
	7350 2800 7550 2800
Connection ~ 7350 2800
Wire Wire Line
	5250 2600 5600 2600
$Comp
L Device:R_US R4
U 1 1 5EF5667A
P 5450 3000
F 0 "R4" H 5382 2954 50  0000 R CNN
F 1 "47K" H 5382 3045 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5490 2990 50  0001 C CNN
F 3 "~" H 5450 3000 50  0001 C CNN
	1    5450 3000
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 3350 5300 3350
Wire Wire Line
	5300 3350 5300 2800
Wire Wire Line
	5300 2800 5600 2800
Wire Wire Line
	5500 3200 5450 3200
Wire Wire Line
	5450 3200 5450 3150
Wire Wire Line
	5850 2400 5450 2400
Wire Wire Line
	5450 2400 5450 2850
Wire Wire Line
	5600 2600 5600 2150
Connection ~ 5600 2600
Wire Wire Line
	5750 2300 6200 2300
Wire Wire Line
	6200 2300 6200 2700
Connection ~ 6200 2700
Text GLabel 5900 2400 2    50   Input ~ 0
+VIN
Text GLabel 5900 3000 2    50   Input ~ 0
-VIN
Wire Wire Line
	5900 2400 5850 2400
Connection ~ 5850 2400
Wire Wire Line
	5900 3000 5850 3000
Wire Wire Line
	6750 2900 6750 3200
Wire Wire Line
	6750 3200 6400 3200
Connection ~ 6400 3200
Wire Wire Line
	6350 2700 6350 3050
Wire Wire Line
	6350 3050 7550 3050
Connection ~ 6350 2700
Text GLabel 7550 2800 2    50   Input ~ 0
A_ILDA+
$Comp
L Amplifier_Operational:TL082 U3
U 1 1 5EFDB423
P 5900 4750
F 0 "U3" H 6050 4650 50  0000 C CNN
F 1 "TL082" H 5900 4750 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 5900 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 5900 4750 50  0001 C CNN
	1    5900 4750
	1    0    0    1   
$EndComp
$Comp
L Amplifier_Operational:TL082 U3
U 2 1 5EFDB429
P 7050 4850
F 0 "U3" H 7100 4700 50  0000 C CNN
F 1 "TL082" H 7000 4850 50  0000 C CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 7050 4850 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 7050 4850 50  0001 C CNN
	2    7050 4850
	1    0    0    1   
$EndComp
$Comp
L Device:R_POT_TRIM_US RV4
U 1 1 5EFDB435
P 5650 5250
F 0 "RV4" V 5900 5250 50  0000 C CNN
F 1 "10K_TRIM_OFFSET" V 6000 5250 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 5650 5250 50  0001 C CNN
F 3 "~" H 5650 5250 50  0001 C CNN
	1    5650 5250
	0    -1   1    0   
$EndComp
$Comp
L Device:R_POT_TRIM_US RV3
U 1 1 5EFDB43B
P 5750 4200
F 0 "RV3" V 5545 4200 50  0000 C CNN
F 1 "10K_TRIM_GAIN" V 5636 4200 50  0000 C CNN
F 2 "Potentiometers:Potentiometer_Trimmer_Bourns_3296W" H 5750 4200 50  0001 C CNN
F 3 "~" H 5750 4200 50  0001 C CNN
	1    5750 4200
	0    -1   1    0   
$EndComp
$Comp
L Device:R_US R6
U 1 1 5EFDB441
P 4950 4450
F 0 "R6" V 4745 4450 50  0000 C CNN
F 1 "1K" V 4836 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4990 4440 50  0001 C CNN
F 3 "~" H 4950 4450 50  0001 C CNN
	1    4950 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R5
U 1 1 5EFDB447
P 6900 4450
F 0 "R5" V 6695 4450 50  0000 C CNN
F 1 "10K" V 6786 4450 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6940 4440 50  0001 C CNN
F 3 "~" H 6900 4450 50  0001 C CNN
	1    6900 4450
	0    1    1    0   
$EndComp
$Comp
L Device:R_US R7
U 1 1 5EFDB44D
P 6500 4750
F 0 "R7" V 6295 4750 50  0000 C CNN
F 1 "10K" V 6386 4750 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6540 4740 50  0001 C CNN
F 3 "~" H 6500 4750 50  0001 C CNN
	1    6500 4750
	0    1    1    0   
$EndComp
Text GLabel 6400 5350 2    50   Input ~ 0
GND
Wire Wire Line
	6400 5250 6400 5350
Wire Wire Line
	6200 4750 6350 4750
Wire Wire Line
	6650 4750 6750 4750
Connection ~ 6750 4750
Wire Wire Line
	6750 4450 6750 4750
Wire Wire Line
	7050 4450 7350 4450
Wire Wire Line
	7350 4450 7350 4850
Wire Wire Line
	7350 4850 7550 4850
Connection ~ 7350 4850
Wire Wire Line
	5250 4650 5600 4650
$Comp
L Device:R_US R8
U 1 1 5EFDB462
P 5450 5050
F 0 "R8" H 5382 5004 50  0000 R CNN
F 1 "47K" H 5382 5095 50  0000 R CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5490 5040 50  0001 C CNN
F 3 "~" H 5450 5050 50  0001 C CNN
	1    5450 5050
	-1   0    0    1   
$EndComp
Wire Wire Line
	5650 5400 5300 5400
Wire Wire Line
	5300 5400 5300 4850
Wire Wire Line
	5300 4850 5600 4850
Wire Wire Line
	5500 5250 5450 5250
Wire Wire Line
	5450 5250 5450 5200
Wire Wire Line
	5450 4450 5450 4900
Wire Wire Line
	5600 4650 5600 4200
Connection ~ 5600 4650
Wire Wire Line
	5750 4350 6200 4350
Wire Wire Line
	6200 4350 6200 4750
Connection ~ 6200 4750
Text GLabel 5900 4450 2    50   Input ~ 0
+VIN
Text GLabel 5900 5050 2    50   Input ~ 0
-VIN
Wire Wire Line
	6750 4950 6750 5250
Wire Wire Line
	6750 5250 6400 5250
Connection ~ 6400 5250
Wire Wire Line
	6350 4750 6350 5100
Wire Wire Line
	6350 5100 7550 5100
Connection ~ 6350 4750
Text GLabel 7550 5100 2    50   Input ~ 0
B_ILDA-
Text GLabel 7550 4850 2    50   Input ~ 0
B_ILDA+
Text GLabel 4750 4450 0    50   Input ~ 0
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
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS1.5-3pol" H 1400 1350 50  0001 C CNN
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
Wire Wire Line
	1900 2900 2000 2900
Text Notes 700  3900 0    50   ~ 0
Connector Labels:\n1 - 3V3-5V\n2 - CLK\n3 - MOSI\n4 - LASER\n5 - GND
Text GLabel 8650 2800 0    50   Input ~ 0
A_ILDA+
Text GLabel 7550 3050 2    50   Input ~ 0
A_ILDA-
Text GLabel 8650 3000 0    50   Input ~ 0
A_ILDA-
Text GLabel 8650 4850 0    50   Input ~ 0
B_ILDA+
Text GLabel 8650 5050 0    50   Input ~ 0
B_ILDA-
$Comp
L power:VDD #PWR0101
U 1 1 5F007EE1
P 3200 3900
F 0 "#PWR0101" H 3200 3750 50  0001 C CNN
F 1 "VDD" H 3215 4073 50  0000 C CNN
F 2 "" H 3200 3900 50  0001 C CNN
F 3 "" H 3200 3900 50  0001 C CNN
	1    3200 3900
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
NoConn ~ 5900 2150
NoConn ~ 5900 4200
$Comp
L Amplifier_Operational:TL082 U3
U 3 1 5EFDB42F
P 5950 4750
F 0 "U3" H 5900 4550 50  0000 L CNN
F 1 "TL082" H 6050 4550 50  0000 L CNN
F 2 "Housings_DIP:DIP-8_W7.62mm_Socket" H 5950 4750 50  0001 C CNN
F 3 "http://www.ti.com/lit/ds/symlink/tl081.pdf" H 5950 4750 50  0001 C CNN
	3    5950 4750
	1    0    0    -1  
$EndComp
Wire Wire Line
	5900 4450 5850 4450
Wire Wire Line
	5850 4450 5450 4450
Connection ~ 5850 4450
Wire Wire Line
	5900 5050 5850 5050
Wire Wire Line
	1900 3050 1900 2900
Wire Wire Line
	5800 3200 6400 3200
Wire Wire Line
	5800 5250 6400 5250
$Comp
L pspice:C C1
U 1 1 5EF573EB
P 2550 3350
F 0 "C1" V 2865 3350 50  0000 C CNN
F 1 ".1uF" V 2774 3350 50  0000 C CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2550 3350 50  0001 C CNN
F 3 "~" H 2550 3350 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/vishay-bc-components/K104Z15Y5VF5TL2/BC1160CT-ND/286782" V 2550 3350 50  0001 C CNN "DigiKey"
	1    2550 3350
	0    -1   -1   0   
$EndComp
Text GLabel 2650 2000 2    50   Input ~ 0
VDD
Wire Wire Line
	2650 2000 2550 2000
Text GLabel 2250 3350 0    50   Input ~ 0
VDD
Text GLabel 2850 3350 2    50   Input ~ 0
GND
Wire Wire Line
	2250 3350 2300 3350
Wire Wire Line
	2850 3350 2800 3350
Text GLabel 2600 6550 2    50   Input ~ 0
AUDIO_R
Text GLabel 2600 6450 2    50   Input ~ 0
GND
Text GLabel 2600 6650 2    50   Input ~ 0
AUDIO_L
Text GLabel 4750 2800 0    50   Input ~ 0
AUDIO_L
$Comp
L Connector:AudioJack3 J6
U 1 1 5EF780C5
P 2300 6550
F 0 "J6" H 2250 6900 50  0000 C CNN
F 1 "AudioJack3" H 2250 6800 50  0000 C CNN
F 2 "Connector_Audio:Jack_3.5mm_CUI_SJ1-3533NG_Horizontal" H 2350 6250 50  0000 C CNN
F 3 "https://www.cuidevices.com/product/resource/sj1-353xng.pdf" H 2300 6550 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/cui-devices/SJ1-3533NG/CP1-3533NG-ND/738701" H 2300 6550 50  0001 C CNN "DigiKey"
	1    2300 6550
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 6450 2500 6450
Wire Wire Line
	2500 6550 2600 6550
Wire Wire Line
	2600 6650 2500 6650
$Comp
L Connector:Conn_01x03_Male J5
U 1 1 5EF8C738
P 5050 4650
F 0 "J5" H 5158 4931 50  0000 C CNN
F 1 "JUMPER_B" H 4800 4650 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5050 4650 50  0001 C CNN
F 3 "~" H 5050 4650 50  0001 C CNN
	1    5050 4650
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R10
U 1 1 5EF8DED2
P 4950 4850
F 0 "R10" V 5050 4850 50  0000 C CNN
F 1 "330" V 5150 4850 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4990 4840 50  0001 C CNN
F 3 "~" H 4950 4850 50  0001 C CNN
	1    4950 4850
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 4450 5250 4450
Wire Wire Line
	5250 4450 5250 4550
Wire Wire Line
	4750 4450 4800 4450
Wire Wire Line
	5100 4850 5250 4850
Wire Wire Line
	5250 4850 5250 4750
Wire Wire Line
	4750 4850 4800 4850
Text GLabel 4750 2400 0    50   Input ~ 0
DAC_A
Text GLabel 4750 4850 0    50   Input ~ 0
AUDIO_R
$Comp
L Connector:Conn_01x03_Male J4
U 1 1 5EFA8C44
P 5050 2600
F 0 "J4" H 5158 2881 50  0000 C CNN
F 1 "JUMPER_A" H 4800 2600 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x03_Pitch2.54mm" H 5050 2600 50  0001 C CNN
F 3 "~" H 5050 2600 50  0001 C CNN
	1    5050 2600
	1    0    0    -1  
$EndComp
$Comp
L Device:R_US R9
U 1 1 5EFA8C4A
P 4950 2800
F 0 "R9" V 5050 2800 50  0000 C CNN
F 1 "330" V 5150 2800 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4990 2790 50  0001 C CNN
F 3 "~" H 4950 2800 50  0001 C CNN
	1    4950 2800
	0    1    1    0   
$EndComp
Wire Wire Line
	5100 2400 5250 2400
Wire Wire Line
	4750 2400 4800 2400
Wire Wire Line
	5100 2800 5250 2800
Wire Wire Line
	4750 2800 4800 2800
Wire Wire Line
	5250 2800 5250 2700
Wire Wire Line
	5250 2400 5250 2500
Wire Notes Line
	8050 3650 4300 3650
Wire Notes Line
	4300 3650 4300 1900
Wire Notes Line
	4300 1900 8050 1900
Wire Notes Line
	8050 1900 8050 3650
Wire Notes Line
	4300 3950 8050 3950
Wire Notes Line
	8050 3950 8050 5700
Wire Notes Line
	8050 5700 4300 5700
Wire Notes Line
	4300 5700 4300 3950
Text Notes 4350 4050 0    50   ~ 0
Y Axis Control
Text Notes 4350 2000 0    50   ~ 0
X Axis Control
Text GLabel 8650 2900 0    50   Input ~ 0
GND
Text GLabel 8650 4950 0    50   Input ~ 0
GND
$Comp
L Connector_Generic:Conn_01x03 J2
U 1 1 5EF7E5A3
P 8950 2900
F 0 "J2" H 9030 2942 50  0000 L CNN
F 1 "Conn_01x03" H 9030 2851 50  0000 L CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 8950 2900 50  0001 C CNN
F 3 "~" H 8950 2900 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/jst-sales-america-inc/XHP-3/455-2219-ND/1651017" H 8950 2900 50  0001 C CNN "DigiKey"
	1    8950 2900
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x03 J7
U 1 1 5EF7EEC3
P 8950 4950
F 0 "J7" H 9030 4992 50  0000 L CNN
F 1 "Conn_01x03" H 9030 4901 50  0000 L CNN
F 2 "Connectors_JST:JST_XH_B03B-XH-A_03x2.50mm_Straight" H 8950 4950 50  0001 C CNN
F 3 "~" H 8950 4950 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/jst-sales-america-inc/XHP-3/455-2219-ND/1651017" H 8950 4950 50  0001 C CNN "DigiKey"
	1    8950 4950
	1    0    0    -1  
$EndComp
Wire Wire Line
	8650 2800 8750 2800
Wire Wire Line
	8650 2900 8750 2900
Wire Wire Line
	8650 3000 8750 3000
Wire Wire Line
	8650 4850 8750 4850
Wire Wire Line
	8650 4950 8750 4950
Wire Wire Line
	8650 5050 8750 5050
$Comp
L Connector:Screw_Terminal_01x04 J8
U 1 1 5F05CC23
P 6100 750
F 0 "J8" V 6100 1000 50  0000 R CNN
F 1 "Screw_Terminal_01x04" V 6200 1300 50  0000 R CNN
F 2 "TerminalBlocks_Phoenix:TerminalBlock_Phoenix_MKDS1.5-4pol" H 6100 750 50  0001 C CNN
F 3 "~" H 6100 750 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/phoenix-contact/1935187/277-1579-ND/568616" V 6100 750 50  0001 C CNN "DigiKey"
	1    6100 750 
	0    1    -1   0   
$EndComp
$Comp
L Transistor_BJT:PN2222A Q1
U 1 1 5F05E435
P 6100 1400
F 0 "Q1" H 6290 1446 50  0000 L CNN
F 1 "PN2222A" H 6290 1355 50  0000 L CNN
F 2 "TO_SOT_Packages_THT:TO-92_Inline_Wide" H 6300 1325 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/PN/PN2222A.pdf" H 6100 1400 50  0001 L CNN
	1    6100 1400
	1    0    0    -1  
$EndComp
Text GLabel 5500 1400 0    50   Input ~ 0
LASER
$Comp
L Device:R_US R11
U 1 1 5F0ACE6F
P 5700 1400
F 0 "R11" V 5600 1400 50  0000 C CNN
F 1 "100" V 5800 1400 50  0000 C CNN
F 2 "Resistors_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 5740 1390 50  0001 C CNN
F 3 "~" H 5700 1400 50  0001 C CNN
	1    5700 1400
	0    1    1    0   
$EndComp
Text GLabel 5900 1100 0    50   Input ~ 0
GND
Wire Wire Line
	6000 950  6000 1100
Wire Wire Line
	5900 1100 6000 1100
Wire Wire Line
	5900 950  5900 1000
Wire Wire Line
	5900 1000 6100 1000
Wire Wire Line
	6100 1000 6100 950 
Wire Wire Line
	6200 950  6200 1200
Text GLabel 6250 1700 2    50   Input ~ 0
GND
Wire Wire Line
	6200 1600 6200 1700
Wire Wire Line
	6200 1700 6250 1700
Wire Wire Line
	5500 1400 5550 1400
Wire Wire Line
	5850 1400 5900 1400
Text Notes 6350 1250 0    50   ~ 0
Connector Labels:\n4 - V+\n3 - GND\n2 - Laser +\n1 - Laser -
Wire Notes Line
	5150 550  7200 550 
Wire Notes Line
	7200 550  7200 1800
Wire Notes Line
	7200 1800 5150 1800
Wire Notes Line
	5150 1800 5150 550 
Text Notes 5200 750  0    50   ~ 0
Laser Module\nControl
$Comp
L power:VSS #PWR01
U 1 1 5F0F04AF
P 5750 850
F 0 "#PWR01" H 5750 700 50  0001 C CNN
F 1 "VSS" H 5650 950 50  0000 C CNN
F 2 "" H 5750 850 50  0001 C CNN
F 3 "" H 5750 850 50  0001 C CNN
	1    5750 850 
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 850  5750 950 
Wire Wire Line
	5750 950  5900 950 
Connection ~ 5900 950 
$Comp
L 74ahc125:74AHC125 U4
U 1 1 5F28DEB8
P 2550 4650
F 0 "U4" H 2550 4750 50  0000 C CNN
F 1 "74AHC125" H 2550 4650 50  0000 C CNN
F 2 "Housings_DIP:DIP-14_W7.62mm_Socket" H 2550 4650 60  0001 C CNN
F 3 "http://www.ti.com/general/docs/suppproductinfo.tsp?distId=10&gotoUrl=http%3A%2F%2Fwww.ti.com%2Flit%2Fgpn%2Fsn74ahc125" H 2550 4650 60  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/texas-instruments/SN74AHC125N/296-4531-5-ND/375724" H 2550 4650 50  0001 C CNN "DigiKey"
	1    2550 4650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2400 2000 2400
Wire Wire Line
	2000 2400 2000 2900
Connection ~ 2000 2900
Wire Wire Line
	2000 2900 2050 2900
Wire Wire Line
	2050 2600 2050 2900
Connection ~ 2050 2900
Wire Wire Line
	2050 2900 2550 2900
$Comp
L Connector:Conn_01x05_Male J3
U 1 1 5F2A1C2E
P 1200 4400
F 0 "J3" H 1308 4781 50  0000 C CNN
F 1 "Conn_01x05_Male" H 1308 4690 50  0000 C CNN
F 2 "Pin_Headers:Pin_Header_Straight_1x05_Pitch2.54mm" H 1200 4400 50  0001 C CNN
F 3 "~" H 1200 4400 50  0001 C CNN
	1    1200 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	1900 4250 1800 4250
Wire Wire Line
	1800 5400 3300 5400
Wire Wire Line
	3300 5400 3300 5200
Wire Wire Line
	3300 5200 3200 5200
Text GLabel 3350 5400 2    50   Input ~ 0
GND
Wire Wire Line
	3300 5400 3350 5400
Connection ~ 3300 5400
Wire Wire Line
	1800 4250 1800 4550
Wire Wire Line
	3200 4100 3200 3900
Wire Wire Line
	1750 5150 1900 5150
Wire Wire Line
	1900 4850 1750 4850
Wire Wire Line
	1750 4850 1750 5150
Wire Wire Line
	1800 4550 1900 4550
Connection ~ 1800 4550
Wire Wire Line
	1800 4550 1800 4750
Wire Wire Line
	1400 4300 1700 4300
Wire Wire Line
	1700 4300 1700 4150
Wire Wire Line
	1700 4150 1900 4150
Text GLabel 1450 4500 2    50   Input ~ 0
LASER
Wire Wire Line
	1400 4600 1400 5400
Wire Wire Line
	1400 5400 1800 5400
Connection ~ 1800 5400
Wire Wire Line
	1400 4200 1650 4200
Wire Wire Line
	1650 4200 1650 3900
Text GLabel 3250 3900 2    50   Input ~ 0
VDD
Wire Wire Line
	3200 3900 3250 3900
Connection ~ 3200 3900
NoConn ~ 3200 4800
NoConn ~ 3200 4700
Connection ~ 1750 4850
Wire Wire Line
	1650 3900 1750 3900
Wire Wire Line
	3200 3900 1750 3900
Connection ~ 1750 3900
Wire Wire Line
	1750 3900 1750 4850
Wire Wire Line
	1400 4500 1450 4500
Wire Wire Line
	1850 4400 1850 4450
Wire Wire Line
	1850 4450 1900 4450
Wire Wire Line
	1400 4400 1850 4400
Text GLabel 3300 4500 2    50   Input ~ 0
CLK
Wire Wire Line
	3200 4500 3300 4500
Text GLabel 3300 4600 2    50   Input ~ 0
MOSI
Wire Wire Line
	3300 4600 3200 4600
Text GLabel 1850 2300 0    50   Input ~ 0
CLK
Text GLabel 1850 2500 0    50   Input ~ 0
MOSI
Wire Wire Line
	1850 2300 2050 2300
Wire Wire Line
	1850 2500 2050 2500
Wire Wire Line
	1900 4750 1800 4750
Connection ~ 1800 4750
Wire Wire Line
	1800 4750 1800 5050
Wire Wire Line
	1900 5050 1800 5050
Connection ~ 1800 5050
Wire Wire Line
	1800 5050 1800 5400
$Comp
L pspice:C C2
U 1 1 5F4AEBB5
P 2550 5700
F 0 "C2" V 2865 5700 50  0000 C CNN
F 1 ".1uF" V 2774 5700 50  0000 C CNN
F 2 "Capacitors_THT:C_Disc_D5.0mm_W2.5mm_P2.50mm" H 2550 5700 50  0001 C CNN
F 3 "~" H 2550 5700 50  0001 C CNN
F 4 "https://www.digikey.com/product-detail/en/vishay-bc-components/K104Z15Y5VF5TL2/BC1160CT-ND/286782" V 2550 5700 50  0001 C CNN "DigiKey"
	1    2550 5700
	0    -1   -1   0   
$EndComp
Text GLabel 2250 5700 0    50   Input ~ 0
VDD
Text GLabel 2850 5700 2    50   Input ~ 0
GND
Wire Wire Line
	2250 5700 2300 5700
Wire Wire Line
	2850 5700 2800 5700
$EndSCHEMATC

# Beluga raspberry pi serial to MQTT interface program

##  Overview

rpi-mqtt-logger is a python program that runs on raspberry pi connected with DWM1001-DEV board to read serial data then publish on MQTT.
DWM1001-DEV board has build-in raspberry pi connectors. By simply connecting raspberry pi with the board, users can retrive Beluga nodes ranging information on MQTT.

Program operations:

	1. The program read the serial output from Beluga
	2. Format and timestamp serial messages
	3. Publish messages on MQTT

*Please change the MQTT network settings, topic, and formatting process depending on the application*


  

    
  
  


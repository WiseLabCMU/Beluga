import serial
import io
import time
import paho.mqtt.client as mqtt
import json
from datetime import date, datetime

# This script will take data from the Beluga DW firmware and log it to MQTT
# It assumes the node is set to automatically startup in streaming mode with
# the correctly set Address and polling rate.
#
# This is setup to work with the DW MDEK1001 Dev Kit connected to an RPI
# TODO: Have this script configure the node each time

# Python 2 (not 3)
# pip install pyserial
# pip install paho-mqtt

# This is the mqtt target, currently setup for ARENA
MQTT_TOPIC = "realm/g/uwb"
# Set this value to the device's source address
# In the future parse this from node itself
UWB_SRC_ADDR = "1"

ser = serial.Serial('/dev/ttyS0',115200,timeout=1)

# make a unique mqtt client ID based on the src address
clientID="pi"+UWB_SRC_ADDR
print("Starting " + clientID )
mqttc = mqtt.Client(clientID)
mqttc.connect("oz.andrew.cmu.edu")
mqttc.loop_start()

while True:
        # Load the time
	millis = int(round(time.time() * 1000))
        # convert to UTC (maybe a bug with the Z flag?)
	timeStr = json.dumps(datetime.utcnow().isoformat())
        timeStr = timeStr.strip('"')
        line = ser.readline()
	lineDict = line.split(',')
        # make sure you have enough parameters parse, occassionally we saw short reads or junk
        if len(lineDict)>3:
            srcID = UWB_SRC_ADDR
            dstID = lineDict[0]
            dstID=dstID.strip()
            distance = lineDict[1]
            distance=distance.strip()
            rssi = lineDict[2]
            rssi=rssi.strip()
            counter = lineDict[3]
            counter=counter.strip()
            # double check that its not a comment line coming from the device
            if "#" not in line:	
                uwb_dict = {'object_type':'UWB','src':srcID,'dst':dstID,'distance':distance,'ble_rssi':rssi, 'timestamp':timeStr, 'counter':counter}
                uwb_json = json.dumps(uwb_dict)
                print( uwb_json) 
                mqttc.publish(MQTT_TOPIC,uwb_json)

# Beluga phone SLAM app

##  Overview

This folder contains Beluga phone SLAM related programs. The Beluga phone SLAM app can perform indoor localization by processing the ranging information between Beluga devices and visualize the location with AR.
DEMO video: [Beluga phone SLAM](https://youtu.be/Jkrw4aM9-sI)


## Project Structure

    SLAM_app/
    ├── BelugaSLAM.apk   // App installation file
    ├── socket.py        // Socket interface program
    └── README.md        

## How to install the app on your phone

Use git or HTTPS download the apk file and upload the file to your personal cloud storage. Access the file on your phone, then the system will install the app. 


## How to use the app

*Users have to setup the Beluga devices properly before using the app*
*Plase put serveral anchor devices (>= 3) in the experimental space and one mobile device attached on the phone.*
*Label and remeber the devices ID. Devices properities such as ID can be configured by entering AT commands through serial line*

1. Click the select device button on the top right corner
2. Select the mobile device attached on your phone
3. Wait until the "BLE connectted: BN + $device number" message pop up
4. Move around in the experimental space to perform indoor SLAM
5. An android icon should be placed and adjusted on each device while you are moving

-------

6. (optional) Run the socket interface program on computer to get the phone location for debugging use
7. (optional) When exiting the app, the app will automatically store the VIO, anchor location, RSSI, and phone location logging data on the device in internal storage/Documents/arslam/. NOTE: Plase wait a few second when closing the app to let your phone to store the data.
8. (optional) The anchor devices' location will be stored as YearMonthDateTime_bcn.json file (for example, 20201101000000_bcn.json). Users can load and utilize the json file for furthur use. 


## Socket interface program

socket is a python program that runs on computers to create socket connection with Beluga phone SLAM app. Users can change the IP address and port based on the numbers shown on the app. The phone app will send the phone location through socket and print on the screen. 

*Please change the socket network settings before using this program*
  

    
  
  


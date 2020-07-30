# Beluga

*Decawave DWM1001-DEV board firmware for building ad-hoc distance measurement network*

*Uses BLE to discover and UWB to measure distance between nodes*

##  Overview

Beluga makes it more convenient for users to create an ad-hoc distance measurement network.
Users can enter different types of AT commands through serial monitor to configure the properties of the DWM1001-DEV board.
For example, change the channel of the UWB signal and polling frequency.
These features enable users to customize their own network setup and meet the requirements.
Beluga can be applied in the area of localization, robotics, and infrastructure sensing.

<p float="left">
  <img src="https://github.com/WiseLabCMU/Beluga/blob/master/images/node.jpg" width="300">
  <img src="https://media.giphy.com/media/lRk7qp7jkLeplFetnn/giphy.gif" width="300">
</p>

**The above figures shows the DWM1001-DEV board used in the experiment and its application**

## Project Structure

    Beluga/
    ├── Beluga/
    │   ├── Application    // Source codes and Segger project files
    │   ├── boards         // DWM1001-DEV board definitions
    │   ├── config         // nRF52-sdk configuration file
    │   ├── deca_driver    // Decawave UWB API package
    │   └── nRF52-sdk      // nRF52 software development kit
    ├── images
    └── README.md

## System Setup

###  Required software:
  
    1. SEGGER Embedded Studio (Tested on Windows with v4.22, Ubuntu with v4.52b, and Mac with v4.52c)
  
    2. Serial Monitor w/ write capability (Tested with Arduino Serial Monitor 1.8.9 & 1.8.12)

   For downloading the SES and Arduino, please visit [SEGGER](https://www.segger.com/downloads/embedded-studio/) and [Arduino](https://www.arduino.cc/en/main/software)
  

### Enter main project directory:

  Run the Following CD command once inside cloned repo:
 
    cd Beluga/Application
  

### Open project in Segger:

    1.) Go to Project Directory mentioned above
    2.) Open the segger embedded studio project file (the one labeled EMPROJECT File)
  

### Build and flash code:
    1.) Plug in Decawave Module
    2.) Open up segger project
    3.) Go to toolbar -> build -> first option (F7) (build beluga)
    4.) Go to toolbar -> target -> download beluga... (ctrl+T, L)

### Configure firmware through Serial monitor

    1.) Open up serial monitor that allows you to send data (Tested on Arduino IDE 1.8.12)
    2.) AT+ID <number>  (use id greater than 0)
    3.) AT+STARTBLE
      This start BLE broadcasting/recieving scheme, now the node is visible and can see other nodes with ble on as well
      Neighbor List Will Start Printing and Start to be populated with nearby nodes
    4.) AT+STARTUWB
      This starts UWB initiating/responding, now the node can be ranged with, and range to other nodes
      Neighbor List will now populate range fields

    NOTE: This must be done every time a new decawave module is plugged in. A device has already configured this can ignore this procedures.
    Run the above commands in this order, other orders may lead to undefined behavior


## AT Command Lists     

The following AT commands can help users to access and modify DWM1001-DEV firmware to meet specific need.
There are total 13 commands and command 1, 6, 7, 8, 9, 10, 11, 12 can be stored in flash memory to setup user configuration after system reboot.

#### 1. AT+ID 

    AT+ID <number> Determines the ID number of the node

    NOTE: <number> should be greater than 0, and each node should have unique ID.

#### 2. AT+STARTBLE 

    AT+STARTBLE 

    This command starts BLE broadcasting/recieving scheme.

#### 3. AT+STOPBLE

    AT+STOPBLE 

    This command stops BLE broadcasting/recieving scheme.
       
#### 4. AT+STARTUWB

    AT+STARTUWB 
  
    This command starts UWB initiating/responding scheme.

#### 5. AT+STOPUWB 

    AT+STOPUWB 

    This command stops UWB initiating/responding scheme.

#### 6. AT+BOOTMODE
    
    AT+BOOTMODE <mode>  Determines how the node should behave when reset/powered on
    <mode> = 0  -  Do nothing on startup, by default BLE and UWB off.
    <mode> = 1  -  Start BLE broadcasting/recieving on startup
    <mode> = 2  -  Start BOTH BLE and UWB on startup, full functionality.

    Defualt setting: 0
    
    NOTE: For BOOTMODEs 1 and 2, The AT+ID command must have been previously run, the last set ID will be used on startup. 

#### 7. AT+RATE
    
    AT+RATE <freq>  Determines the frequency that the node send poll message
    <freq> = 0-500 (units: ms)
    
    Defualt setting: 100
    
    NOTE: When frequency is 0, the node is in listening mode. (It only receives message passively)

#### 8. AT+CHANNEL
    
    AT+CHANNEL <channel>  Determines the UWB signal's channel
    Available <channel> options: 1, 2, 3, 4, 5, 7
    
    Defualt setting: 5

    NOTE: The corresponding centre frequency and bandwidth of each channel please reference DW1000 User Manual

#### 9. AT+TXPOWER 
    
    AT+TXPOWER <mode>  Determines the UWB transmitter power setting
    <mode> = 0  -  Default power supply
    <mode> = 1  -  Maximum power supply
    
    Defualt setting: 0

    NOTE: Increasing transmitter power supply can help UWB to maximum range, but the maximum power supply exceed restricted transmit power level regulation.

#### 10. AT+TIMEOUT 
    
    AT+TIMEOUT <number>  Determines the timeout parameter to evict nearby nodes
    
    Default setting: 5000 (units: ms)

    NOTE: This parameter indicates that if a nearby node does not update in <number> ms, the node will be evicted from another node's neighbor list. 

#### 11. AT+STREAMMODE 
    
    AT+STREAMMODE <mode>  Determines the UART display mode
    <mode> = 0  -  Whole neighbor list mode
        This mode displays whole neighbor list information
    <mode> = 1  -  Update ranges mode
        This mode only displays when nodes updated the ranges
    
    Default setting: 0


#### 12. AT+TWRMODE 
    
    AT+TWRMODE <mode>  Determines the UWB Two-Way Ranging (TWR) scheme
    <mode> = 0  -  Single-sided TWR (SS-TWR)
    <mode> = 1  -  Double-sided TWR (DS-TWR)
    
    Default setting: 1

    NOTE: DS-TWR is more accurate and can reduce clock drift effect. SS-TWR can be used for a network that needs faster transmission.


#### 13. AT+LEDMODE 
    
    AT+LEDMODE <mode>  Determines the LED display mode
    <mode> = 0  -  LEDs support mode (turn on all LEDs)
    <mode> = 1  -  No LEDs support mode (turn off all LEDs)
    
    Default setting: 0

    NOTE: LEDs support mode can be used for debugging, and another mode can be used for saving power.


#### 14. AT+RESET 
    
    AT+RESET   Clear flash memory configuration
    This command will reset all user configuration including node's ID, BOOTMODE, RATE, CHANNEL, TXPOWER
    
    NOTE: The node should be re-configure follow the above *Running the Code* instructions to avoid undefinded behavior.


## Additional Notes

### Developer Documentation:

   [Beluga developer documentation](https://drive.google.com/file/d/11h-TcP2NU7l8mzmQgQuOIbqR6ngZbJkD/view?usp=sharing)

### LED Layout: 

   ![LED Layout](https://github.com/WiseLabCMU/decawave-ble/blob/master/images/decawaveLED.png?raw=true)
  

    
  
  


# decawave-ble
## Decawave controller for nRF52 that uses BLE for discovery

##  Required Software:
  
    SEGGER Embedded Studio ( Tested on Windows with v4.22 and Ubuntu with v4.52b)
  
    Serial Monitor w/ write capability (Tested with Arduino Serial Monitor 1.8.9 & 1.8.12)

## Main Project Directory:

  Run the Following CD command once inside cloned repo:
 
    cd NRF_UWB_COMBO/examples/ble_central_and_peripheral/experimental/ble_app_hrs_rscs_relay/

## How to Open Project in Segger:

    1.) Go to Project Directory mentioned above
    2.) Navigate to pca10040/s132/ses/
    3.) Open the segger embedded studio project file (the one labeled EMPROJECT File)

## To Test Code:
    0.) Plug in Decawave Module
    1.) Open up segger project
    2.) Go to toolbar -> build -> first option (F7) (build ble_hrs_....)
    3.) Go to toolbar -> target -> download ble_app_hrs... (ctrl+T, L)
    4.) Open up serial monitor that allows you to send data (We like the Aduino IDE's Serial Monitor (Tested on Arduino IDE 1.8.12)
  
## Running the Code

###  After downloading and opening Arduino, follow these instructions
  
    NOTE: This must be done every time the decawave module is restarted/plugged in, flash memory not supported yet
    Run the Following Commands in this Order, other orders may lead to undefined behaiviour
  
      1.) AT+ID <number>  (for now use id greater than 0)
      2.) AT+STARTBLE
        This start BLE broadcasting/recieving scheme, now the node is visible and can see other nodes with ble on as well
        Neighbor List Will Start Printing and Start to be populated with nearby nodes
      3.) AT+STARTUWB
        This starts UWB initiating/responding, now the node can be ranged with, and range to other nodes
        Neighbor List will now populate range fields


  
# ADDITIONAL NOTES: 
  
    1.) Neighbor List Eviction not in Place yet, if a node is removed from system, it's place on the list will remain
    2.) Right now frequency of switching between UWB initiator and responder is not fixed, its currently a random number of ms between 700 and 2000, which we can see isn't the best method, as there are a lot of times where ranges dont get updated and some nodes aren't seen. 
  
  


/** @file   main.c
 *
 *  @brief  Beluga main program file
 *
 *  @date   2020/06
 *
 *  @author WiseLab-CMU 
 */

/* Inlcudes for BLE library */
#include "ble_types.h"
#include "ble_gap.h"
#include "app_timer.h"
#include "nrf_drv_wdt.h"
#include "ble_cus.h"
#include "ble_gatt.h"
#include "ble_advdata.h"

/* Inlcudes for UWB library */
#include "FreeRTOS.h"
#include "task.h"
#include "timers.h"
#include "bsp.h"
#include "boards.h"
#include "nrf_drv_clock.h"
#include "nrf_drv_spi.h"
#include "nrf_uart.h"
#include "app_util_platform.h"
#include "nrf_gpio.h"
#include "nrf_delay.h"
#include "nrf.h"
#include "app_error.h"
#include "app_uart.h"
#include "port_platform.h"
#include "deca_types.h"
#include "deca_param_types.h"
#include "deca_regs.h"
#include "deca_device_api.h"

#include "nrf_drv_gpiote.h"
#include "init_main.h"
#include "resp_main.h"
#include "port_platform.h"
#include "semphr.h"
#include "nrf_fstorage_sd.h"
#include "nrf_soc.h"

/* Customer header files */
#include "flash.h"
#include "uart.h"
#include "ble_app.h"
#include "random.h"


#if defined (UART_PRESENT)
#include "nrf_uart.h"
#endif
#if defined (UARTE_PRESENT)
#include "nrf_uarte.h"
#endif

/* Firmware version */
#define FIRMWARE_VERSION "1.0"

/* Maximum transmission power register value */
#define TX_POWER_MAX 0x1F1F1F1F

/* Preamble timeout, in multiple of PAC size. See NOTE 3 below. */
#define PRE_TIMEOUT 1000

/* Delay between frames, in UWB microseconds. See NOTE 1 below. */
#define POLL_TX_TO_RESP_RX_DLY_UUS 100 

/* Dummy buffer for DW1000 wake-up SPI read. See NOTE 2 below. */
#define DUMMY_BUFFER_LEN 600
static uint8 dummy_buffer[DUMMY_BUFFER_LEN];
static int mode;

extern ble_uuid_t m_adv_uuids[2];
extern node seen_list[MAX_ANCHOR_COUNT];
extern int ble_started;
static int uwb_started;
extern uint32_t time_keeper;
extern int node_added;

int debug_print;
int streaming_mode;
int twr_mode;
int leds_mode;
int sleep_mode;

SemaphoreHandle_t rxSemaphore, txSemaphore, sus_resp, sus_init, print_list_sem;
QueueHandle_t uart_queue;

static int initiator_freq = 100;
static int time_out = 9000;

// Watchdog channel 
extern nrf_drv_wdt_channel_id m_channel_id;

enum pgdelay_ch {
  ch1 = TC_PGDELAY_CH1,
  ch2 = TC_PGDELAY_CH2,
  ch3 = TC_PGDELAY_CH3,
  ch4 = TC_PGDELAY_CH4,
  ch5 = TC_PGDELAY_CH5,
  ch7 = TC_PGDELAY_CH7,
};

enum pgdelay_ch uwb_pgdelay;


/************************************************
 *               Timer functions                *
 ***********************************************/

APP_TIMER_DEF(m_timestamp_keeper);    /**< Handler for repeated timer used to blink LED 1. */


/**
 * @brief Function for initializing the timer.
 */
static void timer_init(void)
{

    //APP_TIMER_INIT(APP_TIMER_PRESCALER, APP_TIMER_OP_QUEUE_SIZE, false);
    ret_code_t err_code = app_timer_init();
    APP_ERROR_CHECK(err_code);
}

/**
 * @brief Timeout handler for the repeated timer.
 */
static void timestamp_handler(void * p_context)
{ 
    time_keeper += 1; 
}

/**
 * @brief Watchdog handler when watchdog timer expire.
 */
void wdt_event_handler(void)
{
  printf("WDT expire! Reboot system! \r\n");
}


/************************************************
 *    UWB configuration & helper functions       *
 ***********************************************/

/* DW1000 config struct */
dwt_config_t config = {
    5,                /* Channel number. */
    DWT_PRF_64M,      /* Pulse repetition frequency. */
    DWT_PLEN_128,     /* Preamble length. Used in TX only. */
    DWT_PAC8,         /* Preamble acquisition chunk size. Used in RX only. */
    10,               /* TX preamble code. Used in TX only. */
    10,               /* RX preamble code. Used in RX only. */
    0,                /* 0 to use standard SFD, 1 to use non-standard SFD. */
    DWT_BR_6M8,       /* Data rate. */
    DWT_PHRMODE_STD,  /* PHY header mode. */
    (129 + 8 - 8)     /* SFD timeout (preamble length + 1 + SFD length - PAC size). Used in RX only. */
};


/* DW1000 TX config struct */
dwt_txconfig_t config_tx = {
  TC_PGDELAY_CH5,
  TX_POWER_MAN_DEFAULT
};


/**
 * @brief Reconfig UWB transmitter as an initiator
 */
void init_reconfig() {

  dwt_setrxaftertxdelay(POLL_TX_TO_RESP_RX_DLY_UUS);
  dwt_setrxtimeout(2000);

}

/**
 * @brief Reconfig UWB transmitter as a responder
 */
void resp_reconfig() {

  dwt_setrxaftertxdelay(0);
  dwt_setrxtimeout(0);

}


/************************************************
 *         FreeRTOS tasks functions             *
 ***********************************************/

TaskHandle_t responder_task_handle; 
TaskHandle_t ranging_task_handle;
TaskHandle_t uart_task_handle;
TaskHandle_t list_task_handle;
TaskHandle_t monitor_task_handle;


/**
 * @brief Task to print out visible nodes information
 *
 * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
 */
void list_task_function(void * pvParameter)
{

  while(1){
      
      vTaskDelay(50);
      
      xSemaphoreTake(print_list_sem, portMAX_DELAY);  
      message new_message = {0};

      /* Normal mode to print all neighbor nodes */
      if (streaming_mode == 0) {
        printf("# ID, RANGE, RSSI, TIMESTAMP\r\n");

        for(int j = 0; j < MAX_ANCHOR_COUNT; j++)
        {
          if(seen_list[j].UUID != 0) printf("%d, %f, %d, %d \r\n", seen_list[j].UUID, seen_list[j].range, seen_list[j].RSSI, seen_list[j].time_stamp); 
        }
      }

      /* Streaming mode to print only new updated nodes */
      if (streaming_mode == 1) {
        int count_flag = 0;

        // Check whether alive nodes have update flag or not
        for(int i = 0; i < MAX_ANCHOR_COUNT; i++)
        {
          if(seen_list[i].UUID != 0 && seen_list[i].update_flag != 0) {
            count_flag++;
          }      
        }
        // If one of node has update flag, print it
        if (count_flag != 0) {
          printf("# ID, RANGE, RSSI, TIMESTAMP\r\n");

          for(int j = 0; j < MAX_ANCHOR_COUNT; j++)
          {
            if(seen_list[j].UUID != 0 && seen_list[j].update_flag == 1) printf("%d, %f, %d, %d \r\n", seen_list[j].UUID, seen_list[j].range, seen_list[j].RSSI, seen_list[j].time_stamp); 
            
            // Reset update flag of the node
            seen_list[j].update_flag = 0;
          }
        }
      }
      xSemaphoreGive(print_list_sem);
   }
}


/**
 * @brief Task to receive UART message from freertos UART queue and parse
 *
 * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
 */
void uart_task_function(void * pvParameter){

  UNUSED_PARAMETER(pvParameter);

  message incoming_message = {0};

  while(1) {
    vTaskDelay(100);
    
    if(xQueueReceive(uart_queue, &incoming_message, 0) == pdPASS) {  

      //Handle valid AT command begining with AT+
      if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+", (size_t)3)) {
        
        //Handle specific AT commands
        if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STARTUWB", (size_t)11)) {
            
            uwb_started = 1;
            // Give the suspension semaphore so UWB can continue
            xSemaphoreGive(sus_resp);
            xSemaphoreGive(sus_init);
            if (leds_mode == 0) bsp_board_led_on(BSP_BOARD_LED_2);
            printf("OK \r\n");
           
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STOPUWB", (size_t)10)) {
            
            uwb_started = 0;
            // Take UWB suspension semaphore
            xSemaphoreTake(sus_resp, portMAX_DELAY);
            xSemaphoreTake(sus_init, portMAX_DELAY);
            if (leds_mode == 0) bsp_board_led_off(BSP_BOARD_LED_2);
            printf("OK \r\n");
            
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STARTBLE", (size_t)11)) {
            
            ble_started = 1;
            // Give print list semaphore
            xSemaphoreGive(print_list_sem);
            adv_scan_start();
            if (leds_mode == 0) bsp_board_led_on(BSP_BOARD_LED_1);
            printf("OK \r\n");
                    
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STOPBLE", (size_t)10)) {
            
            ble_started = 0;
            sd_ble_gap_adv_stop();
            sd_ble_gap_scan_stop();
            // Take print list semaphore to stop printing
            xSemaphoreTake(print_list_sem, portMAX_DELAY);
            if (leds_mode == 0) bsp_board_led_off(BSP_BOARD_LED_1);
            printf("OK \r\n");
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+ID", (size_t)5)) {
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t rec_uuid = atoi(uuid_char);
            
            NODE_UUID = rec_uuid;
            m_adv_uuids[1].uuid = NODE_UUID;

            // Setup UUID into BLE 
            advertising_init();

            // Change the advertising name on BLE package
            char name[] = "BN ";
            char id_attach[2];
            itoa(NODE_UUID, id_attach, 10);
            strncat(name, id_attach , strlen(id_attach));
            gap_params_init(name);


            ble_advdata_t    advdata;
            memset(&advdata, 0, sizeof(advdata));
            advdata.name_type               = BLE_ADVDATA_FULL_NAME;
            advdata.include_appearance      = true;
            advdata.flags                   = BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE;
            ble_advdata_set(&advdata, NULL);



            writeFlashID(rec_uuid, 1);
            printf("OK\r\n");
            
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+BOOTMODE", (size_t)11)) {
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t mode = atoi(uuid_char);
            
            if (mode < 0 || mode > 2) {
              printf("Invalid bootmode parameter \r\n");
            }
            else {
              if (mode == 1) {
                writeFlashID(1, 2);
              }
              else if (mode == 2) {
                 writeFlashID(2, 2);
              }
              else {
                writeFlashID(0, 2);
              }

              printf("Bootmode: %d OK \r\n", mode);
            }
        }

        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+RATE", (size_t)7)) {
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t rate = atoi(uuid_char);
            
            if (rate < 0 || rate > 500) {
              printf("Invalid rate parameter \r\n"); 
            }
            else {
              writeFlashID(rate, 3);
              initiator_freq = rate;

              // reconfig BLE advertising data
              if (rate == 0) {
                advertising_reconfig(0);
              }
              else {
                advertising_reconfig(1);
              }

              printf("Rate: %d OK \r\n", rate);
            }
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+CHANNEL", (size_t)10)) {
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t channel = atoi(uuid_char);

            if (channel < 1 || channel > 7 || channel == 6) {
              printf("Invalid Channel number \r\n");
            }
            else {
              writeFlashID(channel, 4);
              switch (channel) {
                case 1: uwb_pgdelay = ch1;
                        break;
                case 2: uwb_pgdelay = ch2;
                        break;
                case 3: uwb_pgdelay = ch3;
                        break;
                case 4: uwb_pgdelay = ch4;
                        break;
                case 5: uwb_pgdelay = ch5;
                        break;
                case 7: uwb_pgdelay = ch7;
                        break;
              }
              config_tx.PGdly = uwb_pgdelay;
              config.chan = channel;
              dwt_configure(&config);
              dwt_configuretxrf(&config_tx);
              printf("OK \r\n");
            }

        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+RESET", (size_t)8)) {

          // Delete ID record
          fds_record_desc_t   record_desc_1;
          fds_find_token_t    ftok_1;
          memset(&ftok_1, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_1, &record_desc_1, &ftok_1) == FDS_SUCCESS) {
            ret_code_t ret = fds_record_delete(&record_desc_1);
            if (ret != FDS_SUCCESS) {
             printf("FDS Delete error \r\n");
            }
          }

          // Delete rate record
          fds_record_desc_t   record_desc_2;
          fds_find_token_t    ftok_2;
          memset(&ftok_2, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_3, &record_desc_2, &ftok_2) == FDS_SUCCESS) {
            ret_code_t ret2 = fds_record_delete(&record_desc_2);
            if (ret2 != FDS_SUCCESS) {
             printf("FDS Delete error \r\n");
            }
          }
          
          // Delete channel record
          fds_record_desc_t   record_desc_3;
          fds_find_token_t    ftok_3;
          memset(&ftok_3, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_4, &record_desc_3, &ftok_3) == FDS_SUCCESS) { 
            ret_code_t ret3 = fds_record_delete(&record_desc_3);
            if (ret3 != FDS_SUCCESS) {
              printf("FDS Delete error \r\n");
            }
          }
          
          // Delete timeout record
          fds_record_desc_t   record_desc_4;
          fds_find_token_t    ftok_4;
          memset(&ftok_4, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_5, &record_desc_4, &ftok_4) == FDS_SUCCESS) {
            ret_code_t ret4 = fds_record_delete(&record_desc_4);
            if (ret4 != FDS_SUCCESS) {
              printf("FDS Delete error \r\n");
            }
          }
          

          // Delete Tx power record
          fds_record_desc_t   record_desc_5;
          fds_find_token_t    ftok_5;
          memset(&ftok_5, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_6, &record_desc_5, &ftok_5) == FDS_SUCCESS) {
            ret_code_t ret5 = fds_record_delete(&record_desc_5);
            if (ret5 != FDS_SUCCESS) {
              printf("FDS Delete error \r\n");
            }
          }
          

          // Delete stream mode record
          fds_record_desc_t   record_desc_6;
          fds_find_token_t    ftok_6;
          memset(&ftok_6, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_7, &record_desc_6, &ftok_6) == FDS_SUCCESS) {
            ret_code_t ret6 = fds_record_delete(&record_desc_6);
            if (ret6 != FDS_SUCCESS) {
              printf("FDS Delete error \r\n");
            }
          }

          // Delete TWR mode record
          fds_record_desc_t   record_desc_7;
          fds_find_token_t    ftok_7;
          memset(&ftok_7, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_8, &record_desc_7, &ftok_7) == FDS_SUCCESS) {
            ret_code_t ret7 = fds_record_delete(&record_desc_7);
            if (ret7 != FDS_SUCCESS) {
              printf("FDS Delete error \r\n");
            }
          }
          
          // Delete LED mode record
          fds_record_desc_t   record_desc_8;
          fds_find_token_t    ftok_8;
          memset(&ftok_8, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_9, &record_desc_8, &ftok_8) == FDS_SUCCESS) {
            ret_code_t ret8 = fds_record_delete(&record_desc_8);
            if (ret8 != FDS_SUCCESS) {
              printf("FDS Delete error \r\n");
            }
          }

          // Delete BOOT mode record
          fds_record_desc_t   record_desc_9;
          fds_find_token_t    ftok_9;
          memset(&ftok_9, 0x00, sizeof(fds_find_token_t));
          if (fds_record_find(FILE_ID, RECORD_KEY_2, &record_desc_9, &ftok_9) == FDS_SUCCESS) {
            ret_code_t ret9 = fds_record_delete(&record_desc_9);
            if (ret9 != FDS_SUCCESS) {
              printf("FDS Delete error \r\n");
            }
          };
          
          printf("Reset OK \r\n");
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+TIMEOUT", (size_t)10)) {
            
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t timeout = atoi(uuid_char);
            //printf("%d \r\n", timeout);
            
            if (timeout < 0) {
              printf("Timeout cannot be negative \r\n");
            }
            else {
              writeFlashID(timeout, 5);
              time_out = timeout; 

              printf("OK \r\n");
            }
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+TXPOWER", (size_t)10)) {
            
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t tx_power = atoi(uuid_char);
            //printf("%d \r\n", timeout);
            
            if (tx_power < 0 || tx_power > 1) {
              printf("Tx Power parameter input error \r\n");
            }
            else {
              writeFlashID(tx_power, 6);
              if (tx_power == 0) {
                config_tx.power = TX_POWER_MAN_DEFAULT;
              }
              if (tx_power == 1) {
                config_tx.power = TX_POWER_MAX;
              }
              dwt_configuretxrf(&config_tx);
              printf("OK \r\n");
            }
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STREAMMODE", (size_t)13)) {
            
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t stream_mode = atoi(uuid_char);
            
            if (stream_mode < 0 || stream_mode > 1) {
              printf("Stream mode parameter input error \r\n");
            }
            else {
              writeFlashID(stream_mode, 7);
              streaming_mode = stream_mode;
              printf("OK \r\n");
            }
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+TWRMODE", (size_t)10)) {
            
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t ranging_mode = atoi(uuid_char);
            
            if (ranging_mode < 0 || ranging_mode > 1) {
              printf("TWR mode parameter input error \r\n");
            }
            else {
              writeFlashID(ranging_mode, 8);
              twr_mode = ranging_mode;
              printf("OK \r\n");
            }
        }

        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+LEDMODE", (size_t)10)) {
            
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t led_mode = atoi(uuid_char);
            
            if (led_mode < 0 || led_mode > 1) {
              printf("LED mode parameter input error \r\n");
            }
            else {
              writeFlashID(led_mode, 9);
              leds_mode = led_mode;
              // Turn off all LEDs
              if (leds_mode == 1) {
                bsp_board_leds_off();
                dwt_setleds(DWT_LEDS_DISABLE);
              }

              // Turn on LEDs from flash records
              if (leds_mode == 0) {
                bsp_board_led_on(BSP_BOARD_LED_0);
                dwt_setleds(DWT_LEDS_ENABLE);

                uint32_t state = getFlashID(2); 
                if( (state == 1) || (state == 2) ) {
                  bsp_board_led_on(BSP_BOARD_LED_1);
                }
                if (state == 2) {
                  bsp_board_led_on(BSP_BOARD_LED_2);
                }  
              }

              printf("OK \r\n");
            }
        }
        else if (0 == strncmp((const char *)incoming_message.data, (const char *)"AT+REBOOT", (size_t)9)) {
            
            //Reboot device
            sd_nvic_SystemReset();
           
        }

        else printf("ERROR Invalid AT Command\r\n");
      }

      else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT", (size_t)2))
      {
        printf("Only input AT without + command \r\n");
      }

      else {
        printf("Not an AT command\r\n");
        
      }  
    }
  }
}



/**
 * @brief Task to perform UWB ranging task.
 * 
 * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
 */
void ranging_task_function(void *pvParameter)
{
  int drop_flag = 0;
  int break_flag = 0;
  static int cur_index = 0;

  while(1){
      // feed watch dog timer
      nrf_drv_wdt_channel_feed(m_channel_id);
      
      // Only the polling node (not passive node) will init a polling message
      if(initiator_freq != 0)
      {
        
        // Stop the init task based on the input polling frequency
        vTaskDelay(initiator_freq);
        
        // If previous polling drop, give a random exponential distribution delay
        if (drop_flag != 0) {
          uint16_t rand_small = get_rand_num_exp_collision(initiator_freq);
          vTaskDelay(rand_small);
          drop_flag = 0;
        }
        
        
        xSemaphoreTake(sus_resp, 0); // Suspend Responder Task
        xSemaphoreTake(sus_init, portMAX_DELAY);
        vTaskDelay(2);

        dwt_forcetrxoff();
        init_reconfig();

        /* Do separate ranging (that is, poll only one node in the neighbor list, see developer documentation to see the scheme)*/

        int search_count = 0;
        float range1;

        while (seen_list[cur_index].UUID == 0) {
          cur_index += 1;
          
          // Back to the head of seen list
          if (cur_index == MAX_ANCHOR_COUNT) {
            cur_index = 0;
          }
          // Finish search for whole list, no found, then break
          if (search_count == MAX_ANCHOR_COUNT - 1) {
            break_flag = 1;
            break;
          }
          search_count += 1;
        }

        // Found a node that we want to poll
        if (break_flag != 1) {

          // Init UWB ranging measurment
          if (twr_mode == 1) {
            range1 = ds_init_run(seen_list[cur_index].UUID);
          }
          if (twr_mode == 0) {
            range1 = ss_init_run(seen_list[cur_index].UUID);
          }
          
          // Set up drop flag if the ranging fail
          if (range1 == -1) drop_flag = 1;

          int numThru = 1;
          if (range1 == -1) {
            range1 = 0;
            numThru -= 1;
          }

          float range = (range1)/numThru;
          
          if( (numThru != 0) && (range >= -5) && (range <= 100) ) {
            seen_list[cur_index].update_flag = 1;
            seen_list[cur_index].range = range;
            seen_list[cur_index].time_stamp = time_keeper;

            // Update BLE transfer value to phone
            update_char_value(seen_list[cur_index].UUID, seen_list[cur_index].range);
          }      

          cur_index += 1;
          // Back to the head of seen list
          if (cur_index == MAX_ANCHOR_COUNT) {
            cur_index = 0;
          }
        }

        break_flag = 0;
        resp_reconfig();
        dwt_forcetrxoff();
        
        xSemaphoreGive(sus_init);
        xSemaphoreGive(sus_resp); //Resume Responder Task
      }
      else {
        vTaskDelay(1000);
      }

    // Check polling flag of each node (see whether there are active nodes in neighbor list)
    int polling_count = 0;
    for (int x = 0; x < MAX_ANCHOR_COUNT; x++) {
      if(seen_list[x].UUID != 0 && seen_list[x].polling_flag != 0) {
        polling_count += 1;
      }
    }

    // If no polling nodes in the network, suspend UWB response (listening) 
    if (polling_count == 0) {

      xSemaphoreTake(sus_resp, 0); //Suspend Responder Task
      xSemaphoreTake(sus_init, portMAX_DELAY);
      vTaskDelay(2);
      dwt_forcetrxoff();
      resp_reconfig();
      dwt_forcetrxoff();

      /* Put DW1000 to sleep. */
//      if (sleep_mode == 0) {
//        dwt_entersleep();
//        sleep_mode = 1;
//      }

      xSemaphoreGive(sus_init);
      xSemaphoreGive(sus_resp);


      xSemaphoreTake(sus_resp, 0);          
    }
    else {

      xSemaphoreTake(sus_resp, 0); //Suspend Responder Task
      xSemaphoreTake(sus_init, portMAX_DELAY);
      vTaskDelay(2);
      dwt_forcetrxoff();
      resp_reconfig();
      dwt_forcetrxoff();

      /* Wake DW1000 up. See NOTE 2 below. */
//      if (sleep_mode == 1) {
//        dwt_spicswakeup(dummy_buffer, DUMMY_BUFFER_LEN);
//        sleep_mode = 0;
//      }

      xSemaphoreGive(sus_init);
      xSemaphoreGive(sus_resp);
      xSemaphoreGive(sus_resp);     
    }
    }

 }

/**
 * @brief Task to check nodes eviction and re-sorting
 *
 * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
 */
void monitor_task_function(void *pvParameter)
{

  uint32 count = 0;

  while(1) {
    
    vTaskDelay(1000);

    // Feed the watchdog timer
    nrf_drv_wdt_channel_feed(m_channel_id);

    xSemaphoreTake(sus_init, portMAX_DELAY);
    int removed = 0;
    count += 1;

    // Check for timeout eviction
    for(int x = 0; x < MAX_ANCHOR_COUNT; x++) {
      if(seen_list[x].UUID != 0) {
        if( (time_keeper - seen_list[x].ble_time_stamp) >= time_out) {
          removed = 1;
          seen_list[x].UUID = 0;
          seen_list[x].range = 0;
          seen_list[x].time_stamp = 0;
          seen_list[x].RSSI = 0;
          seen_list[x].update_flag = 0;
          seen_list[x].polling_flag = 0;
          seen_list[x].ble_time_stamp = 0;
        }
      }
    }
    
    // Re-sort seen list by RSSI value when a node is removed, added, or a period of time
    if(removed || node_added || ((count % 5) == 0)  ) {
        
      (void) sd_ble_gap_scan_stop();

      for (int j = 0; j < MAX_ANCHOR_COUNT; j++) {
        for( int k = j+1; k < MAX_ANCHOR_COUNT; k++) {
          if(seen_list[j].RSSI < seen_list[k].RSSI) {
              node A = seen_list[j];
              seen_list[j] = seen_list[k];
              seen_list[k] = A;
          }
        }
      }
      
      //Resume scanning/building up neighbor list
      scan_start();
      node_added = 0;
      removed = 0;
      count = 0;
    }

    xSemaphoreGive(sus_init);
  }
}


/**
 * @brief SS TWR Initiator task entry function.
 *
 * @param[in] pvParameter   Pointer that will be used as the parameter for the task.
 */
void responder_task_function (void * pvParameter)
{
  UNUSED_PARAMETER(pvParameter);
  
  if (leds_mode == 0) dwt_setleds(DWT_LEDS_ENABLE);
  if (leds_mode == 1) dwt_setleds(DWT_LEDS_DISABLE);


  while(1) {

    // Feed the watchdog timer
    nrf_drv_wdt_channel_feed(m_channel_id);
    
    //Check if responding is suspended, return 0 means suspended
    int suspend_start = uxQueueMessagesWaiting((QueueHandle_t) sus_resp); 

    if(suspend_start != 0) 
    {
      if (twr_mode == 1) ds_resp_run();
      if (twr_mode == 0) ss_resp_run();      
    }

    /* Delay a task for a given number of ticks */
    //vTaskDelay(20);   
  }
}


/************************************************
 *            Program main function             *
 ***********************************************/

/**
 * @brief program main entrance.
 */
int main(void)
{

    debug_print = 0;
    streaming_mode = 0;
    twr_mode = 1;
    leds_mode = 0;
    sleep_mode = 0;
    uwb_pgdelay = ch5;
    bool erase_bonds;

    // Setup WDT 
    uint32_t err_code = NRF_SUCCESS;
    nrf_drv_wdt_config_t wdt_config = NRF_DRV_WDT_DEAFULT_CONFIG;
    err_code = nrf_drv_wdt_init(&wdt_config, wdt_event_handler);
    APP_ERROR_CHECK(err_code);
    err_code = nrf_drv_wdt_channel_alloc(&m_channel_id);
    APP_ERROR_CHECK(err_code);
    nrf_drv_wdt_enable();


    // Init nodes in seen list
    for(int i = 0; i < MAX_ANCHOR_COUNT; i++)
    {
      seen_list[i].UUID = 0;
      seen_list[i].RSSI = 0;
      seen_list[i].time_stamp = 0;
      seen_list[i].range = 0;
      seen_list[i].update_flag = 0;
      seen_list[i].polling_flag = 0;
      seen_list[i].ble_time_stamp = 0;
    }

  
    uart_init();
    timer_init();  
    buttons_leds_init(&erase_bonds);   
    ble_stack_init();   
    gap_params_init("Default");
    gatt_init();  
    conn_params_init();
    peer_manager_init();
    services_init();
    advertising_init();

    // Init flash data storage
    ret_code_t ret = fds_register(fds_evt_handler);
    if (ret != FDS_SUCCESS) {
        printf("reg error \r\n"); // Registering of the FDS event handler has failed.
    }

    ret = fds_init();
    if (ret != FDS_SUCCESS) {
       printf("init error \r\n");
    }

    /* 
     * DWM1001-DEV GPIO init (Logic Analyzer debug used)
     * PIN 12 and 27 corresponding to DWM1001-DEV GPIO output, please reference to schemetic
     *
     * nrf_gpio_cfg_output(12);
     * nrf_gpio_cfg_output(27);
     * nrf_gpio_pin_set(12);     // Use set and clear in init_main and resp_main file to plot transmisstion scheme
     * nrf_gpio_pin_clear(27);
     */    


    /*------------ UWB config part ------------- */
    nrf_gpio_cfg_input(DW1000_IRQ, NRF_GPIO_PIN_NOPULL); 	
    
    /* Reset DW1000 */
    reset_DW1000(); 

    /* Set SPI clock to 2MHz */
    port_set_dw1000_slowrate();			
  
    /* Init the DW1000 */
    if (dwt_initialise(DWT_LOADUCODE) == DWT_ERROR)
    {
      //Init of DW1000 Failed
      while (1) {};
    }

    // Set SPI to 8MHz clock  
    port_set_dw1000_fastrate();

    /* Configure DW1000. */
    dwt_configure(&config);

    /* Configure DW1000 TX power and pulse delay */
    dwt_configuretxrf(&config_tx);

    /* Apply default antenna delay value. See NOTE 2 below. */
    dwt_setrxantennadelay(RX_ANT_DLY);
    dwt_settxantennadelay(TX_ANT_DLY);
          
    /* Set expected response's timeout. (keep listening so timeout is 0) */
    dwt_setrxtimeout(0);


    /* Configure sleep and wake-up parameters. */
    // dwt_configuresleep(DWT_PRESRV_SLEEP | DWT_CONFIG, DWT_WAKE_CS | DWT_SLP_EN);


    // Init timekeeper from timer. unit: 1ms
    ret_code_t create_timer = app_timer_create(&m_timestamp_keeper, APP_TIMER_MODE_REPEATED, timestamp_handler);
    ret_code_t start_timer =  app_timer_start(m_timestamp_keeper, APP_TIMER_TICKS(1) , NULL);
  
    printf("Node On: Firmware version %s\r\n", FIRMWARE_VERSION);

 
    if (erase_bonds == true)
    {
        // Scanning and advertising is done upon PM_EVT_PEERS_DELETE_SUCCEEDED event.
        delete_bonds();
    }
    

    rxSemaphore = xSemaphoreCreateBinary();
    txSemaphore = xSemaphoreCreateBinary();
    sus_resp = xSemaphoreCreateBinary();
    sus_init = xSemaphoreCreateBinary();
    print_list_sem = xSemaphoreCreateBinary();

    uart_queue = xQueueCreate(25, sizeof(struct message));

    // The stack size here is an estimated value
    UNUSED_VARIABLE(xTaskCreate(responder_task_function, "TWR_RESP", configMINIMAL_STACK_SIZE+600, NULL,1, &responder_task_handle));
    UNUSED_VARIABLE(xTaskCreate(ranging_task_function, "RNG", configMINIMAL_STACK_SIZE+200, NULL, 2, &ranging_task_handle));
    UNUSED_VARIABLE(xTaskCreate(uart_task_function, "UART", configMINIMAL_STACK_SIZE+1200, NULL, 2, &uart_task_handle));
    UNUSED_VARIABLE(xTaskCreate(list_task_function, "LIST", configMINIMAL_STACK_SIZE+600, NULL, 2, &list_task_handle));
    UNUSED_VARIABLE(xTaskCreate(monitor_task_function, "MONITOR", configMINIMAL_STACK_SIZE+800, NULL, 2, &monitor_task_handle));
    

    printf("Flash Configuration: \r\n");
    
    /* Fetch LED mode from flash */
    fds_record_desc_t   record_desc_9;
    fds_find_token_t    ftok_9;
    memset(&ftok_9, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_9, &record_desc_9, &ftok_9) == FDS_SUCCESS)
    {
      uint32_t led_mode = getFlashID(CONFIG_LED);
      leds_mode = led_mode;
      if (leds_mode == 0) {
        bsp_board_led_on(BSP_BOARD_LED_0);
      }
      printf("  LED Mode: %d \r\n", led_mode);
    }
    else {
      printf("  LED Mode: Default \r\n");
      bsp_board_led_on(BSP_BOARD_LED_0);
    }


    /* Fetch ID and bootmode record from flash */
    fds_record_desc_t   record_desc_2;
    fds_find_token_t    ftok_2;
    memset(&ftok_2, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_1, &record_desc_2, &ftok_2) == FDS_SUCCESS) //If there is a stored ID
    {      
      uint32_t id = getFlashID(CONFIG_ID); //Get ID
      NODE_UUID = id;
      m_adv_uuids[1].uuid = NODE_UUID; 
      advertising_init(); // Set UUID

      // Change advertising package name
      char name[] = "BN ";
      char id_attach[2];
      itoa(id, id_attach, 10);
      strncat(name, id_attach , strlen(id_attach));
      gap_params_init(name);

      ble_advdata_t    advdata;
      memset(&advdata, 0, sizeof(advdata));
      advdata.uuids_complete.uuid_cnt =  sizeof(m_adv_uuids) / sizeof(m_adv_uuids[0]);
      advdata.uuids_complete.p_uuids  =  m_adv_uuids;
      advdata.name_type               = BLE_ADVDATA_FULL_NAME;
      advdata.include_appearance      = true;
      advdata.flags                   = BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE;
      err_code = ble_advdata_set(&advdata, NULL);

      printf("  Node ID: %d \r\n", id);
    }
    else {
       printf("  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\r\n");
       printf("  !Warning! Please setup node ID!\r\n");
       printf("  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!\r\n");
    }

    /* Fetch polling rate record from flash */
    fds_record_desc_t   record_desc_1;
    fds_find_token_t    ftok_1;
    memset(&ftok_1, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_2, &record_desc_1, &ftok_1) == FDS_SUCCESS) 
    {
      uint32_t state = getFlashID(CONFIG_BM); //Get State
      printf("  Boot Mode: %d \r\n", state);

      if( (state == 1) || (state == 2) ) //Start BLE
      {
        ble_started = 1;
        xSemaphoreGive(print_list_sem);
        adv_scan_start();
        if (leds_mode == 0) bsp_board_led_on(BSP_BOARD_LED_1);
      }

      if (state == 2) //Start UWB
      {
        uwb_started = 1;
        xSemaphoreGive(sus_resp);
        xSemaphoreGive(sus_init);
        if (leds_mode == 0) bsp_board_led_on(BSP_BOARD_LED_2);
      } 
    }
    else {
      printf("  Boot Mode: Default \r\n");
    }

    /* Fetch polling rate record from flash */
    fds_record_desc_t   record_desc_3;
    fds_find_token_t    ftok_3;
    memset(&ftok_3, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_3, &record_desc_3, &ftok_3) == FDS_SUCCESS) 
    {
      uint32_t rate = getFlashID(CONFIG_RATE);
      initiator_freq = rate;

      // reconfig BLE advertising data
      if (rate == 0) {
        advertising_reconfig(0);
      }
      else {
        advertising_reconfig(1);
      }

      printf("  UWB Polling Rate: %d\r\n", rate);
    }
    else {
      printf("  UWB Polling Rate: Default \r\n");
    }

    /* Fetch channel record from flash */
    fds_record_desc_t   record_desc_4;
    fds_find_token_t    ftok_4;
    memset(&ftok_4, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_4, &record_desc_4, &ftok_4) == FDS_SUCCESS)
    {
      uint32_t channel = getFlashID(CONFIG_CHAN);
      switch (channel) {
        case 1: uwb_pgdelay = ch1;
                break;
        case 2: uwb_pgdelay = ch2;
                break;
        case 3: uwb_pgdelay = ch3;
                break;
        case 4: uwb_pgdelay = ch4;
                break;
        case 5: uwb_pgdelay = ch5;
                break;
        case 7: uwb_pgdelay = ch7;
                break;
      }
      config_tx.PGdly = uwb_pgdelay;
      config.chan = channel;
      dwt_configuretxrf(&config_tx);
      dwt_configure(&config);
      printf("  UWB Channel: %d \r\n", channel);
    }
    else {
      printf("  UWB Channel: Defalut \r\n");
    }

    /* Fetch timeout record from flash */
    fds_record_desc_t   record_desc_5;
    fds_find_token_t    ftok_5;
    memset(&ftok_5, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_5, &record_desc_5, &ftok_5) == FDS_SUCCESS) 
    {
      uint32_t timeout = getFlashID(CONFIG_TIME);
      time_out = timeout;
      printf("  BLE Timeout: %d \r\n", time_out);
    }
    else {
      printf("  BLE Timeout: Default \r\n");
    }

    /* Fetch TX power record from flash */
    fds_record_desc_t   record_desc_6;
    fds_find_token_t    ftok_6;
    memset(&ftok_6, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_6, &record_desc_6, &ftok_6) == FDS_SUCCESS)
    {
      uint32_t tx_power = getFlashID(CONFIG_TXP);
      if (tx_power == 1) {
        config_tx.power = TX_POWER_MAX;
        printf("  TX Power: Max \r\n");
      }
      if (tx_power == 0) {
        config_tx.power = TX_POWER_MAN_DEFAULT;
        printf("  TX Power: Default \r\n");
      }
      dwt_configuretxrf(&config_tx);
    }
    else {
      printf("  TX Power: Default \r\n");
    }

    /* Fetch streaming mode from flash */
    fds_record_desc_t   record_desc_7;
    fds_find_token_t    ftok_7;
    memset(&ftok_7, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_7, &record_desc_7, &ftok_7) == FDS_SUCCESS)
    {
      uint32_t stream_mode = getFlashID(CONFIG_SM);
      streaming_mode = stream_mode;
      printf("  Stream Mode: %d \r\n", stream_mode);
    }
    else {
      printf("  Stream Mode: Defalut \r\n");
    }

    /* Fetch TWR mode from flash */
    fds_record_desc_t   record_desc_8;
    fds_find_token_t    ftok_8;
    memset(&ftok_8, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_8, &record_desc_8, &ftok_8) == FDS_SUCCESS)
    {
      uint32_t ranging_mode = getFlashID(CONFIG_TWR);
      twr_mode = ranging_mode;
      printf("  Ranging Mode: %d \r\n", ranging_mode);
    }
    else {
      printf("  Ranging Mode: Default \r\n");
    }

   
    vTaskStartScheduler();
    while(1) 
    {
        APP_ERROR_HANDLER(NRF_ERROR_FORBIDDEN);             
    }
}






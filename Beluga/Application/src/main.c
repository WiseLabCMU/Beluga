/**
 * Copyright (c) 2014 - 2017, Nordic Semiconductor ASA
 * 
 * All rights reserved.
 * 
 * Redistribution and use in source and binary forms, with or without modification,
 * are permitted provided that the following conditions are met:
 * 
 * 1. Redistributions of source code must retain the above copyright notice, this
 *    list of conditions and the following disclaimer.
 * 
 * 2. Redistributions in binary form, except as embedded into a Nordic
 *    Semiconductor ASA integrated circuit in a product or a software update for
 *    such product, must reproduce the above copyright notice, this list of
 *    conditions and the following disclaimer in the documentation and/or other
 *    materials provided with the distribution.
 * 
 * 3. Neither the name of Nordic Semiconductor ASA nor the names of its
 *    contributors may be used to endorse or promote products derived from this
 *    software without specific prior written permission.
 * 
 * 4. This software, with or without modification, must only be used with a
 *    Nordic Semiconductor ASA integrated circuit.
 * 
 * 5. Any software provided in binary form under this license must not be reverse
 *    engineered, decompiled, modified and/or disassembled.
 * 
 * THIS SOFTWARE IS PROVIDED BY NORDIC SEMICONDUCTOR ASA "AS IS" AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES
 * OF MERCHANTABILITY, NONINFRINGEMENT, AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL NORDIC SEMICONDUCTOR ASA OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
 * GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT
 * OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * 
 */


#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "nordic_common.h"
#include "nrf_sdh.h"
#include "nrf_sdh_soc.h"
#include "nrf_sdh_ble.h"
#include "peer_manager.h"
#include "app_timer.h"
#include "bsp_btn_ble.h"
#include "ble.h"
#include "ble_advdata.h"
#include "ble_advertising.h"
#include "ble_conn_params.h"
#include "ble_db_discovery.h"
#include "ble_hrs.h"
#include "ble_rscs.h"
#include "ble_hrs_c.h"
#include "ble_rscs_c.h"
#include "ble_nus.h"
#include "ble_conn_state.h"
#include "nrf_fstorage.h"
#include "fds.h"
#include "nrf_ble_gatt.h"

#include "nrf_log.h"
#include "nrf_log_ctrl.h"
#include "nrf_log_default_backends.h"

//Inlcudes for UWB
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
//#include "UART.h"

#include "nrf_drv_gpiote.h"
#include "ss_init_main.h"
#include "port_platform.h"

#include "semphr.h"
#include "nrf_fstorage_sd.h"
#include "nrf_soc.h"


#define RESPONDER 0
#define INITIATOR 1

#if defined (UART_PRESENT)
#include "nrf_uart.h"
#endif
#if defined (UARTE_PRESENT)
#include "nrf_uarte.h"
#endif


#define FIRMWARE_VERSION "1.0"

#include "flash.h"
#include "uart.h"



static int mode;



#define PERIPHERAL_ADVERTISING_LED      BSP_BOARD_LED_2
#define PERIPHERAL_CONNECTED_LED        BSP_BOARD_LED_3
#define CENTRAL_SCANNING_LED            BSP_BOARD_LED_0
#define CENTRAL_CONNECTED_LED           BSP_BOARD_LED_1

#define DEVICE_NAME                     "Node"                                     /**< Name of device used for advertising. */
#define MANUFACTURER_NAME               "NordicSemiconductor"                       /**< Manufacturer. Will be passed to Device Information Service. */
#define APP_ADV_INTERVAL                300                                         /**< The advertising interval (in units of 0.625 ms). This value corresponds to 187.5 ms. */
#define APP_ADV_TIMEOUT_IN_SECONDS      180                                         /**< The advertising timeout in units of seconds. */

#define APP_BLE_CONN_CFG_TAG            1                                           /**< A tag identifying the SoftDevice BLE configuration. */

#define FIRST_CONN_PARAMS_UPDATE_DELAY  APP_TIMER_TICKS(5000)                       /**< Time from initiating event (connect or start of notification) to first time sd_ble_gap_conn_param_update is called (5 seconds). */
#define NEXT_CONN_PARAMS_UPDATE_DELAY   APP_TIMER_TICKS(30000)                      /**< Time between each call to sd_ble_gap_conn_param_update after the first call (30 seconds). */
#define MAX_CONN_PARAMS_UPDATE_COUNT    3                                           /**< Number of attempts before giving up the connection parameter negotiation. */

#define APP_FEATURE_NOT_SUPPORTED       BLE_GATT_STATUS_ATTERR_APP_BEGIN + 2        /**< Reply when unsupported features are requested. */

#define SEC_PARAM_BOND                  1                                           /**< Perform bonding. */
#define SEC_PARAM_MITM                  0                                           /**< Man In The Middle protection not required. */
#define SEC_PARAM_LESC                  0                                           /**< LE Secure Connections not enabled. */
#define SEC_PARAM_KEYPRESS              0                                           /**< Keypress notifications not enabled. */
#define SEC_PARAM_IO_CAPABILITIES       BLE_GAP_IO_CAPS_NONE                        /**< No I/O capabilities. */
#define SEC_PARAM_OOB                   0                                           /**< Out Of Band data not available. */
#define SEC_PARAM_MIN_KEY_SIZE          7                                           /**< Minimum encryption key size in octets. */
#define SEC_PARAM_MAX_KEY_SIZE          16                                          /**< Maximum encryption key size in octets. */

#define SCAN_INTERVAL                   0x00A0                                      /**< Determines scan interval in units of 0.625 millisecond. */
#define SCAN_WINDOW                     0x0050                                      /**< Determines scan window in units of 0.625 millisecond. */
#define SCAN_TIMEOUT                    0


#define MIN_CONNECTION_INTERVAL         (uint16_t) MSEC_TO_UNITS(7.5, UNIT_1_25_MS) /**< Determines minimum connection interval in milliseconds. */
#define MAX_CONNECTION_INTERVAL         (uint16_t) MSEC_TO_UNITS(30, UNIT_1_25_MS)  /**< Determines maximum connection interval in milliseconds. */
#define SLAVE_LATENCY                   0                                           /**< Determines slave latency in terms of connection events. */
#define SUPERVISION_TIMEOUT             (uint16_t) MSEC_TO_UNITS(4000, UNIT_10_MS)  /**< Determines supervision time-out in units of 10 milliseconds. */

#define UUID16_SIZE                     2                                           /**< Size of a UUID, in bytes. */

/**@brief   Priority of the application BLE event handler.
 * @note    You shouldn't need to modify this value.
 */
#define APP_BLE_OBSERVER_PRIO           3

/**@brief Macro to unpack 16bit unsigned UUID from an octet stream.
 */
#define UUID16_EXTRACT(DST, SRC) \
    do                           \
    {                            \
        (*(DST))   = (SRC)[1];   \
        (*(DST)) <<= 8;          \
        (*(DST))  |= (SRC)[0];   \
    } while (0)


/**@brief Variable length data encapsulation in terms of length and pointer to data. */
typedef struct
{
    uint8_t  * p_data;   /**< Pointer to data. */
    uint16_t   data_len; /**< Length of data. */
} data_t;


static bool in_seen_list(uint16_t UUID);
static int get_seen_list_idx(uint16_t UUID);


static ble_hrs_t m_hrs;                                             /**< Heart rate service instance. */
static ble_rscs_t m_rscs;                                           /**< Running speed and cadence service instance. */
static ble_hrs_c_t m_hrs_c;                                         /**< Heart rate service client instance. */
static ble_rscs_c_t m_rscs_c;                                       /**< Running speed and cadence service client instance. */

NRF_BLE_GATT_DEF(m_gatt);                                           /**< GATT module instance. */
BLE_ADVERTISING_DEF(m_advertising);                                 /**< Advertising module instance. */
BLE_DB_DISCOVERY_ARRAY_DEF(m_db_discovery, 2);                      /**< Database discovery module instances. */

static uint16_t m_conn_handle_hrs_c  = BLE_CONN_HANDLE_INVALID;     /**< Connection handle for the HRS central application */
static uint16_t m_conn_handle_rscs_c = BLE_CONN_HANDLE_INVALID;     /**< Connection handle for the RSC central application */

/**@brief names which the central applications will scan for, and which will be advertised by the peripherals.
 *  if these are set to empty strings, the UUIDs defined below will be used
 */
static char const m_target_periph_name[] = "Node";

/**@brief UUIDs which the central applications will scan for if the name above is set to an empty string,
 * and which will be advertised by the peripherals.
 */
#define MAX_ANCHOR_COUNT 8

SemaphoreHandle_t rxSemaphore, txSemaphore, sus_resp, sus_init, print_list_sem;

static int range_flag;
uint16_t NODE_UUID = 1;
#define NODE_UUID_START     0x00FF
#define UUID_INDICATOR 0x1800 
#define BLE_UWB_RANGE0 0x0000
#define BLE_UWB_RANGE1 0x0000
#define BLE_UWB_RANGE2 0x0000
#define NCNT 8


QueueHandle_t uart_queue;


static ble_uuid_t m_adv_uuids[] =
{
    {UUID_INDICATOR              , BLE_UUID_TYPE_BLE},
    {NODE_UUID_START      , BLE_UUID_TYPE_BLE}
    //{BLE_UWB_RANGE0             , BLE_UUID_TYPE_BLE},
    //{BLE_UWB_RANGE1             , BLE_UUID_TYPE_BLE},
    //{BLE_UWB_RANGE2             , BLE_UUID_TYPE_BLE}
     
};
//static int BLE_UWB_RANGE = 0;



/*
static ble_uuid_t m_adv_uuids[] =
{
    {BLE_UUID_HEART_RATE_SERVICE,        BLE_UUID_TYPE_BLE},
    {BLE_UUID_RUNNING_SPEED_AND_CADENCE, BLE_UUID_TYPE_BLE},
    {BLE_UUID_SYSTEM_ADDED             , BLE_UUID_TYPE_BLE},
    {BLE_UWB_RANGE                     , BLE_UUID_TYPE_VENDOR_BEGIN}
};
*/





/**@brief Parameters used when scanning. */
static ble_gap_scan_params_t const m_scan_params =
{
    .active   = 1,
    .interval = SCAN_INTERVAL,
    .window   = SCAN_WINDOW,
    .timeout  = SCAN_TIMEOUT,
    #if (NRF_SD_BLE_API_VERSION <= 2)
        .selective   = 0,
        .p_whitelist = NULL,
    #endif
    #if (NRF_SD_BLE_API_VERSION >= 3)
        .use_whitelist = 0,
    #endif
};

/**@brief Connection parameters requested for connection. */
static ble_gap_conn_params_t const m_connection_param =
{
    MIN_CONNECTION_INTERVAL,
    MAX_CONNECTION_INTERVAL,
    SLAVE_LATENCY,
    SUPERVISION_TIMEOUT
};


typedef struct node{
    int UUID;
    int8_t RSSI;
    int time_stamp;
    float range;
} node;



node seen_list[MAX_ANCHOR_COUNT];
int last_seen_idx = 0;



static int ble_started;
static int uwb_started;
uint32_t time_keeper;
static int node_added;



//-----------------dw1000----------------------------
/*DW1000 config function*/
static dwt_config_t config = {
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

/* Preamble timeout, in multiple of PAC size. See NOTE 3 below. */
#define PRE_TIMEOUT 1000

/* Delay between frames, in UWB microseconds. See NOTE 1 below. */
#define POLL_TX_TO_RESP_RX_DLY_UUS 100 

/*Should be accurately calculated during calibration*/
#define TX_ANT_DLY 16300
#define RX_ANT_DLY 16456



static int initiator_freq = 100;


volatile int tx_int_flag = 0 ; // Transmit success interrupt flag
volatile int rx_int_flag = 0 ; // Receive success interrupt flag
volatile int to_int_flag = 0 ; // Timeout interrupt flag
volatile int er_int_flag = 0 ; // Error interrupt flag 

//--------------dw1000---end---------------


/**@brief Function to handle asserts in the SoftDevice.
 *
 * @details This function will be called in case of an assert in the SoftDevice.
 *
 * @warning This handler is an example only and does not fit a final product. You need to analyze
 *          how your product is supposed to react in case of Assert.
 * @warning On assert from the SoftDevice, the system can only recover on reset.
 *
 * @param[in] line_num     Line number of the failing ASSERT call.
 * @param[in] p_file_name  File name of the failing ASSERT call.
 */
void assert_nrf_callback(uint16_t line_num, const uint8_t * p_file_name)
{
    app_error_handler(0xDEADBEEF, line_num, p_file_name);
}

/**@brief Function for handling errors from the Connection Parameters module.
 *
 * @param[in] nrf_error  Error code containing information about what went wrong.
 */
static void conn_params_error_handler(uint32_t nrf_error)
{
    APP_ERROR_HANDLER(nrf_error);
}


/**@brief Parses advertisement data, providing length and location of the field in case
 *        matching data is found.
 *
 * @param[in]  Type of data to be looked for in advertisement data.
 * @param[in]  Advertisement report length and pointer to report.
 * @param[out] If data type requested is found in the data report, type data length and
 *             pointer to data will be populated here.
 *
 * @retval NRF_SUCCESS if the data type is found in the report.
 * @retval NRF_ERROR_NOT_FOUND if the data type could not be found.
 */
static uint32_t adv_report_parse(uint8_t type, data_t * p_advdata, data_t * p_typedata)
{
    uint32_t   index = 0;
    uint8_t  * p_data;

    p_data = p_advdata->p_data;

    while (index < p_advdata->data_len)
    {
        uint8_t field_length = p_data[index];
        uint8_t field_type   = p_data[index + 1];

        if (field_type == type)
        {
            p_typedata->p_data   = &p_data[index + 2];
            p_typedata->data_len = field_length - 1;
            return NRF_SUCCESS;
        }
        index += field_length + 1;
    }
    return NRF_ERROR_NOT_FOUND;
}


/**@brief Function for initiating scanning.
 */
static void scan_start(void)
{
    ret_code_t err_code;

    (void) sd_ble_gap_scan_stop();

    err_code = sd_ble_gap_scan_start(&m_scan_params);
    // It is okay to ignore this error since we are stopping the scan anyway.
    if (err_code != NRF_ERROR_INVALID_STATE)
    {
        APP_ERROR_CHECK(err_code);
    }
}


/**@brief Function for initiating advertising and scanning.
 */
static void adv_scan_start(void)
{
    ret_code_t err_code;

    //check if there are no flash operations in progress
    if (!nrf_fstorage_is_busy(NULL))
    {
        // Start scanning for peripherals and initiate connection to devices which
        // advertise Heart Rate or Running speed and cadence UUIDs.
        if(ble_started == 1) 
        {
          scan_start();

          // Turn on the LED to signal scanning.
          //bsp_board_led_on(CENTRAL_SCANNING_LED);

          // Start advertising.
          err_code = ble_advertising_start(&m_advertising, BLE_ADV_MODE_FAST);
          APP_ERROR_CHECK(err_code);
        }
    }
}


/**@brief Function for handling Peer Manager events.
 *
 * @param[in] p_evt  Peer Manager event.
 */
static void pm_evt_handler(pm_evt_t const * p_evt)
{
    ret_code_t err_code;

    switch (p_evt->evt_id)
    {
        case PM_EVT_BONDED_PEER_CONNECTED:
        {
            NRF_LOG_INFO("Connected to a previously bonded device.");
        } break;

        case PM_EVT_CONN_SEC_SUCCEEDED:
        {
            NRF_LOG_INFO("Connection secured: role: %d, conn_handle: 0x%x, procedure: %d.",
                         ble_conn_state_role(p_evt->conn_handle),
                         p_evt->conn_handle,
                         p_evt->params.conn_sec_succeeded.procedure);
        } break;

        case PM_EVT_CONN_SEC_FAILED:
        {
            /* Often, when securing fails, it shouldn't be restarted, for security reasons.
             * Other times, it can be restarted directly.
             * Sometimes it can be restarted, but only after changing some Security Parameters.
             * Sometimes, it cannot be restarted until the link is disconnected and reconnected.
             * Sometimes it is impossible, to secure the link, or the peer device does not support it.
             * How to handle this error is highly application dependent. */
        } break;

        case PM_EVT_CONN_SEC_CONFIG_REQ:
        {
            // Reject pairing request from an already bonded peer.
            pm_conn_sec_config_t conn_sec_config = {.allow_repairing = false};
            pm_conn_sec_config_reply(p_evt->conn_handle, &conn_sec_config);
        } break;

        case PM_EVT_STORAGE_FULL:
        {
            // Run garbage collection on the flash.
            err_code = fds_gc();
            if (err_code == FDS_ERR_BUSY || err_code == FDS_ERR_NO_SPACE_IN_QUEUES)
            {
                // Retry.
            }
            else
            {
                APP_ERROR_CHECK(err_code);
            }
        } break;

        case PM_EVT_PEERS_DELETE_SUCCEEDED:
        {
            adv_scan_start();
        } break;

        case PM_EVT_LOCAL_DB_CACHE_APPLY_FAILED:
        {
            // The local database has likely changed, send service changed indications.
            pm_local_database_has_changed();
        } break;

        case PM_EVT_PEER_DATA_UPDATE_FAILED:
        {
            // Assert.
            APP_ERROR_CHECK(p_evt->params.peer_data_update_failed.error);
        } break;

        case PM_EVT_PEER_DELETE_FAILED:
        {
            // Assert.
            APP_ERROR_CHECK(p_evt->params.peer_delete_failed.error);
        } break;

        case PM_EVT_PEERS_DELETE_FAILED:
        {
            // Assert.
            APP_ERROR_CHECK(p_evt->params.peers_delete_failed_evt.error);
        } break;

        case PM_EVT_ERROR_UNEXPECTED:
        {
            // Assert.
            APP_ERROR_CHECK(p_evt->params.error_unexpected.error);
        } break;

        case PM_EVT_CONN_SEC_START:
        case PM_EVT_PEER_DATA_UPDATE_SUCCEEDED:
        case PM_EVT_PEER_DELETE_SUCCEEDED:
        case PM_EVT_LOCAL_DB_CACHE_APPLIED:
        case PM_EVT_SERVICE_CHANGED_IND_SENT:
        case PM_EVT_SERVICE_CHANGED_IND_CONFIRMED:
        default:
            break;
    }
}



/**@brief Function for searching a given name in the advertisement packets.
 *
 * @details Use this function to parse received advertising data and to find a given
 * name in them either as 'complete_local_name' or as 'short_local_name'.
 *
 * @param[in]   p_adv_report   advertising data to parse.
 * @param[in]   name_to_find   name to search.
 * @return   true if the given name was found, false otherwise.
 */
static bool find_adv_name(ble_gap_evt_adv_report_t const * p_adv_report, char const * name_to_find)
{
    ret_code_t err_code;
    data_t     adv_data;
    data_t     dev_name;

    // Initialize advertisement report for parsing
    adv_data.p_data   = (uint8_t *)p_adv_report->data;
    adv_data.data_len = p_adv_report->dlen;

    //search for advertising names
    err_code = adv_report_parse(BLE_GAP_AD_TYPE_COMPLETE_LOCAL_NAME, &adv_data, &dev_name);
    if (err_code == NRF_SUCCESS)
    {
        if (memcmp(name_to_find, dev_name.p_data, dev_name.data_len)== 0)
        {
            
            return true;
        }
    }
    else
    {
        // Look for the short local name if it was not found as complete
        err_code = adv_report_parse(BLE_GAP_AD_TYPE_SHORT_LOCAL_NAME,
                                    &adv_data,
                                    &dev_name);
        if (err_code != NRF_SUCCESS)
        {
            return false;
        }
        if (memcmp(m_target_periph_name, dev_name.p_data, dev_name.data_len)== 0)
        {
            return true;
        }
    }
    return false;
}


/**@brief Function for searching a UUID in the advertisement packets.
 *
 * @details Use this function to parse received advertising data and to find a given
 * UUID in them.
 *
 * @param[in]   p_adv_report   advertising data to parse.
 * @param[in]   uuid_to_find   UUIID to search.
 * @return   true if the given UUID was found, false otherwise.
 */
static bool find_adv_uuid(ble_gap_evt_adv_report_t const * p_adv_report, uint16_t uuid_to_find)
{
    ret_code_t err_code;
    data_t     adv_data;
    data_t     type_data;

    // Initialize advertisement report for parsing.
    adv_data.p_data   = (uint8_t *)p_adv_report->data;
    adv_data.data_len = p_adv_report->dlen;

    err_code = adv_report_parse(BLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_MORE_AVAILABLE,
                                &adv_data,
                                &type_data);

    if (err_code != NRF_SUCCESS)
    {
        // Look for the services in 'complete' if it was not found in 'more available'.
        err_code = adv_report_parse(BLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_COMPLETE,
                                    &adv_data,
                                    &type_data);

        if (err_code != NRF_SUCCESS)
        {
            // If we can't parse the data, then exit.
            return false;
        }
    }

    // Verify if any UUID match the given UUID.
    for (uint32_t i = 0; i < (type_data.data_len / UUID16_SIZE); i++)
    {
        uint16_t extracted_uuid;
        UUID16_EXTRACT(&extracted_uuid, &type_data.p_data[i * UUID16_SIZE]);

        if (extracted_uuid == uuid_to_find)
        {
            return true;
        }
    }
    return false;
}


static uint16_t find_adv_uuid_next(ble_gap_evt_adv_report_t const * p_adv_report)
{
    ret_code_t err_code;
    data_t     adv_data;
    data_t     type_data;

    // Initialize advertisement report for parsing.
    adv_data.p_data   = (uint8_t *)p_adv_report->data;
    adv_data.data_len = p_adv_report->dlen;

    err_code = adv_report_parse(BLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_MORE_AVAILABLE,
                                &adv_data,
                                &type_data);

    if (err_code != NRF_SUCCESS)
    {
        // Look for the services in 'complete' if it was not found in 'more available'.
        err_code = adv_report_parse(BLE_GAP_AD_TYPE_16BIT_SERVICE_UUID_COMPLETE,
                                    &adv_data,
                                    &type_data);

        if (err_code != NRF_SUCCESS)
        {
            // If we can't parse the data, then exit.
            return -1;
        }
    }

    // Verify if any UUID match the given UUID.
    for (uint32_t i = 0; i < (type_data.data_len / UUID16_SIZE); i++)
    {
        uint16_t extracted_uuid;
        UUID16_EXTRACT(&extracted_uuid, &type_data.p_data[i * UUID16_SIZE]);

        if (extracted_uuid == UUID_INDICATOR)
        {
            UUID16_EXTRACT(&extracted_uuid, &type_data.p_data[(i+1) * UUID16_SIZE]);

            return extracted_uuid;
            //if(extracted_uuid == uuid_to_find) return true;
        }
    }
    return -1;
}


/**@brief   Function for handling BLE events from central applications.
 *
 * @details This function parses scanning reports and initiates a connection to peripherals when a
 *          target UUID is found. It updates the status of LEDs used to report central applications
 *          activity.
 *
 * @param[in]   p_ble_evt   Bluetooth stack event.
 */
static void on_ble_central_evt(ble_evt_t const * p_ble_evt)
{
    ret_code_t            err_code;
    ble_gap_evt_t const * p_gap_evt = &p_ble_evt->evt.gap_evt;

    switch (p_ble_evt->header.evt_id)
    {
        // Upon connection, check which peripheral has connected (HR or RSC), initiate DB
        // discovery, update LEDs status and resume scanning if necessary.
        case BLE_GAP_EVT_CONNECTED:
        {
            NRF_LOG_INFO("Central connected");
            // If no Heart Rate sensor or RSC sensor is currently connected, try to find them on this peripheral.
            if (   (m_conn_handle_hrs_c  == BLE_CONN_HANDLE_INVALID)
                || (m_conn_handle_rscs_c == BLE_CONN_HANDLE_INVALID))
            {
                NRF_LOG_INFO("Attempt to find HRS or RSC on conn_handle 0x%x", p_gap_evt->conn_handle);

                err_code = ble_db_discovery_start(&m_db_discovery[0], p_gap_evt->conn_handle);
                if (err_code == NRF_ERROR_BUSY)
                {
                    err_code = ble_db_discovery_start(&m_db_discovery[1], p_gap_evt->conn_handle);
                    APP_ERROR_CHECK(err_code);
                }
                else
                {
                    APP_ERROR_CHECK(err_code);
                }
            }

            // Update LEDs status, and check if we should be looking for more peripherals to connect to.
            bsp_board_led_on(CENTRAL_CONNECTED_LED);
            if (ble_conn_state_n_centrals() == NRF_SDH_BLE_CENTRAL_LINK_COUNT)
            {
                //sp_board_led_off(CENTRAL_SCANNING_LED);
            }
            else
            {
                // Resume scanning.
                //bsp_board_led_on(CENTRAL_SCANNING_LED);
                scan_start();
            }
        } break; // BLE_GAP_EVT_CONNECTED

        // Upon disconnection, reset the connection handle of the peer which disconnected,
        // update the LEDs status and start scanning again.
        case BLE_GAP_EVT_DISCONNECTED:
        {
            if (p_gap_evt->conn_handle == m_conn_handle_hrs_c)
            {
                NRF_LOG_INFO("HRS central disconnected (reason: %d)",
                             p_gap_evt->params.disconnected.reason);

                m_conn_handle_hrs_c = BLE_CONN_HANDLE_INVALID;
            }
            if (p_gap_evt->conn_handle == m_conn_handle_rscs_c)
            {
                NRF_LOG_INFO("RSC central disconnected (reason: %d)",
                             p_gap_evt->params.disconnected.reason);

                m_conn_handle_rscs_c = BLE_CONN_HANDLE_INVALID;
            }

            if (   (m_conn_handle_rscs_c == BLE_CONN_HANDLE_INVALID)
                || (m_conn_handle_hrs_c  == BLE_CONN_HANDLE_INVALID))
            {
                // Start scanning
                scan_start();

                // Update LEDs status.
                //bsp_board_led_on(CENTRAL_SCANNING_LED);
            }

            if (ble_conn_state_n_centrals() == 0)
            {
                //bsp_board_led_off(CENTRAL_CONNECTED_LED);
            }
        } break; // BLE_GAP_EVT_DISCONNECTED


        case BLE_GAP_EVT_RSSI_CHANGED:
        {
    
            NRF_LOG_INFO("%d",&p_gap_evt->params.rssi_changed.rssi);
        } break;

        
        case BLE_GAP_EVT_ADV_REPORT:
        {
            
            if (strlen(m_target_periph_name) != 0)
            {
                
                if (find_adv_name(&p_gap_evt->params.adv_report, m_target_periph_name))
                {
                     //Node Found
                    /*
                    Add to List
  
                     - Get UUID
                     - Get RSSI
                     - Get Current Timestamp
                     */

                     
                     uint16_t found_UUID = find_adv_uuid_next(&p_gap_evt->params.adv_report);
                     if(found_UUID != NODE_UUID && !in_seen_list(found_UUID)){
                       

                       uint16_t index = get_seen_list_idx(0); //Get empty index
                       if(index == -1) //If list is full
                       {
                        index = MAX_ANCHOR_COUNT-1; //Evict least RSSI
                       }
                       seen_list[last_seen_idx].UUID = found_UUID;
                       seen_list[last_seen_idx].RSSI = p_ble_evt->evt.gap_evt.params.adv_report.rssi;
                       //printf("%d \r\n",p_ble_evt->evt.gap_evt.params.adv_report.rssi); 
                       seen_list[last_seen_idx].time_stamp = time_keeper;

                       last_seen_idx += 1;
                       last_seen_idx %= MAX_ANCHOR_COUNT;
                       node_added = 1;

                     }

                     if((found_UUID != NODE_UUID) && in_seen_list(found_UUID) ) //Update
                     {
                       int index = get_seen_list_idx(found_UUID);
                       seen_list[index].RSSI = p_ble_evt->evt.gap_evt.params.adv_report.rssi;
                       seen_list[index].time_stamp = time_keeper;

                     }




                   
                    // Initiate connection.
                    /*
                    err_code = sd_ble_gap_connect(&p_gap_evt->params.adv_report.peer_addr,
                                                  &m_scan_params,
                                                  &m_connection_param,
                                                  APP_BLE_CONN_CFG_TAG);
                    
                    if (err_code != NRF_SUCCESS)
                    {
                        NRF_LOG_INFO("Connection Request Failed, reason %d", err_code);
                    }
                    */
                }
            }
            else
            {
                // We do not want to connect to two peripherals offering the same service, so when
                // a UUID is matched, we check that we are not already connected to a peer which
                // offers the same service.
                if (   (find_adv_uuid(&p_gap_evt->params.adv_report, BLE_UUID_HEART_RATE_SERVICE)
                        && (m_conn_handle_hrs_c == BLE_CONN_HANDLE_INVALID))
                    || (find_adv_uuid(&p_gap_evt->params.adv_report, BLE_UUID_RUNNING_SPEED_AND_CADENCE)
                        && (m_conn_handle_rscs_c == BLE_CONN_HANDLE_INVALID)))
                {
                    // Initiate connection.
                    err_code = sd_ble_gap_connect(&p_gap_evt->params.adv_report.peer_addr,
                                                  &m_scan_params,
                                                  &m_connection_param,
                                                  APP_BLE_CONN_CFG_TAG);
                    if (err_code != NRF_SUCCESS)
                    {
                        NRF_LOG_WARNING("Connection Request Failed, reason %d", err_code);
                    }
                }
            }
        } break; // BLE_GAP_ADV_REPORT

        case BLE_GAP_EVT_TIMEOUT:
        {
            // We have not specified a timeout for scanning, so only connection attemps can timeout.
            if (p_gap_evt->params.timeout.src == BLE_GAP_TIMEOUT_SRC_CONN)
            {
                NRF_LOG_INFO("Connection Request timed out.");
            }
        } break;

        case BLE_GAP_EVT_CONN_PARAM_UPDATE_REQUEST:
        {
            // Accept parameters requested by peer.
            err_code = sd_ble_gap_conn_param_update(p_gap_evt->conn_handle,
                                        &p_gap_evt->params.conn_param_update_request.conn_params);
            APP_ERROR_CHECK(err_code);
        } break;

#ifndef S140
        case BLE_GAP_EVT_PHY_UPDATE_REQUEST:
        {
            NRF_LOG_DEBUG("PHY update request.");
            ble_gap_phys_t const phys =
            {
                .rx_phys = BLE_GAP_PHY_AUTO,
                .tx_phys = BLE_GAP_PHY_AUTO,
            };
            err_code = sd_ble_gap_phy_update(p_ble_evt->evt.gap_evt.conn_handle, &phys);
            APP_ERROR_CHECK(err_code);
        } break;
#endif

        case BLE_GATTC_EVT_TIMEOUT:
            // Disconnect on GATT Client timeout event.
            NRF_LOG_DEBUG("GATT Client Timeout.");
            err_code = sd_ble_gap_disconnect(p_ble_evt->evt.gattc_evt.conn_handle,
                                             BLE_HCI_REMOTE_USER_TERMINATED_CONNECTION);
            APP_ERROR_CHECK(err_code);
            break;

        case BLE_GATTS_EVT_TIMEOUT:
            // Disconnect on GATT Server timeout event.
            NRF_LOG_DEBUG("GATT Server Timeout.");
            err_code = sd_ble_gap_disconnect(p_ble_evt->evt.gatts_evt.conn_handle,
                                             BLE_HCI_REMOTE_USER_TERMINATED_CONNECTION);
            APP_ERROR_CHECK(err_code);
            break;

        default:
            // No implementation needed.
            break;
    }
}


/**@brief   Function for handling BLE events from peripheral applications.
 * @details Updates the status LEDs used to report the activity of the peripheral applications.
 *
 * @param[in]   p_ble_evt   Bluetooth stack event.
 */
static void on_ble_peripheral_evt(ble_evt_t const * p_ble_evt)
{
    ret_code_t err_code;

    switch (p_ble_evt->header.evt_id)
    {
        case BLE_GAP_EVT_CONNECTED:
            NRF_LOG_INFO("Peripheral connected");
            bsp_board_led_off(PERIPHERAL_ADVERTISING_LED);
            //bsp_board_led_on(PERIPHERAL_CONNECTED_LED);
            break;

        case BLE_GAP_EVT_DISCONNECTED:
            NRF_LOG_INFO("Peripheral disconnected");
            bsp_board_led_off(PERIPHERAL_CONNECTED_LED);
            break;

#ifndef S140
        case BLE_GAP_EVT_PHY_UPDATE_REQUEST:
        {
            NRF_LOG_DEBUG("PHY update request.");
            ble_gap_phys_t const phys =
            {
                .rx_phys = BLE_GAP_PHY_AUTO,
                .tx_phys = BLE_GAP_PHY_AUTO,
            };
            err_code = sd_ble_gap_phy_update(p_ble_evt->evt.gap_evt.conn_handle, &phys);
            APP_ERROR_CHECK(err_code);
        } break;
#endif

        case BLE_GATTC_EVT_TIMEOUT:
            // Disconnect on GATT Client timeout event.
            NRF_LOG_DEBUG("GATT Client Timeout.");
            err_code = sd_ble_gap_disconnect(p_ble_evt->evt.gattc_evt.conn_handle,
                                             BLE_HCI_REMOTE_USER_TERMINATED_CONNECTION);
            APP_ERROR_CHECK(err_code);
            break;

        case BLE_GATTS_EVT_TIMEOUT:
            // Disconnect on GATT Server timeout event.
            NRF_LOG_DEBUG("GATT Server Timeout.");
            err_code = sd_ble_gap_disconnect(p_ble_evt->evt.gatts_evt.conn_handle,
                                             BLE_HCI_REMOTE_USER_TERMINATED_CONNECTION);
            APP_ERROR_CHECK(err_code);
            break;

        case BLE_EVT_USER_MEM_REQUEST:
            err_code = sd_ble_user_mem_reply(p_ble_evt->evt.gap_evt.conn_handle, NULL);
            APP_ERROR_CHECK(err_code);
            break;

        case BLE_GATTS_EVT_RW_AUTHORIZE_REQUEST:
        {
            ble_gatts_evt_rw_authorize_request_t  req;
            ble_gatts_rw_authorize_reply_params_t auth_reply;

            req = p_ble_evt->evt.gatts_evt.params.authorize_request;

            if (req.type != BLE_GATTS_AUTHORIZE_TYPE_INVALID)
            {
                if ((req.request.write.op == BLE_GATTS_OP_PREP_WRITE_REQ)     ||
                    (req.request.write.op == BLE_GATTS_OP_EXEC_WRITE_REQ_NOW) ||
                    (req.request.write.op == BLE_GATTS_OP_EXEC_WRITE_REQ_CANCEL))
                {
                    if (req.type == BLE_GATTS_AUTHORIZE_TYPE_WRITE)
                    {
                        auth_reply.type = BLE_GATTS_AUTHORIZE_TYPE_WRITE;
                    }
                    else
                    {
                        auth_reply.type = BLE_GATTS_AUTHORIZE_TYPE_READ;
                    }
                    auth_reply.params.write.gatt_status = APP_FEATURE_NOT_SUPPORTED;
                    err_code = sd_ble_gatts_rw_authorize_reply(p_ble_evt->evt.gatts_evt.conn_handle,
                                                               &auth_reply);
                    APP_ERROR_CHECK(err_code);
                }
            }
        } break; // BLE_GATTS_EVT_RW_AUTHORIZE_REQUEST

        default:
            // No implementation needed.
            break;
    }
}


/**@brief Function for handling advertising events.
 *
 * @param[in] ble_adv_evt  Advertising event.
 */
static void on_adv_evt(ble_adv_evt_t ble_adv_evt)
{
    switch (ble_adv_evt)
    {
        case BLE_ADV_EVT_FAST:
        {
            NRF_LOG_INFO("Fast advertising.");
            //bsp_board_led_on(PERIPHERAL_ADVERTISING_LED);
        } break;

        case BLE_ADV_EVT_IDLE:
        {
            ret_code_t err_code = ble_advertising_start(&m_advertising, BLE_ADV_MODE_FAST);
            APP_ERROR_CHECK(err_code);
        } break;

        default:
            // No implementation needed.
            break;
    }
}

/**@brief Function for checking if a bluetooth stack event is an advertising timeout.
 *
 * @param[in] p_ble_evt Bluetooth stack event.
 */
static bool ble_evt_is_advertising_timeout(ble_evt_t const * p_ble_evt)
{
  return (   (p_ble_evt->header.evt_id == BLE_GAP_EVT_TIMEOUT)
          && (p_ble_evt->evt.gap_evt.params.timeout.src == BLE_GAP_TIMEOUT_SRC_ADVERTISING));
}


/**@brief Function for handling BLE events.
 *
 * @param[in]   p_ble_evt   Bluetooth stack event.
 * @param[in]   p_context   Unused.
 */
static void ble_evt_handler(ble_evt_t const * p_ble_evt, void * p_context)
{
    uint16_t conn_handle = p_ble_evt->evt.gap_evt.conn_handle;
    uint16_t role        = ble_conn_state_role(conn_handle);

    // Based on the role this device plays in the connection, dispatch to the right handler.
    if (role == BLE_GAP_ROLE_PERIPH || ble_evt_is_advertising_timeout(p_ble_evt))
    {
        //ble_hrs_on_ble_evt(p_ble_evt, &m_hrs);
        //ble_rscs_on_ble_evt(p_ble_evt, &m_rscs);
        //printf("peripheral \r\n");
        on_ble_peripheral_evt(p_ble_evt);
    }
    else if ((role == BLE_GAP_ROLE_CENTRAL) || (p_ble_evt->header.evt_id == BLE_GAP_EVT_ADV_REPORT))
    {
        //ble_hrs_c_on_ble_evt(p_ble_evt, &m_hrs_c);
        //ble_rscs_c_on_ble_evt(p_ble_evt, &m_rscs_c);
        //printf("central \r\n");
        on_ble_central_evt(p_ble_evt);
    }
}


/**@brief Function for initializing the BLE stack.
 *
 * @details Initializes the SoftDevice and the BLE event interrupts.
 */
static void ble_stack_init(void)
{
    ret_code_t err_code;

    err_code = nrf_sdh_enable_request();
    APP_ERROR_CHECK(err_code);

    // Configure the BLE stack using the default settings.
    // Fetch the start address of the application RAM.
    uint32_t ram_start = 0;
    err_code = nrf_sdh_ble_default_cfg_set(APP_BLE_CONN_CFG_TAG, &ram_start);
    APP_ERROR_CHECK(err_code);

    // Enable BLE stack.
    err_code = nrf_sdh_ble_enable(&ram_start);
    APP_ERROR_CHECK(err_code);

    // Register a handler for BLE events.
    NRF_SDH_BLE_OBSERVER(m_ble_observer, APP_BLE_OBSERVER_PRIO, ble_evt_handler, NULL);
}


/**@brief Function for the Peer Manager initialization.
 */
static void peer_manager_init(void)
{
    ble_gap_sec_params_t sec_param;
    ret_code_t err_code;

    err_code = pm_init();
    APP_ERROR_CHECK(err_code);

    memset(&sec_param, 0, sizeof(ble_gap_sec_params_t));

    // Security parameters to be used for all security procedures.
    sec_param.bond           = SEC_PARAM_BOND;
    sec_param.mitm           = SEC_PARAM_MITM;
    sec_param.lesc           = SEC_PARAM_LESC;
    sec_param.keypress       = SEC_PARAM_KEYPRESS;
    sec_param.io_caps        = SEC_PARAM_IO_CAPABILITIES;
    sec_param.oob            = SEC_PARAM_OOB;
    sec_param.min_key_size   = SEC_PARAM_MIN_KEY_SIZE;
    sec_param.max_key_size   = SEC_PARAM_MAX_KEY_SIZE;
    sec_param.kdist_own.enc  = 1;
    sec_param.kdist_own.id   = 1;
    sec_param.kdist_peer.enc = 1;
    sec_param.kdist_peer.id  = 1;

    err_code = pm_sec_params_set(&sec_param);
    APP_ERROR_CHECK(err_code);

    err_code = pm_register(pm_evt_handler);
    APP_ERROR_CHECK(err_code);
}


/**@brief Clear bond information from persistent storage.
 */
static void delete_bonds(void)
{
    ret_code_t err_code;

    //NRF_LOG_INFO("Erase bonds!");

    err_code = pm_peers_delete();
    APP_ERROR_CHECK(err_code);
}


/**@brief Function for initializing buttons and leds.
 *
 * @param[out] p_erase_bonds  Will be true if the clear bonding button was pressed to
 *                            wake the application up.
 */
static void buttons_leds_init(bool * p_erase_bonds)
{
    ret_code_t err_code;
    bsp_event_t startup_event;

    err_code = bsp_init(BSP_INIT_LED | BSP_INIT_BUTTONS, NULL);
    APP_ERROR_CHECK(err_code);

    err_code = bsp_btn_ble_init(NULL, &startup_event);
    APP_ERROR_CHECK(err_code);

    *p_erase_bonds = (startup_event == BSP_EVENT_CLEAR_BONDING_DATA);
}


/**@brief Function for the GAP initialization.
 *
 * @details This function sets up all the necessary GAP (Generic Access Profile) parameters of the
 *          device including the device name, appearance, and the preferred connection parameters.
 */
static void gap_params_init(void)
{
    ret_code_t              err_code;
    ble_gap_conn_params_t   gap_conn_params;
    ble_gap_conn_sec_mode_t sec_mode;

    BLE_GAP_CONN_SEC_MODE_SET_OPEN(&sec_mode);

    err_code = sd_ble_gap_device_name_set(&sec_mode,
                                          (const uint8_t *)DEVICE_NAME,
                                          strlen(DEVICE_NAME));
    APP_ERROR_CHECK(err_code);

    memset(&gap_conn_params, 0, sizeof(gap_conn_params));

    gap_conn_params.min_conn_interval = MIN_CONNECTION_INTERVAL;
    gap_conn_params.max_conn_interval = MAX_CONNECTION_INTERVAL;
    gap_conn_params.slave_latency     = SLAVE_LATENCY;
    gap_conn_params.conn_sup_timeout  = SUPERVISION_TIMEOUT;

    err_code = sd_ble_gap_ppcp_set(&gap_conn_params);
    APP_ERROR_CHECK(err_code);
}


/**@brief Function for initializing the GATT module.
 */
static void gatt_init(void)
{
    ret_code_t err_code = nrf_ble_gatt_init(&m_gatt, NULL);
    APP_ERROR_CHECK(err_code);
}


/**@brief Function for initializing the Connection Parameters module.
 */
static void conn_params_init(void)
{
    ret_code_t             err_code;
    ble_conn_params_init_t cp_init;

    memset(&cp_init, 0, sizeof(cp_init));

    cp_init.p_conn_params                  = NULL;
    cp_init.first_conn_params_update_delay = FIRST_CONN_PARAMS_UPDATE_DELAY;
    cp_init.next_conn_params_update_delay  = NEXT_CONN_PARAMS_UPDATE_DELAY;
    cp_init.max_conn_params_update_count   = MAX_CONN_PARAMS_UPDATE_COUNT;
    cp_init.start_on_notify_cccd_handle    = BLE_CONN_HANDLE_INVALID; // Start upon connection.
    cp_init.disconnect_on_fail             = true;
    cp_init.evt_handler                    = NULL;  // Ignore events.
    cp_init.error_handler                  = conn_params_error_handler;

    err_code = ble_conn_params_init(&cp_init);
    APP_ERROR_CHECK(err_code);
}



/**@brief Function for initializing the Advertising functionality.
 */

uint8_t     adv_manuf_data_data[3];

static void advertising_init(void)
{

    ret_code_t             err_code;
    ble_advertising_init_t init;

    
    ble_advdata_manuf_data_t adv_manuf_data;
    uint8_array_t            adv_manuf_data_array;
    
    memset(&init, 0, sizeof(init));

    init.advdata.name_type               = BLE_ADVDATA_FULL_NAME;
    init.advdata.include_appearance      = true;
    init.advdata.flags                   = BLE_GAP_ADV_FLAGS_LE_ONLY_GENERAL_DISC_MODE;
    init.advdata.uuids_complete.uuid_cnt =  sizeof(m_adv_uuids) / sizeof(m_adv_uuids[0]);
    init.advdata.uuids_complete.p_uuids  = m_adv_uuids;

    // Configuration of manufacturer specific data
    

    
    /*
    adv_manuf_data_array.p_data = adv_manuf_data_data;
    adv_manuf_data_array.size = 3;
    
    adv_manuf_data.company_identifier = 0xFF00;
    adv_manuf_data.data = adv_manuf_data_array;
    
    init.advdata.p_manuf_specific_data = &adv_manuf_data;
    
    
    */
  
    init.config.ble_adv_fast_enabled  = true;
    init.config.ble_adv_fast_interval = APP_ADV_INTERVAL;
    init.config.ble_adv_fast_timeout  = APP_ADV_TIMEOUT_IN_SECONDS;

    init.evt_handler = on_adv_evt;

    err_code = ble_advertising_init(&m_advertising, &init);
    APP_ERROR_CHECK(err_code);

    ble_advertising_conn_cfg_tag_set(&m_advertising, APP_BLE_CONN_CFG_TAG);
}


/**@brief Function for initializing logging.
 */
static void log_init(void)
{
    ret_code_t err_code = NRF_LOG_INIT(NULL);
    APP_ERROR_CHECK(err_code);

    NRF_LOG_DEFAULT_BACKENDS_INIT();
}


/** @brief Function to sleep until a BLE event is received by the application.
 */
static void power_manage(void)
{
    ret_code_t err_code = sd_app_evt_wait();
    APP_ERROR_CHECK(err_code);
}






static int role;
#define SCANNER 1
#define ADVERTISER 0
int tx_time;



bool in_seen_list(uint16_t UUID) {

  for(int i = 0; i < MAX_ANCHOR_COUNT; i++){

    if(seen_list[i].UUID == UUID){
      
      return true;
      
      }
  }
  return false;
}

int get_seen_list_idx(uint16_t UUID) {

  for(int i = 0; i < MAX_ANCHOR_COUNT; i++){

    if(seen_list[i].UUID == UUID){
      
      return i;
      
      }
  }
  return -1;
}

//---------------------- Timer Functions -------------------------//

APP_TIMER_DEF(m_timestamp_keeper);    /**< Handler for repeated timer used to blink LED 1. */


/**@brief Function for initializing the timer.
 */
static void timer_init(void)
{

    //APP_TIMER_INIT(APP_TIMER_PRESCALER, APP_TIMER_OP_QUEUE_SIZE, false);
    ret_code_t err_code = app_timer_init();
    APP_ERROR_CHECK(err_code);
}

/**@brief Timeout handler for the repeated timer.
 */
static void timestamp_handler(void * p_context)
{ 
    time_keeper += 1; 
}


//---------------------- UWB related Functions -------------------------//

void init_reconfig() {

  dwt_setrxaftertxdelay(POLL_TX_TO_RESP_RX_DLY_UUS);
  dwt_setrxtimeout(65000); // Maximum value timeout with DW1000 is 65ms  

}

void resp_reconfig() {

  dwt_setrxaftertxdelay(0);
  dwt_setrxtimeout(0);

}

uint16_t get_rand_num(uint32_t freq) {

      uint32_t lower = freq;
      uint32_t upper = freq+50;
      uint8_t num_rand_bytes_available;
      int err_code = sd_rand_application_bytes_available_get(&num_rand_bytes_available);
      APP_ERROR_CHECK(err_code);
      uint8_t rand_number;
      if (num_rand_bytes_available > 0)
      {
          err_code = sd_rand_application_vector_get(&rand_number, 1);
          APP_ERROR_CHECK(err_code);
      }


      float rand = rand_number * 1.0;

      float r =  (rand - 0) * (upper - lower) / (255 - 0) + lower;
      uint16_t ret = (uint16_t) r;
      //printf("%d \r\n", ret);


      return ret;
}


//------------------------ Task Functions -------------------------------//

TaskHandle_t ss_responder_task_handle; 
TaskHandle_t ranging_task_handle;
TaskHandle_t ss_initiator_task_handle; 
TaskHandle_t uart_task_handle;
TaskHandle_t list_task_handle;
TaskHandle_t monitor_task_handle;

/**
 * @brief Output visible nodes information
 */
void list_task_function()
{

  BaseType_t xHigherPriorityTaskWoken;
  //xSemaphoreTake(print_list_sem, portMAX_DELAY);

  while(1){
      //printf("%f\r\n", portTICK_PERIOD_MS);
      //float del = 3000/1024;
      vTaskDelay(100);

      xSemaphoreTake(print_list_sem, portMAX_DELAY);
      
      message new_message = {0};
      /*
      char node[10];
      if((uwb_started+ble_started) == 1) mode = "BLE";
      else if ((uwb_started+ble_started) == 2) mode = "BLE+UWB";
      else mode = "NONE";
      char msg [50];
      */
      //sprintf(msg, "My ID: %d MODE: %s ", NODE_UUID, mode);
      
      //strcpy(new_message.data, "# ID, RANGE, RSSI, TIMESTAMP   ");
      //strcat(new_message.data, msg);
      //strcat(new_message.data, "#####\r\n");
      
      printf("# ID, RANGE, RSSI, TIMESTAMP\r\n");

      //xQueueSendFromISR(uart_queue,(void *)&new_message, xHigherPriorityTaskWoken);
      printf("%s", new_message.data);
      for(int j = 0; j < MAX_ANCHOR_COUNT; j++)
      {

        if(seen_list[j].UUID != 0) printf("%d, %f, %d, %d \r\n", seen_list[j].UUID, seen_list[j].range, seen_list[j].RSSI, seen_list[j].time_stamp); 
        //printf("%d, %f, %d, %d \r\n", seen_list[j].UUID, seen_list[j].range, seen_list[j].RSSI, seen_list[j].time_stamp); 
        /*
        char list_item[50] ;

        char UUID_str[4] ;
        char range_str[8];
        char RSSI_str[4] ;
        char time_str[8];
        char idx_str[4];

        snprintf(UUID_str, 4, "%d", seen_list[j].UUID);
        snprintf(range_str, 8, "%f", seen_list[j].range);
        snprintf(RSSI_str, 4, "%d", seen_list[j].RSSI);
        snprintf(time_str, 8, "%d", seen_list[j].time_stamp);
        snprintf(idx_str, 4, "%d", j);

        strcpy(list_item, "");

        strcat(list_item, idx_str);
        strcat(list_item, ") ID: ");
        strcat(list_item, UUID_str);
        strcat(list_item, " range: ");
        strcat(list_item, range_str);
        strcat(list_item, " RSSI: ");
        strcat(list_item, RSSI_str);
        strcat(list_item, " Time: ");
        strcat(list_item, time_str);
        strcat(list_item, "\r\n");
        strcpy(new_message.data, list_item);
    

        //xQueueSendFromISR(uart_queue,(void *)&new_message, xHigherPriorityTaskWoken);
        printf("%s", list_item);
        */

      }

      //strcpy(new_message.data, "############################\r\n");

      //xQueueSendFromISR(uart_queue,(void *)&new_message, xHigherPriorityTaskWoken);
      //printf("%s", new_message.data);
      //printf("ranging task state: %d \r\n", eTaskGetState(ranging_task_handle));
      //printf("response task state: %d \r\n", eTaskGetState(ss_responder_task_handle));
      xSemaphoreGive(print_list_sem);
   }
}


/**
 * @brief UART parser
 */
void uart_task_function(void * pvParameter){

  UNUSED_PARAMETER(pvParameter);

  message incoming_message = {0};

  while(1){
    
    vTaskDelay(100);
    if(xQueueReceive(uart_queue, &incoming_message, 0) == pdPASS){  
      
      if(0 == strncmp((const char *)incoming_message.data, (const char *)"PL ", (size_t)3)){
        char *append = (const char *)incoming_message.data + 3;
        printf("%s", append);
      }


      //Handle valid AT command begining with AT+

     else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+", (size_t)3)){
        //Handle specific AT commands
        if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STARTUWB", (size_t)11)){
            //printf("START UWB command recieved\r\n");
            uwb_started = 1;
            xSemaphoreGive(sus_resp);
            xSemaphoreGive(sus_init);
            bsp_board_led_on(BSP_BOARD_LED_2);
            printf("OK\r\n");
            //xSemaphoreGive(sus_resp); // Give the suspension semaphore so UWB can continue
        }
        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STOPUWB", (size_t)10)){
            uwb_started = 0;
            xSemaphoreTake(sus_resp, portMAX_DELAY);
            xSemaphoreTake(sus_init, portMAX_DELAY);
            //printf("STOP UWB command recieved\r\n");
            bsp_board_led_off(BSP_BOARD_LED_2);
            printf("OK\r\n");
            //Take UWB suspension semaphore
        }
        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STARTBLE", (size_t)11)){
            //printf("START BLE command recieved\r\n");
            ble_started = 1;
            xSemaphoreGive(print_list_sem);
            adv_scan_start();
            bsp_board_led_on(BSP_BOARD_LED_1);
            printf("OK\r\n");
                    //Start BLE
        }
        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+STOPBLE", (size_t)10)){
            //printf("STOP BLE command recieved\r\n");
            ble_started = 0;
            sd_ble_gap_adv_stop();
            sd_ble_gap_scan_stop();
            xSemaphoreTake(print_list_sem, portMAX_DELAY);
                    //Stop BLE
            bsp_board_led_off(BSP_BOARD_LED_1);
            printf("OK\r\n");
        }
        


        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+ID", (size_t)5)){
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t rec_uuid = atoi(uuid_char);
            
            NODE_UUID = rec_uuid;
            m_adv_uuids[1].uuid = NODE_UUID; 
            advertising_init();

            writeFlashID(rec_uuid, 1);

           printf("OK\r\n");
            //printf("Set UUID command recieved: %d\r\n", rec_uuid );
            
        }
        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+BOOTMODE", (size_t)11)){
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t mode = atoi(uuid_char);
          
            if(mode == 1) 
            {
              writeFlashID(1, 2);
            }
            else if (mode == 2)
            {
               writeFlashID(2, 2);
            }
            else{
              writeFlashID(3, 2);
            }
            //printf("%d ", mode);
            printf("OK \r\n");
        }
        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+RATE", (size_t)7)){
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t rate = atoi(uuid_char);
          
            writeFlashID(rate, 3);
            initiator_freq = rate;
            
            printf("%d ", rate);
            printf("OK \r\n");
        }
        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+CHANNEL", (size_t)10)){
            printf("Channel testing \r\n");
        }

        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+TIMEOUT", (size_t)10)){
            printf("Timeout testing \r\n");
            char buf[100];
            strcpy(buf, incoming_message.data);
            char *uuid_char = strtok(buf, " ");
            uuid_char = strtok(NULL, " ");
            uint32_t rate = atoi(uuid_char);

            printf("%d \r\n", rate);
            //writeFlashID(rate, 3);
            //initiator_freq = rate;
            
            //printf("%d ", rate);
            //printf("OK \r\n");
        }

        else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT+LIST", (size_t)7)){
            //print_seen_list();
        }
        else printf("ERROR Invalid AT Command\r\n");
      }
      else if(0 == strncmp((const char *)incoming_message.data, (const char *)"AT", (size_t)2))
      {
        
        printf("OK\r\n");
      }
      else{
        printf("Not an AT command\r\n");
        //printf("%s",(const char *)incoming_message.data);
      }  
    }
  }
}

/**
 * @brief UWB ranging task.
 */
void ranging_task_function(void *pvParameter)
{
  
  while(1){
      if(initiator_freq != 0)
      {
        uint16_t rand = get_rand_num(initiator_freq);
      
        
        vTaskDelay(rand);
        //vTaskDelay(5000);
        
        xSemaphoreTake(sus_resp, 0); //Suspend Responder Task
        int state = eTaskGetState(ss_responder_task_handle);
      
        xSemaphoreTake(sus_init, portMAX_DELAY);
        vTaskDelay(10);
        dwt_forcetrxoff();

        init_reconfig();

        int i = 0;
        state = eTaskGetState(ss_responder_task_handle);
        //printf("SS STATE: %d \r\n" , state);
     
        while(i < MAX_ANCHOR_COUNT){
          if(seen_list[i].UUID != 0)
          {
            if (debug_print)printf("IN\r\n");
            float range1 = ss_init_run(seen_list[i].UUID);
            if (debug_print)printf("range 1 out \r\n");
            if (debug_print)printf("range 1: %f \r\n", range1);
            vTaskDelay(10);
            float range2 = ss_init_run(seen_list[i].UUID);
            if (debug_print)printf("range 2 out \r\n");
            if (debug_print)printf("range 2: %f \r\n", range2);
            vTaskDelay(10);
            float range3 = ss_init_run(seen_list[i].UUID);
            if (debug_print)printf("range 3 out \r\n");
            if (debug_print)printf("range 3: %f \r\n", range3);
            vTaskDelay(10);
            if (debug_print)printf("OUT\r\n");
            int numThru = 3;
            if (range1 == -1)
            {
              range1 = 0;
              numThru -= 1;
            }
            if (range2 == -1)
            {
              range2 = 0;
              numThru -= 1;
            }
            if(range3 == -1)
            {
              range3 = 0;
              numThru -= 1;
            }
        
            //printf("R: %f \r\n", (range1 + range2 + range3)/numThru);
            float range = (range1 + range2 + range3)/numThru;
            //printf("range: %f \r\n", range);
            if( (numThru != 0) && (range >= -5) && (range <= 100) ) seen_list[i].range = range;
            //vTaskDelay(250);
           }
            i++;
        
        }
        
        resp_reconfig();
        dwt_forcetrxoff();
        //vTaskResume(ss_responder_task_handle);
        xSemaphoreGive(sus_init);
        xSemaphoreGive(sus_resp); //Resume Responder Task
       }
    }

 }

/**
 * @brief function to check nodes eviction
 */
void monitor_task_function()
{

  int count = 0;
  while(1)
  {
    vTaskDelay(1000);
    count += 1;
    
    xSemaphoreTake(sus_init, portMAX_DELAY);
    int removed = 0;
    for(int x = 0; x < MAX_ANCHOR_COUNT; x++)
      {
        if(seen_list[x].UUID != 0)
        {
          if( (time_keeper - seen_list[x].time_stamp) >= 10000) //Timeout Eviction
          {
            removed = 1;
            seen_list[x].UUID = 0;
            seen_list[x].range = 0;
            seen_list[x].time_stamp = 0;
            seen_list[x].RSSI = 0;
          }
        }
      }
      
      if(removed || node_added || ((count % 5) == 0)  ) //Re-sort by RSSI
      {
        //Now sort neighbor list
        (void) sd_ble_gap_scan_stop();

        for (int j = 0; j < MAX_ANCHOR_COUNT; j++)
        {
          for( int k = j+1; k < MAX_ANCHOR_COUNT; k++)
          {
            if(seen_list[j].RSSI < seen_list[k].RSSI)
            {
                //printf("j : %d k: %d \r\n", seen_list[j].RSSI, seen_list[k].RSSI);
                node A = seen_list[j];
                seen_list[j] = seen_list[k];
                seen_list[k] = A;
         
            }
          }
        }
        scan_start(); //Resume scanning/building up neighbor list
        node_added = 0;
        removed = 0;
        count = 0;
      }
      
      xSemaphoreGive(sus_init);


    //if(debug_print)printf("Still alive \r\n");
  }
}


int debug_print;

/**
 * @brief program main entrance.
 */
int main(void)
{

    debug_print = 0;
    //role = ADVERTISER;
    //mode = RESPONDER;
    for(int i = 0; i < MAX_ANCHOR_COUNT; i++)
    {
      seen_list[i].UUID = 0;
      seen_list[i].RSSI = 0;
      seen_list[i].time_stamp = 0;
      seen_list[i].range = 0;
    }


    bool erase_bonds;
    range_flag = 0;
    
    //SCB->SCR |= SCB_SCR_SLEEPDEEP_Msk;

    //vInterruptInit();
    //boUART_Init();
    //log_init();

    uart_init();                       // Init UART
    timer_init();                      // Init timeer
    buttons_leds_init(&erase_bonds);
    ble_stack_init();
    gap_params_init();
    gatt_init();
    conn_params_init();
    peer_manager_init();
    advertising_init();

    // Init flash data storage
    ret_code_t ret = fds_register(fds_evt_handler);
    if (ret != FDS_SUCCESS)
    {
        printf("reg error \r\n");// Registering of the FDS event handler has failed.
    }
    ret = fds_init();
    if (ret != FDS_SUCCESS)
    {
       printf("init error \r\n");
    }
     
    // UWB config part
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

    /* Initialization of the DW1000 interrupt*/

    //dwt_setcallbacks(&tx_conf_cb, &rx_ok_cb, &rx_to_cb, &rx_err_cb);

    /* Enable wanted interrupts (TX confirmation, RX good frames, RX timeouts and RX errors). */
    //dwt_setinterrupt(DWT_INT_TFRS | DWT_INT_RFCG | DWT_INT_RFTO | DWT_INT_RXPTO | DWT_INT_RPHE | DWT_INT_RFCE | DWT_INT_RFSL | DWT_INT_SFDT, 1);

    /* Apply default antenna delay value. See NOTE 2 below. */
    dwt_setrxantennadelay(RX_ANT_DLY);
    dwt_settxantennadelay(TX_ANT_DLY);

    /* Set preamble timeout for expected frames. See NOTE 3 below. */
    //dwt_setpreambledetecttimeout(0); // PRE_TIMEOUT
          
    /* Set expected response's delay and timeout. 
    * As this example only handles one incoming frame with always the same delay and timeout, those values can be set here once for all. */
   //dwt_setrxaftertxdelay(POLL_TX_TO_RESP_RX_DLY_UUS);
    dwt_setrxtimeout(0); // Maximum value timeout with DW1000 is 65ms 
    //dwt_write8bitoffsetreg(PMSC_ID, PMSC_CTRL0_OFFSET, 0x20);

  
    
    ret_code_t create_timer = app_timer_create(&m_timestamp_keeper, APP_TIMER_MODE_REPEATED, timestamp_handler);
    ret_code_t start_timer =  app_timer_start(m_timestamp_keeper, APP_TIMER_TICKS(1) , NULL);
  
    
    printf("Node On: Firmware version %s\r\n", FIRMWARE_VERSION);
    
    //LEDS_CONFIGURE(BSP_LED_0_MASK | BSP_LED_1_MASK | BSP_LED_2_MASK);

    bsp_board_led_on(BSP_BOARD_LED_0);
    //LEDS_ON(BSP_LED_0_MASK | BSP_LED_1_MASK | BSP_LED_2_MASK );

 
    
    if (erase_bonds == true)
    {
        // Scanning and advertising is done upon PM_EVT_PEERS_DELETE_SUCCEEDED event.
        delete_bonds();
        // Scanning and advertising is done by
    }
    else
    {
        //adv_scan_start();
        //sd_ble_gap_adv_stop();
        //sd_ble_gap_scan_stop();
    }
    int count = 0;

    rxSemaphore = xSemaphoreCreateBinary();
    txSemaphore = xSemaphoreCreateBinary();
    sus_resp = xSemaphoreCreateBinary();
    sus_init = xSemaphoreCreateBinary();
    print_list_sem = xSemaphoreCreateBinary();
    //xSemaphoreGive(sus_resp);

    uart_queue = xQueueCreate(25, sizeof(struct message));

    UNUSED_VARIABLE(xTaskCreate(ss_responder_task_function, "SSTWR_RESP", configMINIMAL_STACK_SIZE+600, NULL,1, &ss_responder_task_handle));
    UNUSED_VARIABLE(xTaskCreate(ranging_task_function, "RNG", configMINIMAL_STACK_SIZE+200, NULL, 2, &ranging_task_handle));
    UNUSED_VARIABLE(xTaskCreate(uart_task_function, "UART", configMINIMAL_STACK_SIZE+1200, NULL, 2, &uart_task_handle));
    UNUSED_VARIABLE(xTaskCreate(list_task_function, "LIST", configMINIMAL_STACK_SIZE+600, NULL, 2, &list_task_handle));
    UNUSED_VARIABLE(xTaskCreate(monitor_task_function, "MONITOR", configMINIMAL_STACK_SIZE+800, NULL, 2, &monitor_task_handle));
    


    fds_record_desc_t   record_desc_2;
    fds_find_token_t    ftok_2;
    memset(&ftok_2, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_1, &record_desc_2, &ftok_2) == FDS_SUCCESS) //If there is a stored ID
    {
        
        uint32_t id = getFlashID(1); //Get ID
        NODE_UUID = id;
        m_adv_uuids[1].uuid = NODE_UUID; 
        advertising_init(); //Set UUID


        uint32_t state = getFlashID(2); //Get State

        if( (state == 1) || (state == 2) ) //Start BLE
        {
          ble_started = 1;
          xSemaphoreGive(print_list_sem);
          adv_scan_start();
          bsp_board_led_on(BSP_BOARD_LED_1);
        }

        if (state == 2) //Start UWB
        {
          uwb_started = 1;
          xSemaphoreGive(sus_resp);
          xSemaphoreGive(sus_init);
          bsp_board_led_on(BSP_BOARD_LED_2);
        }

        //printf("%d %d\r\n", id, state);

    }
    fds_record_desc_t   record_desc_3;
    fds_find_token_t    ftok_3;
    memset(&ftok_3, 0x00, sizeof(fds_find_token_t));
    if (fds_record_find(FILE_ID, RECORD_KEY_3, &record_desc_3, &ftok_3) == FDS_SUCCESS) //If there is a stored rate
    {
      uint32_t rate = getFlashID(3);

      initiator_freq = rate;
      printf("%d\r\n", rate);
    }


   
    vTaskStartScheduler();
    while(1) 
    {

        APP_ERROR_HANDLER(NRF_ERROR_FORBIDDEN);
        
        
    }
}






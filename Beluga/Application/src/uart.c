/*! ----------------------------------------------------------------------------
 *  @file   uart.c
 *
 *  @brief  An implementation of uart init and uart event handler
 *
 *  @date   2020/06
 *
 *  @author WiseLab-CMU 
 */

#include <stdint.h>
#include "app_uart.h"
#include "ble_nus.h"
#include "dw1001_dev.h"
#include "nrf_uart.h"
#include "uart.h"
#include "FreeRTOS.h"
#include "portmacro_cmsis.h"
#include <string.h>
#include "queue.h"

static uint16_t   m_ble_nus_max_data_len = BLE_GATT_ATT_MTU_DEFAULT - 3; 
extern QueueHandle_t uart_queue;

/**
 * @brief Handling the data received over UART
 */
static void uart_event_handle(app_uart_evt_t * p_event)
{
    static uint8_t data_array[BLE_NUS_MAX_DATA_LEN];
    static uint8_t index = 0;
    uint32_t       err_code;

    switch (p_event->evt_type)
    {
        case APP_UART_DATA_READY:
            UNUSED_VARIABLE(app_uart_get(&data_array[index]));
            index++;
            if ((data_array[index - 1] == '\n') || (data_array[index - 1] == '\r') ||  (index >= (m_ble_nus_max_data_len)))
            {         
                send_AT_command(data_array);
                index = 0;
            }
            break;

        case APP_UART_COMMUNICATION_ERROR:
            // If uart error occur, keep moving on
            break;

        case APP_UART_FIFO_ERROR:
            // If uart error occur, keep moving on
            break;

        default:
            break;
    }
}


/**
 * @brief UART Initialization
 */
void uart_init(void)
{
  
    uint32_t  err_code;
    app_uart_comm_params_t const comm_params =
    {
        .rx_pin_no    = RX_PIN_NUMBER,
        .tx_pin_no    = TX_PIN_NUMBER, 
        .rts_pin_no   = RTS_PIN_NUMBER,
        .cts_pin_no   = CTS_PIN_NUMBER,
        .flow_control = APP_UART_FLOW_CONTROL_DISABLED,
        .use_parity   = false, 
        .baud_rate    = NRF_UART_BAUDRATE_115200
    };

    APP_UART_FIFO_INIT(&comm_params,
                       UART_RX_BUF_SIZE,
                       UART_TX_BUF_SIZE,
                       uart_event_handle,
                       APP_IRQ_PRIORITY_LOWEST,
                       err_code);

    APP_ERROR_CHECK(err_code);
    
}

/**
 * @brief Send AT command
 */
void send_AT_command(char *command){

    BaseType_t xHigherPriorityTaskWoken;
    message new_message = {0};

    strcpy(new_message.data, command);

    xQueueSendFromISR(uart_queue,(void *)&new_message, xHigherPriorityTaskWoken);

    return;
}
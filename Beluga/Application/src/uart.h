/*! ----------------------------------------------------------------------------
 *  @file   uart.c
 *
 *  @brief  An implementation of uart init and uart event handler --Header file
 *
 *  @date   2020/06
 *
 *  @author WiseLab-CMU 
 */

#ifndef _UART_H_
#define _UART_H_

#define UART_TX_BUF_SIZE 256  /**< UART TX buffer size. */
#define UART_RX_BUF_SIZE 256  /**< UART RX buffer size. */

typedef struct message
{
   char data[50];
} message;

void uart_init(void);
void send_AT_command(char *command);

#endif
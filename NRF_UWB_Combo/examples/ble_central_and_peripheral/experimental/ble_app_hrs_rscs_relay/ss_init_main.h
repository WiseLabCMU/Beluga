 /*----------------------------------------------------------------------------
 *  @file    ss_init_main.h
 *  @brief   Single-sided two-way ranging (SS TWR) initiator with interrupt example code -- Header file
 *
 * 
 * @attention
 *
 * Copyright 2018 (c) Decawave Ltd, Dublin, Ireland.
 *
 * All rights reserved.
 *
 * @author Decawave
 */

#include "semphr.h"

/* Declaration of static functions. */

extern SemaphoreHandle_t rxSemaphore, txSemaphore, sus_resp;
extern volatile int tx_int_flag; // Transmit success interrupt flag
extern volatile int rx_int_flag; // Receive success interrupt flag
extern volatile int to_int_flag; // Timeout interrupt flag
extern volatile int er_int_flag; // Error interrupt flag 

extern uint16_t NODE_UUID;

static void resp_msg_get_ts(uint8 *ts_field, uint32 *ts);

int ss_init_run(int id);
int ss_resp_run(void);


/*
void rx_ok_cb(const dwt_cb_data_t *cb_data);

void rx_to_cb(const dwt_cb_data_t *cb_data);

void rx_err_cb(const dwt_cb_data_t *cb_data);

void tx_conf_cb(const dwt_cb_data_t *cb_data);
*/

static void resp_msg_get_ts(uint8 *ts_field, uint32 *ts);

void ss_responder_task_function (void * pvParameter);
void ss_initiator_task_function (void * pvParameter);

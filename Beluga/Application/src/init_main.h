 /*----------------------------------------------------------------------------
 *  @file    init_main.h
 *  @brief   Double-sided and Single-sided two-way ranging (DS/SS TWR) initiator code -- Header file
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

extern SemaphoreHandle_t rxSemaphore, txSemaphore, sus_resp, sus_init;
extern int debug_print;
extern uint16_t NODE_UUID;

double ds_init_run(uint8 id);
double ss_init_run(uint8 id);




/*! ----------------------------------------------------------------------------
 *  @file   flash.h
 *
 *  @brief  An implementation of modify and retrive data through flash data storage --Header file
 *
 *  @date   2020/06
 *
 *  @author WiseLab-CMU 
 */

#ifndef _FLASH_H_
#define _FLASH_H_
#include <stdint.h>
#include "fds.h"

#define FILE_ID         0x0015  /* The ID of the file to write the records into. */
#define RECORD_KEY_1    0x1111  /* A key for the first record. (ID) */
#define RECORD_KEY_2    0x2222  /* A key for the second record. (BOOTMODE) */
#define RECORD_KEY_3    0x3333  /* A key for the third record. (RATE)*/
#define RECORD_KEY_4    0x4444  /* A key for the forth record. (CHANNEL)*/
#define RECORD_KEY_5    0x5555  /* A key for the fifth record. (BLE Timeout)*/
#define RECORD_KEY_6    0x6666  /* A key for the sixth record. (TX Power)*/
#define RECORD_KEY_7    0x7777  /* A key for the seventh record. (STREAMMODE)*/
#define RECORD_KEY_8    0x8888  /* A key for the eighth record. (TWRMODE)*/

void fds_evt_handler(fds_evt_t const * p_fds_evt);
void writeFlashID(uint32_t id, int record);
uint32_t getFlashID(uint32_t record_key);

#endif
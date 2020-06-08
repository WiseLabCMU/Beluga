
#ifndef _FLASH_H_
#define _FLASH_H_
#include <stdint.h>

#define FILE_ID         0x0015  /* The ID of the file to write the records into. */
#define RECORD_KEY_1    0x1111  /* A key for the first record. (ID) */
#define RECORD_KEY_2    0x2222  /* A key for the second record. (BOOTMODE) */
#define RECORD_KEY_3    0x3333  /* A key for the third record. (RATE)*/

void writeFlashID(uint32_t id, int record);

uint32_t getFlashID(uint32_t record_key);

#endif
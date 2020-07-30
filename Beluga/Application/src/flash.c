/*! ----------------------------------------------------------------------------
 *  @file   flash.c
 *
 *  @brief  An implementation of modify and retrive data through flash data storage
 *
 *  @date   2020/06
 *
 *  @author WiseLab-CMU 
 */

#include "flash.h"
#include "fds.h"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


/**@brief FDS event handler to handle errors during initialization */
void fds_evt_handler(fds_evt_t const * p_fds_evt)
{
    switch (p_fds_evt->id)
    {
        case FDS_EVT_INIT:
            if (p_fds_evt->result != FDS_SUCCESS)
            {
                // Initialization failed.
            }
            break;
        default:
            break;
    }
}


/**
 * @brief Modify storage information
 */
void writeFlashID(uint32_t id, int record) {

  uint32_t record_key;
  if(record == 1) record_key = RECORD_KEY_1;
  if(record == 2) record_key = RECORD_KEY_2;
  if(record == 3) record_key = RECORD_KEY_3;
  if(record == 4) record_key = RECORD_KEY_4;
  if(record == 5) record_key = RECORD_KEY_5;
  if(record == 6) record_key = RECORD_KEY_6;
  if(record == 7) record_key = RECORD_KEY_7;
  if(record == 8) record_key = RECORD_KEY_8;
  if(record == 9) record_key = RECORD_KEY_9;

  static char str[(sizeof("1") + 3) / 4];
  sprintf(str, "%d", id);

  fds_record_desc_t   record_desc_2;
  fds_find_token_t    ftok_2;

  /* It is required to zero the token before first use. */
  memset(&ftok_2, 0x00, sizeof(fds_find_token_t));

  // Write a new record if the record not exist in flash
  if (fds_record_find(FILE_ID, record_key, &record_desc_2, &ftok_2) != FDS_SUCCESS) {
       
    fds_record_t        record;
    fds_record_desc_t   record_desc;

    // Set up record.
    record.file_id           = FILE_ID;
    record.key               = record_key;
    record.data.p_data       = &str;
    record.data.length_words = (sizeof("1") + 3) / 4;   /* one word is four bytes. */

    ret_code_t rc;
    rc = fds_record_write(&record_desc, &record);
    if (rc != FDS_SUCCESS) {
      printf("Write 1 Failed\r\n"); /* Handle error. */
    }
  }
  //if(debug_print)printf("Done write\r\n");


  fds_flash_record_t  flash_record;
  fds_record_desc_t   record_desc_1;
  fds_find_token_t    ftok;
  /* It is required to zero the token before first use. */
  memset(&ftok, 0x00, sizeof(fds_find_token_t));
    
  /* Loop until all records with the given key and file ID have been found. */
  /* Update a new record if the record exist in flash */
  while (fds_record_find(FILE_ID, record_key, &record_desc_1, &ftok) == FDS_SUCCESS) {
        
    if (fds_record_open(&record_desc_1, &flash_record) != FDS_SUCCESS) {
      printf("error opening\r\n"); /* Handle error. */
    }

    if (fds_record_close(&record_desc_1) != FDS_SUCCESS) {
      printf("close error\r\n");  /* Handle error. */
    }
        
    fds_record_t        record;
       
    // Set up record.
    record.file_id           = FILE_ID;
    record.key               = record_key;
    record.data.p_data       = &str;
    record.data.length_words = (sizeof(str) + 3) / 4;   /* one word is four bytes. */
    ret_code_t rc;
    rc = fds_record_update(&record_desc_1, &record);
    if( rc != FDS_SUCCESS){
      printf("UPDATE ERROR\r\n"); /* Handle error. */
    }          
  }
}



/**
 * @brief Retrive storage information
 */
uint32_t getFlashID(uint32_t record_key) {

  uint32_t rec;
  if (record_key == 1) rec = RECORD_KEY_1;
  else if (record_key == 2) rec = RECORD_KEY_2;
  else if (record_key == 3) rec = RECORD_KEY_3;
  else if (record_key == 4) rec = RECORD_KEY_4;
  else if (record_key == 5) rec = RECORD_KEY_5;
  else if (record_key == 6) rec = RECORD_KEY_6;
  else if (record_key == 7) rec = RECORD_KEY_7;
  else if (record_key == 8) rec = RECORD_KEY_8;
  else if (record_key == 9) rec = RECORD_KEY_9;

  uint32_t ret_val;
  fds_flash_record_t  flash_record;
  fds_record_desc_t   record_desc_1;
  fds_find_token_t    ftok;

  /* It is required to zero the token before first use. */
  memset(&ftok, 0x00, sizeof(fds_find_token_t));

  while (fds_record_find(FILE_ID, rec, &record_desc_1, &ftok) == FDS_SUCCESS) {
    
    if (fds_record_open(&record_desc_1, &flash_record) != FDS_SUCCESS) {
      printf("error opening\r\n"); /* Handle error. */
    }

    /* Access the record through the flash_record structure. */
    ret_val = atoi(flash_record.p_data);

    //printf("flash: %s \r\n", flash_record.p_data);
    if (fds_record_close(&record_desc_1) != FDS_SUCCESS) {
      printf("close error\r\n");  /* Handle error. */
    }      
  }

  return ret_val;
}
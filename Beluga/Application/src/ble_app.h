/*! ----------------------------------------------------------------------------
 *  @file   ble_app.h
 *
 *  @brief  Nordic BLE advertising and scanning application codes --Header file
 *
 *  @date   2020/07
 *
 *  @author WiseLab-CMU 
 */

#ifndef  _BLE_APP_
#define _BLE_APP_

#include "deca_device_api.h"

typedef struct node{
    uint8 UUID;
    int8_t RSSI;
    int time_stamp;
    float range;
    int update_flag;
    int polling_flag;
    int ble_time_stamp;
} node;

#define MAX_ANCHOR_COUNT 12

void scan_start(void);
void adv_scan_start(void);
void ble_stack_init(void);
void peer_manager_init(void);
void delete_bonds(void);
void buttons_leds_init(bool * p_erase_bonds);
void gap_params_init(char* device_name);
void gatt_init(void);
void conn_params_init(void);
void advertising_init(void);
void log_init(void);
void power_manage(void);

void advertising_reconfig(int change);
void non_connectable_advertising_init(int mode);
void services_init(void);
void change_char_value(void);
void update_char_value(uint8 UUID, float range);


#endif
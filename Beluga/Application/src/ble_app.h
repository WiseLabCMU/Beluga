
#ifndef  _BLE_APP_
#define _BLE_APP_

#include "deca_device_api.h"

typedef struct node{
    uint8 UUID;
    int8_t RSSI;
    int time_stamp;
    float range;
    int update_flag;
} node;

#define MAX_ANCHOR_COUNT 12

void scan_start(void);
void adv_scan_start(void);
void ble_stack_init(void);
void peer_manager_init(void);
void delete_bonds(void);
void buttons_leds_init(bool * p_erase_bonds);
void gap_params_init(void);
void gatt_init(void);
void conn_params_init(void);
void advertising_init(void);
void log_init(void);
void power_manage(void);


#endif
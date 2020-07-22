/*! ----------------------------------------------------------------------------
 *  @file   flash.h
 *
 *  @brief  Helper functions to generate random delay number for ALOHA MAC protocol --Header file
 *
 *  @date   2020/06
 *
 *  @author WiseLab-CMU 
 */

#ifndef _RANDOM_H_
#define _RANDOM_H_

#include <stdint.h>

uint16_t get_rand_num_exp_collision(uint32_t freq);

#endif
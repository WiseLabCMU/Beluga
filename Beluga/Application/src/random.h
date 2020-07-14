
#ifndef _RANDOM_H_
#define _RANDOM_H_

#include <stdint.h>

uint16_t get_rand_num(uint32_t freq);
uint16_t get_rand_num_small(uint32_t freq);
uint16_t get_rand_num_exp(uint32_t freq);
uint16_t get_rand_num_exp_collision(uint32_t freq);

#endif
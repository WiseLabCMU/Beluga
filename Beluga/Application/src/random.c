
#include "random.h"
#include <stdint.h>
#include "nrf_soc.h"
#include "app_error.h"
#include <math.h>
#include <time.h>
#include <stdlib.h>


uint16_t get_rand_num(uint32_t freq) {

      uint32_t lower = freq;
      uint32_t upper = freq + 50;
      uint8_t num_rand_bytes_available;
      int err_code = sd_rand_application_bytes_available_get(&num_rand_bytes_available);
      APP_ERROR_CHECK(err_code);
      uint8_t rand_number;
      if (num_rand_bytes_available > 0)
      {
          err_code = sd_rand_application_vector_get(&rand_number, 1);
          APP_ERROR_CHECK(err_code);
      }


      float rand = rand_number * 1.0;

      float r =  (rand - 0) * (upper - lower) / (255 - 0) + lower;
      uint16_t ret = (uint16_t) r;
      
      return ret;
}

uint16_t get_rand_num_small(uint32_t freq) {

      uint32_t lower = freq;
      uint32_t upper = freq + 10;
      uint8_t num_rand_bytes_available;
      int err_code = sd_rand_application_bytes_available_get(&num_rand_bytes_available);
      APP_ERROR_CHECK(err_code);
      uint8_t rand_number;
      if (num_rand_bytes_available > 0)
      {
          err_code = sd_rand_application_vector_get(&rand_number, 1);
          APP_ERROR_CHECK(err_code);
      }


      float rand = rand_number * 1.0;
      
      float r =  (rand - 0) * (upper - lower) / (255 - 0) + lower;
      uint16_t ret = (uint16_t) r;
      
      return ret;
}

uint16_t get_rand_num_exp(uint32_t freq) {

      uint32_t lower = freq;
      
      double lambda = 0.055;
      double u;
      
      u = rand() / (RAND_MAX + 1.0);
      
      return (-log(1- u) / lambda)+lower;

}

uint16_t get_rand_num_exp_collision(uint32_t freq) {

      int lower = 10;
      
      double lambda  = 5.0 / (double)freq;
      //double lambda = 0.055;
      double u;
      
      u = rand() / (RAND_MAX + 1.0);

      
      return (-log(1- u) / lambda)+lower; 
}

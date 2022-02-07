#ifndef __alarm_house_tb_h__
#define __alarm_house_tb_h__

#include "alarm_house.h"

void alarm(ap_uint<16> sw, ap_uint<8> *senzori_miscare, ap_uint<8> *senzori_fereastra, ap_uint<16> *alarma_pornita);

#endif

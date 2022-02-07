#include "alarm_house.h"

void alarm(ap_uint<16> sw, ap_uint<8> *senzori_miscare, ap_uint<8> *senzori_fereastra, ap_uint<16> *alarma_pornita) {
#pragma HLS INTERFACE mode=ap_none port=sw
#pragma HLS INTERFACE mode=ap_none port=senzori_miscare
#pragma HLS INTERFACE mode=ap_none port=senzori_fereastra
#pragma HLS INTERFACE mode=ap_none port=alarma_pornita
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
	switch (sw) {
		// niciun senzor nu este activ
		case 0b1101000000000000:
			*senzori_miscare = 0;
			*senzori_fereastra = 0;
			*alarma_pornita = 0b1101000000000000;
			break;
		// SW0 este activ
		case 0b1101000000000001:
			*senzori_miscare = 0;
			*senzori_fereastra = 1;
			*alarma_pornita = 0b1101000000000000;
			break;
		// SW1 este activ
		case 0b1101000000000010:
			*senzori_miscare = 0;
			*senzori_fereastra = 2;
			*alarma_pornita = 0b1101000000000000;
			break;
		// SW2 este activ
		case 0b1101000000000100:
			*senzori_miscare = 0;
			*senzori_fereastra = 4;
			*alarma_pornita = 0b1101000000000000;
			break;
		// SW6 este activ (primul senzor de miscare)
		case 0b1101000001000000:
			*senzori_miscare = 64;
			*senzori_fereastra = 0;
			*alarma_pornita = 0b1101000000000000;
			break;
		// SW7 este activ (al doilea senzor de miscare)
		case 0b1101000010000000:
			*senzori_miscare = 128;
			*senzori_fereastra = 0;
			*alarma_pornita = 0b1101000000000000;
			break;
		// cazul default, cand nu avem nicio potrivire
		default:
			*senzori_miscare = sw & -1;
			*senzori_fereastra = sw & -1;
			*alarma_pornita = sw & -1;
	}
}

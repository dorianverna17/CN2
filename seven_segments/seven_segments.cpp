#include "seven_segments.h"

void seven_segments(ap_uint<8> digit, ap_uint<8> *code7segment, ap_uint<4> *anodes) {
#pragma HLS INTERFACE mode=ap_none port=code7segment
#pragma HLS INTERFACE mode=ap_none port=anodes
#pragma HLS INTERFACE mode=ap_none port=digit
#pragma HLS INTERFACE mode=ap_ctrl_none port=return
	switch (digit) {
		case 0:
			*code7segment = 0b11000000;
			break;
		case 1:
			*code7segment = 0b11111001;
			break;
		case 2:
			*code7segment = 0b10100100;
			break;
		case 3:
			*code7segment = 0b10110000;
			break;
		case 4:
			*code7segment = 0b10011001;
			break;
		case 5:
			*code7segment = 0b10010010;
			break;
		case 6:
			*code7segment = 0b10000010;
			break;
		case 7:
			*code7segment = 0b11111000;
			break;
		case 8:
			*code7segment = 0b10000000;
			break;
		case 9:
			*code7segment = 0b10010000;
			break;
		default:
			*code7segment = 0b11111111;
	}

	*anodes = 0b1110;
}

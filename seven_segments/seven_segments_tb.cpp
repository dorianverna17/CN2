#include "seven_segments_tb.h"
#include <iostream>

unsigned int seven_segment_code[10] = {
		0b11000000,
		0b11111001,
		0b10100100,
		0b10110000,
		0b10011001,
		0b10010010,
		0b10000010,
		0b11111000,
		0b10000000,
		0b10010000
};

int main() {
	int status = 0;

	ap_uint<8> digit;
	ap_uint<8> code7segment;
	ap_uint<4> anodes;

	for (int i = 0; i < 10; i++) {
		digit = i;
		seven_segments(digit, &code7segment, &anodes);
		std::cout << "digit = " << digit << " cod 7 segmente = " << code7segment << " anodes = " << anodes << std::endl;
		if (code7segment != seven_segment_code[digit] || anodes != 14) {
			status = 1;
			break;
		}
	}

	if (status == 0) {
		std::cout << "Test trecut cu succes!" << std::endl;
	} else {
		std::cout << "Test FAILED!" << std::endl;
	}
}

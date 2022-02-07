#include "alarm_house_tb.h"
#include <iostream>

unsigned int alarm_house_code[10] = {
		0b1101000000000000,
		0b1101000000000001,
		0b1101000000000010,
		0b1101000000000100,
		0b1101000001000000,
		0b1101000010000000,
		0b1000000000000000
};

int main() {
	int status = 0;

	ap_uint<8> senzori_miscare;
	ap_uint<8> senzori_fereastra;
	ap_uint<16> alarma_pornita;

	for (int i = 0; i < 10; i++) {
		alarm(alarm_house_code[i], &senzori_miscare, &senzori_fereastra, &alarma_pornita);
		if (alarm_house_code[i] != (senzori_miscare | senzori_fereastra | alarma_pornita)) {
			status = 1;
			break;
		} else {
			if (alarma_pornita == 0b1101000000000000) {
				std::cout << "O";
			} else {
				std::cout << "Not active!";
			}
			if (senzori_fereastra == 1) {
				std::cout << " E1 ";
			} else if (senzori_fereastra == 2) {
				std::cout << " E2 ";
			} else if (senzori_fereastra == 4) {
				std::cout << " E3 ";
			}
			if (senzori_miscare == 64) {
				std::cout << " E01 ";
			} else if (senzori_miscare == 128) {
				std::cout << " E02 ";
			}
			std::cout << std::endl;
		}
	}

	if (status == 0) {
		std::cout << "Test trecut cu succes!" << std::endl;
	} else {
		std::cout << "Test FAILED!" << std::endl;
	}
}

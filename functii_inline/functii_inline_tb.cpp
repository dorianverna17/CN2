#include "functii_inline_tb.h"
#include <iostream>

int main() {
	int status = 0;

	bool a, b, c[4];

	bool c_golden[4] = {0, 1, 0, 0};

	int k = 0;
	for (int ia = 0; ia < 2; ia++) {
		for (int ib = 0; ib < 2; ib++) {
			a = (bool) ia;
			b = (bool) ib;

			fi(a, b, &c[k++]);
		}
	}

	for (int i = 0; i < 4; i++) {
		if (c_golden[i] != c[i]) {
			std::cout << "Eroare la " << i << " c[" << i << "]= " << c[i] << " != c_golden[ " << i << "]=" << c_golden[i] << std::endl;
			status = -1;
		}
	}

	if (status == 0) {
		std::cout << "Testare incheiata cu succes!" << std::endl;
	} else {
		std::cout << "Testare incheiata cu insucces!" << std::endl;
	}

	return status;
}

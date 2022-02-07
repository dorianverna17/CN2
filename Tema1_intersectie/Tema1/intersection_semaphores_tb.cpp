#include "intersection_semaphores_tb.h"
#include <iostream>

int main() {
	int status;

	bool Stg, D, S, J, EW[16], NS[16];
	int Regula[16];

	// rezultatele care trebuiesc obtinute
	bool EW_golden[16] = {1, 0, 0, 0, 1, 1, 1, 0, 1, 1, 1, 0, 1, 1, 1, 1};
	bool NS_golden[16] = {0, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0};
	int Regula_golden[16] = {5, 4, 4, 3, 2, 2, 2, 3, 2, 2, 2, 3, 1, 1, 1, 1};

	int k = 0;
	for (int iStg = 0; iStg < 2; iStg++) {
		for (int iD = 0; iD < 2; iD++) {
			for (int iS = 0; iS < 2; iS++) {
				for (int iJ = 0; iJ < 2; iJ++) {
					Stg = (bool) iStg;
					D = (bool) iD;
					S = (bool) iS;
					J = (bool) iJ;

					intersection(Stg, D, S, J, &Regula[k], &EW[k], &NS[k]);
					k++;
				}
			}
		}
	}

	for (int i = 0; i < 16; i++) {
		if (EW_golden[i] != EW[i] || NS_golden[i] != NS[i] || Regula_golden[i] != Regula[i]) {
			std::cout << "Eroare la " << i << ":";
			if (Regula_golden[i] != Regula[i]) {
				std::cout << " Regula[" << i << "] = " << Regula[i] <<" != Regula_golden[" << i << "] = " << Regula_golden[i];
			}
			if (EW_golden[i] != EW[i]) {
				std::cout << " EW[" << i << "] = " << EW[i] <<" != EW_golden[" << i << "] = " << EW_golden[i];
			}
			if (NS_golden[i] != NS[i]) {
				std::cout << " NS[" << i << "] = " << NS[i] <<" != NS_golden[" << i << "] = " << NS_golden[i];
			}
			std::cout << std::endl;
			status = -1;
		}
	}

	if (status == 0) {
		std::cout << "Testare incheiata cu SUCCES!" << std::endl;
	} else {
		std::cout << "Testare incheiata cu INSUCCES!" << std::endl;
	}
}

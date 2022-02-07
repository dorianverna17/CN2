// Prima regula descrisa in enunt
bool rule1(bool Stg, bool D, int *Regula) {
	if (D == 1 && Stg == 1) {
		*Regula = 1;
		return true;
	}
	return false;
}

// A doua regula descrisa in enunt
bool rule2(bool Stg, bool D, bool S, bool J, int *Regula) {
	if (((D == 1 && Stg == 0) || (D == 0 && Stg == 1)) && !(S == 1 && J == 1)) {
		*Regula = 2;
		return true;
	}
	return false;
}

// A treia regula descrisa in enunt
bool rule3(bool Stg, bool D, bool S, bool J, int *Regula) {
	if (!(Stg == 1 && D == 1) && S == 1 && J == 1) {
		*Regula = 3;
		return true;
	}
	return false;
}

// A patra regula descrisa in enunt
bool rule4(bool Stg, bool D, bool S, bool J, int *Regula) {
	if ((Stg == 0 && D == 0) && ((S == 0 && J == 1) || (S == 1 && J == 0))) {
		*Regula = 4;
		return true;
	}
	return false;
}

// A cincea regula descrisa in enunt
bool rule5(bool Stg, bool D, bool S, bool J, int *Regula) {
	if (Stg == 0 && D == 0 && S == 0 && J == 0) {
		*Regula = 5;
		return true;
	}
		return false;
}

void intersection(bool Stg, bool D, bool S, bool J, int *Regula, bool *EW, bool *NS) {
	#pragma HLS INTERFACE mode=ap_ctrl_none port=return
	#pragma HLS INTERFACE mode=ap_none port=Stg
	#pragma HLS INTERFACE mode=ap_none port=D
	#pragma HLS INTERFACE mode=ap_none port=S
	#pragma HLS INTERFACE mode=ap_none port=J
	#pragma HLS INTERFACE mode=ap_none port=Regula
	#pragma HLS INTERFACE mode=ap_none port=EW
	#pragma HLS INTERFACE mode=ap_none port=NS

	// atribuirea valorilor semafoarelor
	*EW = rule5(Stg, D, S, J, Regula) || rule2(Stg, D, S, J, Regula) || rule1(Stg, D, Regula);
	*NS = rule3(Stg, D, S, J, Regula) || rule4(Stg, D, S, J, Regula);
}

bool AND1(bool a, bool b) {
	return (a&b);
}

bool INV1(bool a) {
	return !a;
}

void fi(bool a, bool b, bool *c) {
	#pragma HLS INTERFACE mode=ap_ctrl_none port=return
	#pragma HLS INTERFACE mode=ap_none port=a
	#pragma HLS INTERFACE mode=ap_none port=b
	#pragma HLS INTERFACE mode=ap_none port=c

	*c = AND1(INV1(a), b);
}

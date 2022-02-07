#include "hls_design_meta.h"
const Port_Property HLS_Design_Meta::port_props[]={
	Port_Property("ap_clk", 1, hls_in, -1, "", "", 1),
	Port_Property("ap_rst", 1, hls_in, -1, "", "", 1),
	Port_Property("Stg", 1, hls_in, 0, "ap_none", "in_data", 1),
	Port_Property("D", 1, hls_in, 1, "ap_none", "in_data", 1),
	Port_Property("S", 1, hls_in, 2, "ap_none", "in_data", 1),
	Port_Property("J", 1, hls_in, 3, "ap_none", "in_data", 1),
	Port_Property("Regula", 32, hls_out, 4, "ap_none", "out_data", 1),
	Port_Property("EW", 1, hls_out, 5, "ap_none", "out_data", 1),
	Port_Property("NS", 1, hls_out, 6, "ap_none", "out_data", 1),
};
const char* HLS_Design_Meta::dut_name = "intersection";

// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Version: 2021.1
// Copyright (C) Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

(* CORE_GENERATION_INFO="fi_fi,hls_ip_2021_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7a100t-csg324-1,HLS_INPUT_CLOCK=10.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=0.978000,HLS_SYN_LAT=0,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=0,HLS_SYN_LUT=4,HLS_VERSION=2021_1}" *)

module fi (
        a,
        b,
        c
);


input   a;
input   b;
output   c;

wire   [0:0] xor_ln6_fu_47_p0;
wire   [0:0] and_ln2_fu_53_p0;
wire   [0:0] xor_ln6_fu_47_p2;

assign and_ln2_fu_53_p0 = b;

assign c = (xor_ln6_fu_47_p2 & and_ln2_fu_53_p0);

assign xor_ln6_fu_47_p0 = a;

assign xor_ln6_fu_47_p2 = (xor_ln6_fu_47_p0 ^ 1'd1);

endmodule //fi
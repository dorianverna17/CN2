############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project sapte_segmente
set_top seven_segments
add_files seven_segments.cpp
add_files seven_segments.h
add_files -tb seven_segments_tb.cpp
add_files -tb seven_segments_tb.h
open_solution "solution1" -flow_target vivado
set_part {xc7a100tcsg324-1}
create_clock -period 10 -name default
#source "./sapte_segmente/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog

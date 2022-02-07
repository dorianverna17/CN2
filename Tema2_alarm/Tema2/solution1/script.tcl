############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
############################################################
open_project Tema2
set_top alarm
add_files alarm_house.cpp
add_files alarm_house.h
add_files -tb alarm_house_tb.cpp
add_files -tb alarm_house_tb.h
open_solution "solution1" -flow_target vivado
set_part {xc7a100tcsg324-1}
create_clock -period 10 -name default
#source "./Tema2/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog

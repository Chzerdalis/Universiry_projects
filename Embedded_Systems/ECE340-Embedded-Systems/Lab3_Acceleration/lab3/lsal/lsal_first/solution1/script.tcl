############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project lsal_first
set_top compute_matrices
add_files lsal_first/lsal.cpp
add_files -tb lsal_first/testbench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vivado
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
source "./lsal_first/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog

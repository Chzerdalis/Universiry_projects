############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project critical_path
set_top compute_matrices
add_files critical_path/lsal.cpp
add_files -tb critical_path/testbench.cpp -cflags "-Wno-unknown-pragmas" -csimflags "-Wno-unknown-pragmas"
open_solution "solution1" -flow_target vitis
set_part {xc7z020-clg484-1}
create_clock -period 10 -name default
source "./critical_path/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog

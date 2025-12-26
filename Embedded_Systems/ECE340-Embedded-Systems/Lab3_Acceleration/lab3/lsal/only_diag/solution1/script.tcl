############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
open_project only_diag
set_top compute_matrices
add_files only_diag/lsal.cpp
add_files -tb only_diag/testbench.cpp
open_solution "solution1" -flow_target vitis
set_part {xc7z020clg484-1}
create_clock -period 10 -name default
source "./only_diag/solution1/directives.tcl"
csim_design
csynth_design
cosim_design
export_design -format ip_catalog

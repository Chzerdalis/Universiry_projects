############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_top -name compute_matrices "compute_matrices"
set_directive_unroll "compute_matrices/INNER_LOOP"
set_directive_pipeline "compute_matrices/OUTER_LOOP"

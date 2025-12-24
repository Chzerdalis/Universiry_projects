############################################################
## This file is generated automatically by Vitis HLS.
## Please DO NOT edit it.
## Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
############################################################
set_directive_top -name compute_matrices "compute_matrices"
set_directive_array_partition -type cyclic -factor 8 -dim 1 "compute_matrices" diag_array_2
set_directive_bind_storage -type ram_t2p -impl bram "compute_matrices" diag_array_2
set_directive_array_partition -type cyclic -factor 8 -dim 1 "compute_matrices" diag_array_1
set_directive_bind_storage -type ram_t2p -impl bram "compute_matrices" diag_array_1
set_directive_array_partition -type cyclic -factor 8 -dim 1 "compute_matrices" diag_array_3
set_directive_bind_storage -type ram_t2p -impl bram "compute_matrices" diag_array_3
set_directive_bind_storage -type ram_t2p -impl bram "compute_matrices" max_value_arr
set_directive_array_partition -type cyclic -factor 8 -dim 1 "compute_matrices" max_value_arr
set_directive_bind_storage -type ram_t2p -impl bram "compute_matrices" database_buff
set_directive_array_partition -type cyclic -factor 8 -dim 1 "compute_matrices" database_buff
set_directive_bind_storage -type ram_t2p "compute_matrices" max_index_arr
set_directive_array_partition -type cyclic -factor 8 -dim 1 "compute_matrices" max_index_arr
set_directive_pipeline "compute_matrices/OUTER_LOOP"
set_directive_unroll "compute_matrices/INNER_LOOP"
set_directive_pipeline "compute_matrices/MAX_LOOP"
set_directive_bind_storage -type ram_t2p -impl bram "compute_matrices" querry_buff
set_directive_array_partition -type cyclic -factor 8 -dim 1 "compute_matrices" querry_buff
set_directive_bind_storage -type ram_t2p -impl bram "compute_matrices" direction_buff
set_directive_array_partition -type cyclic -factor 8 -dim 1 "compute_matrices" direction_buff
set_directive_interface -mode s_axilite -max_widen_bitwidth 32 -name gmem "compute_matrices" max_index
set_directive_interface -mode s_axilite -max_widen_bitwidth 256 -name gmem "compute_matrices" database
set_directive_interface -mode s_axilite -max_widen_bitwidth 256 -name gmem "compute_matrices" query
set_directive_interface -mode s_axilite -max_widen_bitwidth 1024 "compute_matrices" direction_matrix

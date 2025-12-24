# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/nbellas/part_3_v1/part3_v3/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/nbellas/part_3_v1/part3_v3/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {part3_v3}\
-hw {/home/nbellas/fpadd_arm_2/lab2_simple_arm_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/nbellas/part_3_v1}

platform write
platform generate -domains 
platform active {part3_v3}
platform generate
platform generate
platform generate -domains standalone_domain,zynq_fsbl 
platform active {part3_v3}

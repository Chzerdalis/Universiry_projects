# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/vitis_workspace/simple_arm_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/vitis_workspace/simple_arm_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {simple_arm_platform}\
-hw {/home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/lab2_simple_arm/design_1_wrapper.xsa}\
-fsbl-target {psu_cortexa53_0} -out {/home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/vitis_workspace}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {simple_arm_platform}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
platform generate
platform generate

# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace/interrupt_add_platform/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace/interrupt_add_platform/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {interrupt_add_platform}\
-hw {/home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm/design_1_wrapper.xsa}\
-proc {ps7_cortexa9_0} -os {standalone} -fsbl-target {psu_cortexa53_0} -out {/home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace}

platform write
platform generate -domains 
platform active {interrupt_add_platform}
platform generate

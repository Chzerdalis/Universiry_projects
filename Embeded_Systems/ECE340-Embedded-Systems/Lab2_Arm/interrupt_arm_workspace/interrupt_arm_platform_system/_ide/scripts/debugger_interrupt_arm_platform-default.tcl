# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace/interrupt_arm_platform_system/_ide/scripts/debugger_interrupt_arm_platform-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace/interrupt_arm_platform_system/_ide/scripts/debugger_interrupt_arm_platform-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zed 210248650715" && level==0 && jtag_device_ctx=="jsn-Zed-210248650715-23727093-0"}
fpga -file /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace/interrupt_arm_platform/_ide/bitstream/design_1_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace/interrupt_add_platform/export/interrupt_add_platform/hw/design_1_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace/interrupt_arm_platform/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/inf2022/dtsiantos/Desktop/ECE340-Embedded-Systems/Lab2_Arm/interrupt_arm_workspace/interrupt_arm_platform/Debug/interrupt_arm_platform.elf
configparams force-mem-access 0
targets -set -nocase -filter {name =~ "*A9*#0"}
con

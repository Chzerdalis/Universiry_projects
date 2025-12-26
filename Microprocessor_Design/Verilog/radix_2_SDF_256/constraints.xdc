create_clock -period 15.000 -name sys_clk [get_ports clock]

set_property PACKAGE_PIN Y9 [get_ports clock]
set_property IOSTANDARD LVCMOS33 [get_ports clock]

set_property PACKAGE_PIN P16 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports reset]

create_clock -period 15.000 -name sys_clk [get_ports clk]

set_property PACKAGE_PIN Y9 [get_ports clk]
set_property IOSTANDARD LVCMOS33 [get_ports clk]

set_property PACKAGE_PIN P16 [get_ports reset]
set_property IOSTANDARD LVCMOS18 [get_ports reset]

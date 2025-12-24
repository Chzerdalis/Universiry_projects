CC = iverilog
FLAGS = -Wall -Winfloop

all:
	$(CC) $(FLAGS) -o verilog.out lab4_testbench_input.v
	vvp verilog.out
	surfer CPUtest.vcd

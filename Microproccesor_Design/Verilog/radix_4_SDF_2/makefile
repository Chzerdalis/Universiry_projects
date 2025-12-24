CC = iverilog
FLAGS = -Wall -Winfloop
EXE = test.out
SRCS_buffer = delay_buffer_advaned.v tb_buffer.v
SRCS_butterfly = butterfly.v tb_butterfly.v partial_mul.v butterfly_old.v
SRCS_unit = tb_stageunit.v butterfly.v delay_buffer_advaned.v stage_unit.v

buffer:
	$(CC) $(FLAGS) -o $(EXE) $(SRCS_buffer)
	vvp $(EXE)
	surfer -s waveforms/tb_buffer tb_dumpfile.vcd
butterfly:
	$(CC) $(FLAGS) -o $(EXE) $(SRCS_butterfly)
	vvp $(EXE)
	surfer -s waveforms/tb_butterfly tb_butterfly.vcd
stage_unit:
	$(CC) $(FLAGS) -o $(EXE) $(SRCS_unit)
	vvp $(EXE)
	surfer -s waveforms/tb_stageunit tb_stageunit.vcd
clean:
	rm -rf $(EXE)
SHELL := /bin/bash

# Compiler
NVCC = nvcc
CC   = icx

NVCCFLAGS = -O4 -arch=sm_37 --ptxas-options=-v 
CFLAGS    = -O3 -Wall

LDFLAGS = -lm

# Targets
TARGET_PAR = claheParallel
TARGET_CPU = claheCpu

all: $(TARGET_PAR) $(TARGET_CPU)

# Parallel version
$(TARGET_PAR): main.o clahe.o
	$(NVCC) -o $@ $^ $(LDFLAGS)

main.o: main.cu clahe.h
	$(NVCC) -c $(NVCCFLAGS) $< -o $@

clahe.o: claheGpu.cu clahe.h gpu_timer.h
	$(NVCC) -c $(NVCCFLAGS) $< -o $@

# CPU version
$(TARGET_CPU): mainCpu.o claheCpu.o
	$(CC) -o $@ $^ $(LDFLAGS)

mainCpu.o: main.c clahe.h
	$(CC) $(CFLAGS) -c $< -o $@

claheCpu.o: claheCpu.c clahe.h
	$(CC) $(CFLAGS) -c $< -o $@

clean:
	rm -f *.o $(TARGET_PAR) $(TARGET_CPU)

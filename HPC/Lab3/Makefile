SHELL := /bin/bash
NVCC  ?= nvcc

TMPDIR ?= /tmp
export TMPDIR

NVCCFLAGS  := -O4 -arch=sm_37
DEBUGFLAGS := -G -g -lineinfo
PTXAS_VERBOSE := --ptxas-options="-v"

SRC_V1 := Convolution2D_v1.cu
SRC_V2 := Convolution2D_v2.cu
SRC_V3 := Convolution2D_v3.cu
SRC_V4 := Convolution2D_v4.cu

ifeq ($(DEBUG),1)
NVCCFLAGS += $(DEBUGFLAGS)
endif

.PHONY: all v1 v2 v3 v4 clean help ptxas-v2
all: v4

v1: $(SRC_V1)	
	$(NVCC) $(NVCCFLAGS) $(SRC_V1) -o v1

v2: $(SRC_V2)	
	$(NVCC) $(NVCCFLAGS) $(SRC_V2) -o v2

v3: $(SRC_V3)	
	$(NVCC) $(NVCCFLAGS) $(SRC_V3) -o v3

v4: $(SRC_V4)	
	$(NVCC) $(NVCCFLAGS) $(SRC_V4) -o v4

ptxas-v2: $(SRC_V2)
	$(NVCC) $(PTXAS_VERBOSE) $(DEBUGFLAGS) $(SRC_V2) -o v2-ptxas

clean:
	rm -f v1 v2 v3 v4 v2-ptxas


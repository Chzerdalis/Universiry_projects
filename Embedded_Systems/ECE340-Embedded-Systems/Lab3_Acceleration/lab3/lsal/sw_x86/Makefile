# Makefile for lsal
CC = g++
CFLAGS = -O3 -mavx2 -g -fopenmp
TARGETS = $(patsubst %.cpp, %, $(wildcard *.cpp))

N ?= 32
M ?= 65536
PRINT_FLAG ?= 0

all: clean $(TARGETS)

%: %.cpp
	$(CC) $(CFLAGS) -o $@ $<

run: $(TARGETS)
	@echo "Specify the target to run, e.g., make run TARGET=<target_name>"
	@echo "Example: make run TARGET=lsal"
	@echo "N=$(N), M=$(M), PRINT_FLAG=$(PRINT_FLAG)"
	@echo "Usage: ./$(TARGET) $(N) $(M) $(PRINT_FLAG)"

#valgrind: $(TARGETS)
#	valgrind --leak-check=full --show-leak-kinds=all ./$(TARGET) $(N) $(M) $(PRINT_FLAG)
#
#callgrind: $(TARGETS)
#	valgrind --tool=callgrind ./$(TARGET) $(N) $(M) $(PRINT_FLAG)
#
#kcachegrind: callgrind
#	kcachegrind callgrind.out.*

clean:
	rm -f $(TARGETS) callgrind.out.*

help:
	@echo "Available targets:"
	@echo "  all         - Build all executables and clean previous builds."
	@echo "  run         - Run a specific target. Usage: make run TARGET=<target_name>"
#	@echo "  valgrind    - Run valgrind on a specific target. Usage: make valgrind TARGET=<target_name>"
#	@echo "  callgrind   - Run callgrind on a specific target. Usage: make callgrind TARGET=<target_name>"
#	@echo "  kcachegrind - Show callgrind output with kcachegrind."
	@echo "  clean       - Remove all built files and callgrind outputs."

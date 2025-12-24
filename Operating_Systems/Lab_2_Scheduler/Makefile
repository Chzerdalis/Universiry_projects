#######################################
# 
# Operating Systems Lab
# 
# Project 02 Makefile Template
#
#######################################

# The C compiler
CC = gcc

# Put any flags for the C compiler here
CFLAGS = -Wall -g

# The source files for the Virtual Machine
LIB_SRCS = cpuinit.c cpu.c

# The corresponding object files
LIB_OBJS = cpuinit.o cpu.o

# The scheduler's source files
SCHED_SRCS = schedule.c

# Put the name of any additional source file here
ADD_SRCS = 

# Include files
INC_FILES = privatestructs.h macros.h schedule.h

# The name of the virtual machine's library, without the lib prefix and the .a suffix
LIB_NAME = sched_vm

# The directory where the virtual machine's library resides.
LIB_DIR = .

# The name of the final executable
EXEC_NAME = sjf_sched

# The 2 flags that can be set: GOODNESS if the scheduler will be based on the goodness, and 
# 							   CALCWAIT_RQ if we will take into account the time a process is waiting in queue (for the goodness calculation)
FLAGS = $(CC) $(CFLAGS) $(SCHED_SRCS) $(ADD_SRCS) -o $(EXEC_NAME) -l$(LIB_NAME) -L$(LIB_DIR)


all: clean $(EXEC_NAME) 

$(EXEC_NAME): $(SCHED_SRCS) $(INC_FILES) $(LIB_NAME)
	$(CC) $(CFLAGS) -D CALCWAIT_RQ $(SCHED_SRCS) $(ADD_SRCS) -o $(EXEC_NAME) -l$(LIB_NAME) -L$(LIB_DIR)
	./run_profs.sh GOODNESS_CALCWAIT_RQ

	$(CC) $(CFLAGS) $(SCHED_SRCS) $(ADD_SRCS) -o $(EXEC_NAME) -l$(LIB_NAME) -L$(LIB_DIR)
	./run_profs.sh GOODNESS_NO_CALCWAIT_RQ

$(LIB_NAME): $(LIB_SRCS) $(INC_FILES)
	$(CC) -c $(CFLAGS) $(LIB_SRCS)
	ar rcsv lib$(LIB_NAME).a $(LIB_OBJS)

normal: clean
	$(CC) -c $(CFLAGS) $(LIB_SRCS)
	ar rcsv lib$(LIB_NAME).a $(LIB_OBJS)
	$(CC) $(CFLAGS) -D CALCWAIT_RQ $(SCHED_SRCS) $(ADD_SRCS) -o $(EXEC_NAME) -l$(LIB_NAME) -L$(LIB_DIR)

no_calc_wait: clean
	$(CC) -c $(CFLAGS) $(LIB_SRCS)
	ar rcsv lib$(LIB_NAME).a $(LIB_OBJS)
	$(CC) $(CFLAGS) $(SCHED_SRCS) $(ADD_SRCS) -o $(EXEC_NAME) -l$(LIB_NAME) -L$(LIB_DIR)

.PHONY: clean

clean:
	@if [ -f $(EXEC_NAME) ]; then rm -v $(EXEC_NAME); fi
	@if [ -f lib$(LIB_NAME).a ]; then rm -v lib$(LIB_NAME).a; fi
	@if ls *.o >/dev/null 2>&1; then rm -v *.o; fi


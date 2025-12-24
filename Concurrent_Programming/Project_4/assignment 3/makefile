CC = gcc
CFLAGS = -Wall -g 
OBJ = ask3.o ask2.o

ask3: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o ask3 

ask3.o: ask3.c ask2.h
	$(CC) $(CFLAGS) -c ask3.c

ask2.o: ask2.c ask2.h
	$(CC) $(CFLAGS) -c ask2.c 

clean: 
	rm *.o

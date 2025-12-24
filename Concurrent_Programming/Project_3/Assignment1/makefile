CC = gcc
CFLAGS = -Wall -g -fsanitize=thread
OBJ = ask3.o ask1.o

final: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o final 

ask3.o: ask3.c ask1.h
	$(CC) $(CFLAGS) -c ask3.c

ask1.o: ask1.c ask1.h
	$(CC) $(CFLAGS) -c ask1.c

clean: 
	rm *.o

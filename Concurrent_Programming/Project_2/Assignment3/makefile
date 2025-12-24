CC = gcc
CFLAGS = -Wall -g 
OBJ = ask3.o semaphore.o

final: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o final 

ask3.o: ask3.c semaphore.h
	$(CC) $(CFLAGS) -c ask3.c

semaphore.o: semaphore.c semaphore.h
	$(CC) $(CFLAGS) -c semaphore.c 

clean: 
	rm *.o
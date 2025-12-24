CC = gcc 
CFLAGS = -Wall -g -fsanitize=address -fsanitize=bounds
OBJ = semaphore.c semaphore.h

sem: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o sem

clean:
	rm *.o

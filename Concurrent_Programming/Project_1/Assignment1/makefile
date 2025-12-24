CC = gcc 
CFLAGS = -Wall -g -fsanitize=address -fsanitize=bounds
OBJ = p_pipe.o demo.o

final: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o final

p_pipe.o: p_pipe.c p_pipe.h
	$(CC) $(CFLAGS) -c p_pipe.c 

demo.o: demo.c p_pipe.h
	$(CC) $(CFLAGS) -c demo.c
clean:
	rm *.o

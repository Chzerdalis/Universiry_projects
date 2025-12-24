CC = g++ -std=c++11
CFLAGS = -g -Wall

SRC_FILES = main.cpp AIPlayer.cpp OthelloGame.cpp
OBJ_FILES = $(SRC_FILES:.cpp=.o)

all: main

main: $(OBJ_FILES)
	$(CC) $(CFLAGS) $^ -o $@

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@
clean:
	rm -f $(OBJ_FILES) main

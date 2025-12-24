CC = g++ -std=c++11
CFLAGS = -g -Wall

SRC_FILES = Grader.cpp AIPlayer.cpp OthelloGame.cpp OthelloGrader.cpp
OBJ_FILES = $(SRC_FILES:.cpp=.o)

all: grader autoplayer

grader: OthelloGame.o Grader.o OthelloGrader.cpp
	$(CC) -Wall -g -o grader OthelloGrader.cpp Grader.o OthelloGame.o -fsanitize=address

%.o: %.cpp
	$(CC) $(CFLAGS) -c $< -o $@
	
autoplayer: OthelloGame.o AIPlayer.o Auto_play.cpp
	$(CC) -Wall -g -o autoplayer Auto_play.cpp OthelloGame.o AIPlayer.o -fsanitize=address

clean:
	rm -f $(OBJ_FILES) grader autoplayer

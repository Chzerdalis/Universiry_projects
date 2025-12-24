#ifndef OTHELLO_GAME_H
#define OTHELLO_GAME_H

#include <vector>
#include <string>

const int SIZE = 8;
const int EMPTY = 0;
const int Pawn_X = 1;
const int Pawn_O = 2;
const int AVAILABLE_MOVE = 3;

class OthelloGame
{
public:
    OthelloGame();
    OthelloGame(const OthelloGame&);
    void printBoard() const;
    void calculateAvailableMoves(int currentPlayer);
    void PlayerMove(int currentPlayer);
    void makeMove(int row, int col, int currentPlayer);
    bool isGameOver() const;
    bool isValidMove(int row, int col) const;
    void printResult() const;
    bool hasValidMoves(int player) const;
    void exportToJSON() const;
    int rowColToMove(int row, int col, std::string &move) const;
    void printMoves() const;
    int moveToRowCol(std::string move, int &row, int &col);

    // Add necessary member functions and data
public:
    std::vector<std::vector<int> > board;
    std::string firstPlayer;
    int depth;
    std::vector<std::string> moves;
    // Other data members
};

#endif // OTHELLO_GAME_H
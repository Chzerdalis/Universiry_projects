#ifndef AI_PLAYER_H
#define AI_PLAYER_H

#include "OthelloGame.h"
#include <iostream>

using namespace std;

class AIPlayer
{
public:
    void makeMove(OthelloGame &game, int depth, int Pawn);
    int minimax(OthelloGame &game, int depth, bool maximizingPlayer, int alpha, int beta, int Pawn, int pawnEval);

    // Add necessary member functions and data
};

#endif // AI_PLAYER_H
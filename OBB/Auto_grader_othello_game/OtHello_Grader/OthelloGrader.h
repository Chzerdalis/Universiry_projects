#ifndef OTHELLO_GRADER_H
#define OTHELLO_GRADER_H

#include "OthelloGame.h"
#include <iostream>

using namespace std;

class OthelloGrader
{
public:
    void gradeMoves(OthelloGame &game, int depth);
    int minimax(OthelloGame &game, int depth, bool maximizingPlayer, int alpha, int beta);

    // Create a structure to store possible moves and their scores
    struct MoveScore
    {
        std::string move;
        int score;
    };

    std::vector<MoveScore> moveScores;
};

#endif // OTHELLO_GRADER_H
#include "AIPlayer.h"

struct Move
{
    int row;
    int col;
};

const int weights[8][8] = {
    { 500, -20,  10,  5,  5, 10, -20, 500},  // Row 1
    { -20, -50,  -2, -2, -2, -2, -50, -20},  // Row 2
    {  10,  -2,   1,  1,  1,  1,  -2,  10},  // Row 3
    {   5,  -2,   1,  0,  0,  1,  -2,   5},  // Row 4
    {   5,  -2,   1,  0,  0,  1,  -2,   5},  // Row 5
    {  10,  -2,   1,  1,  1,  1,  -2,  10},  // Row 6
    { -20, -50,  -2, -2, -2, -2, -50, -20},  // Row 7
    { 500, -20,  10,  5,  5, 10, -20, 500}   // Row 8
};

void AIPlayer::makeMove(OthelloGame &game, int depth, int Pawn)
{
    int bestScore = -10000;
    Move bestMove;
    int moveScore;
    string finalMove;

    int otherPawn = (Pawn == Pawn_O) ? Pawn_X : Pawn_O;
    // Loop through all possible moves
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            Move move = {i, j};
            if (game.isValidMove(move.row, move.col)) {

                // Make the move on a copy of the game
                OthelloGame gameCopy(game);
                gameCopy.makeMove(move.row, move.col, Pawn);
                gameCopy.calculateAvailableMoves(otherPawn);
                
                // Calculate the score of the move using the minimax function
                if(!gameCopy.hasValidMoves(otherPawn)) {
                    gameCopy.calculateAvailableMoves(Pawn);
                    moveScore = minimax(gameCopy, depth - 1, true, -10000, 10000, Pawn, Pawn);
                }else{
                    moveScore = minimax(gameCopy, depth - 1, false, -10000, 10000, otherPawn, Pawn);
                }

                // If the score of the move is better than the best score, update the best score and the best move
                if (moveScore > bestScore) {
                    bestScore = moveScore;
                    bestMove = move;
                }
            }
        }
    }
    
    // Make the best move on the actual game
    game.rowColToMove(bestMove.row, bestMove.col, finalMove);
    game.moves.push_back(finalMove);
    game.makeMove(bestMove.row, bestMove.col, Pawn);
}

int evaluateBoard(OthelloGame& game, int player) {
    int opponent = (player == Pawn_X) ? Pawn_O : Pawn_X;
    int score = 0;

    for (int i = 0; i < SIZE; ++i) {
        for (int j = 0; j < SIZE; ++j) {
            if (game.board[i][j] == player) {
                score += weights[i][j];
            } else if (game.board[i][j] == opponent) {
                score -= weights[i][j];
            }
        }
    }

    return score;
}

int AIPlayer::minimax(OthelloGame &game, int depth, bool maximizingPlayer, int alpha, int beta, int Pawn, int pawnEval)
{

    int otherPawn = (Pawn == Pawn_O) ? (Pawn_X) : (Pawn_O);
    if (depth == 0 || game.isGameOver())
    {
        // Return the score of the board
        return evaluateBoard(game, pawnEval);
    }

    if (maximizingPlayer)
    {
        int maxEval = -10000;
        int eval;
        int brk = 0;

        // Loop through all possible moves
        for (int i = 0; i < 8; ++i) {
            for (int j = 0; j < 8; ++j) {
                Move move = {i, j};
                if (game.isValidMove(move.row, move.col)) {
                    // Make the move on a copy of the game
                    OthelloGame gameCopy(game);
                    //cout<<"$$$$$" << move.row << "  " << move.col << " " << depth << " $$$$$\n";

                    gameCopy.makeMove(move.row, move.col, Pawn);
                    
                    gameCopy.calculateAvailableMoves(otherPawn);
                    //gameCopy.printBoard();

                    // Calculate the score of the move using the minimax function
                    if(!gameCopy.hasValidMoves(otherPawn)) {
                        gameCopy.calculateAvailableMoves(Pawn);
                        eval = minimax(gameCopy, depth - 1, true, alpha, beta, Pawn, pawnEval);
                    }else{
                        eval = minimax(gameCopy, depth - 1, false, alpha, beta, otherPawn, pawnEval);
                    }

                    maxEval = max(maxEval, eval);
                    alpha = max(alpha, eval);

                    if (beta <= alpha) {
                        brk = 1;
                        break;
                    }                   
                }
                if(brk == 1) break;
            }
        }
        //cout<< maxEval << endl;
        return maxEval;
    }
    else // minimizingPlayer
    {
        int minEval = 10000;
        int eval;
        int brk = 0;

        // Loop through all possible moves
        for (int i = 0; i < 8; ++i) {
            for (int j = 0; j < 8; ++j) {
                Move move = {i, j};
                if (game.isValidMove(move.row, move.col)) {
                    // Make the move on a copy of the game
                    OthelloGame gameCopy(game);

                    //cout<<"$$$$$" << move.row << "  " << move.col << " " << depth << " $$$$$\n";
                    gameCopy.makeMove(move.row, move.col, Pawn);

                    gameCopy.calculateAvailableMoves(otherPawn);
                    //gameCopy.printBoard();
                    
                    // Calculate the score of the move using the minimax function
                    if(!gameCopy.hasValidMoves(otherPawn)) {
                        gameCopy.calculateAvailableMoves(Pawn);
                        eval = minimax(gameCopy, depth - 1, false, alpha, beta, Pawn, pawnEval);
                    }else{
                        eval = minimax(gameCopy, depth - 1, true, alpha, beta, otherPawn, pawnEval);
                    }


                    minEval = min(minEval, eval);
                    beta = min(beta, eval);

                    if (beta <= alpha) {
                        brk = 1;
                        break;
                    }                   
                }
                if(brk == 1) break;
            }
        }

        return minEval;
    }
}

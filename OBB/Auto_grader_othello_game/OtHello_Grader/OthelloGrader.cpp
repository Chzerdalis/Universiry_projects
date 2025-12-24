#include "OthelloGrader.h"

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

void OthelloGrader::gradeMoves(OthelloGame &game, int depth)
{
    int bestScore = -10000;
    Move bestMove;
    moveScores.clear();

    // Loop through all possible moves
    
    for (int i = 0; i < 8; ++i) {
        for (int j = 0; j < 8; ++j) {
            Move move = {i, j};
            string tempMove;
 
            if (game.isValidMove(move.row, move.col)) {
                // Make the move on a copy of the game
                OthelloGame gameCopy(game);
                gameCopy.makeMove(move.row, move.col, PLAYER_X);
                
                gameCopy.calculateAvailableMoves(PLAYER_O);
                // gameCopy.printBoard();
                // Calculate the score of the move using the minimax function
                int moveScore = minimax(gameCopy, depth - 1, false, -10000, 10000);

                game.rowColToMove(move.row, move.col, tempMove);
                moveScores.push_back({tempMove, moveScore});

                cout << "Move: " << tempMove << " Score: " << moveScore << endl;
                // If the score of the move is better than the best score, update the best score and the best move
                if (moveScore > bestScore) {
                    bestScore = moveScore;
                    bestMove = move;
                }
            }
        }
    }
}

int evaluateBoard(OthelloGame& game, int player) {
    int opponent = (player == PLAYER_X) ? PLAYER_O : PLAYER_X;
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

int OthelloGrader::minimax(OthelloGame &game, int depth, bool maximizingPlayer, int alpha, int beta)
{
    if (depth == 0 || game.isGameOver())
    {

        // Return the score of the board
        return evaluateBoard(game, 1);
    }

    if (maximizingPlayer)
    {
        int maxEval = -10000;

        // Loop through all possible moves
        for (int i = 0; i < 8; ++i) {
            for (int j = 0; j < 8; ++j) {
                Move move = {i, j};
                if (game.isValidMove(move.row, move.col)) {
                    // Make the move on a copy of the game
                    OthelloGame gameCopy(game);
                    gameCopy.makeMove(move.row, move.col, PLAYER_X);
                    
                    gameCopy.calculateAvailableMoves(PLAYER_O);
                    // gameCopy.printBoard();

                    // Calculate the score of the move using the minimax function
                    int eval = minimax(gameCopy, depth - 1, false, alpha, beta);

                    maxEval = max(maxEval, eval);
                    alpha = max(alpha, eval);

                    if (beta <= alpha)
                        break;
                }
            }
        }
        return maxEval;
    }
    else
    {
        int minEval = 10000;

        // Loop through all possible moves
        for (int i = 0; i < 8; ++i) {
            for (int j = 0; j < 8; ++j) {
                Move move = {i, j};
                if (game.isValidMove(move.row, move.col)) {
                    // Make the move on a copy of the game
                    OthelloGame gameCopy(game);
                    gameCopy.makeMove(move.row, move.col, PLAYER_O);

                    gameCopy.calculateAvailableMoves(PLAYER_X);
                    // gameCopy.printBoard();
                    // Calculate the score of the move using the minimax function
                    int eval = minimax(gameCopy, depth - 1, true, alpha, beta);

                    minEval = min(minEval, eval);
                    beta = min(beta, eval);

                    if (beta <= alpha)
                        break;
                }
            }
        }

        return minEval;
    }
}
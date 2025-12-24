#include "OthelloGame.h"
#include "AIPlayer.h"

#include <iostream>

using namespace std;

// PLAYER_X is the AI player
// PLAYER_O is the END User

int main()
{
    OthelloGame game;
    AIPlayer ai;
    string color;
    int depth;

    std::cout << "Welcome to Othello!\n\n";

    while(1) {
        std::cout << "Choose color (black/white/b/w/B/W/O/X/o/x): ";
        cin >> color;

        if (color != "black" && color != "white" && color != "b" && color != "w" && color != "B" &&
            color != "W" && color != "O" && color != "X" && color != "o" && color != "x") {
            cout << "Invalid color. Try again...\n" << std::endl;
        } else {
            break;
        }
    }

    if(color == "black" || color == "b" || color == "B" || color == "O" || color == "o" ) {
        game.firstPlayer = "HUMAN";
    } else {
        game.firstPlayer = "AI";
    }

    while(1) {
        std::cout << "Estimate forward moves [1,9]: ";
        cin >> depth;

        if (depth < 1 || depth > 9) {
            cout << "Invalid moves. Try again...\n" << std::endl;
        } else {
            break;
        }
    }

    //int currentPlayer = game.firstPlayer == "ME" ? PLAYER_O : PLAYER_X;
    int currentPawn = Pawn_O;
    string currentPlayer = game.firstPlayer;
    game.depth = depth;
    //game.calculateAvailableMoves(currentPawn);
    //game.printBoard();

    while(!game.isGameOver())
    {   
        cout << "\nPlayer " << (currentPawn==Pawn_X ? "X" : "O") << "'s turn.\n" << std::endl;
        game.calculateAvailableMoves(currentPawn);
        game.printBoard();
        game.printMoves();

        if (!game.hasValidMoves(currentPawn))
        {
            // If not, switch to the other player
            currentPawn = (currentPawn == Pawn_O) ? Pawn_X : Pawn_O;
            currentPlayer = (currentPlayer == "AI") ? "HUMAN" : "AI";
            cout << "\nNot available moves!\n" << std::endl;
            continue;
        }

        // PLAYER_X is the AI player
        if (currentPlayer == "AI")
        {
            ai.makeMove(game, depth, currentPawn);
        }
        else
        {
            game.PlayerMove(currentPawn);
        }
        
        if(currentPawn == Pawn_O){
            cout << "\nPlayer O played: " << game.moves.back() << endl;
        }else{
            cout << "\nPlayer X played: " << game.moves.back()<< endl;
        }

        currentPawn = (currentPawn == Pawn_O) ? Pawn_X : Pawn_O;
        currentPlayer = (currentPlayer == "AI") ? "HUMAN" : "AI";

        //game.calculateAvailableMoves(currentPawn);
        // // Check if the current player has any valid moves
        // if (!game.hasValidMoves(currentPawn))
        // {
        //     // If not, switch to the other player
        //     currentPawn = (currentPawn == Pawn_O) ? Pawn_X : Pawn_O;
        //     currentPlayer = (currentPlayer == "AI") ? "HUMAN" : "AI";
        //     game.calculateAvailableMoves(currentPawn);
        // }

        // game.printBoard();
        // game.printMoves();
    }

    std::cout << "\nGame Over!\n";

    game.printResult();
    game.exportToJSON();

    return 0;
}

#include "OthelloGame.h"
#include "OthelloGrader.h"

#include <iostream>
#include <fstream>
#include <cmath>
#include <algorithm>

using namespace std;

int main()
{
    OthelloGame game;
    OthelloGrader grader;
    int finalScore;
    int depth;
    string firstPlayer;
    vector<string> moves;
    vector<double> percentages;

   //Read from the json file names game_data.json and assign the values to the variables
    ifstream file("game_data.json");
    if (file.is_open())
    {
        string line;
        while (getline(file, line))
        {
            if (line.find("FirstPlayer") != string::npos)
            {
                firstPlayer = line.substr(line.find(":") + 3, 2);
            }
            else if (line.find("Depth") != string::npos)
            {
                depth = stoi(line.substr(line.find(":") + 2, 1));
            }
            else if (line.find("Moves") != string::npos)
            {
                string movesStr = line.substr(line.find("[") + 1, line.find("]") - line.find("[") - 1);
                string move;
                for (long unsigned int i = 0; i < movesStr.length(); i++)
                {
                    if (movesStr[i] == '"')
                    {
                        move = movesStr.substr(i + 1, 2);
                        i += 3;
                        moves.push_back(move);
                    }
                }
            }
        }
    }

    

    int currentPlayer = (firstPlayer == "HU") ? 2 : 1;
    cout<<firstPlayer;
    cout<<currentPlayer<<"\n";
    game.calculateAvailableMoves(currentPlayer);
    // game.printBoard();

    for_each(moves.begin(), moves.end(), [&](string move) {
        int row, col;
        double percentage;
        int playerMoveScore = 0;
        float bestMoveScore = -INFINITY;
        
        std::cout << move << "This is moveeeeeeeee\n\n\n";

        game.moveToRowCol(move, row, col);

        if(currentPlayer == 1){
            grader.gradeMoves(game, depth);
            
            //find players move score in the moveScores vector
            for(auto moveScore : grader.moveScores){
                if(moveScore.move == move){
                    playerMoveScore = moveScore.score;
                    break;
                }
            }

            //find the best move score in the moveScores vector
            for(auto moveScore : grader.moveScores){
                if(moveScore.score > bestMoveScore){
                    bestMoveScore = moveScore.score;
                }
            }

            if(bestMoveScore == 0) {
                if(playerMoveScore == 0) percentage = 1;
                else percentage = 0;
            } else {
                percentage = ((double) playerMoveScore) / bestMoveScore;
            }
            
            if (percentage < 0) {
                percentage = 0.0;
            }

            percentages.push_back(percentage);

            std::cout << "Player " << currentPlayer << " move: " << move << " score: " << playerMoveScore << " best score: " << bestMoveScore << " percentage: " << percentage << endl;
        }
    
        game.makeMove(row, col, currentPlayer);
        currentPlayer = (currentPlayer == 2) ? 1 : 2;
        game.calculateAvailableMoves(currentPlayer);

        // Check if the current player has any valid moves
        if (!game.hasValidMoves(currentPlayer))
        {
            // If not, switch to the other player
            currentPlayer = (currentPlayer == 2) ? 1 : 2;
            game.calculateAvailableMoves(currentPlayer);
        }

        game.printBoard();
        cout << "*" << percentage << endl;
    });

    //calculate the average percentage
    double sum = 0;
    for(auto percentage : percentages){
        sum += percentage;
        cout << percentage << endl;
    }
    cout << sum << endl;
    cout << percentages.size() << endl;
    double average = sum / percentages.size();

    std::cout << "Average percentage: " << average << endl;

    // finalScore = (1 - average) * 100;
    finalScore = (average) * 100;

    std::cout << "Final score: " << finalScore << "%" << endl;

    return 0;
}
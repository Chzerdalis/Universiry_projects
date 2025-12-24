#include "OthelloGame.h"
#include <iostream>
#include <fstream>

using namespace std;

int OthelloGame::moveToRowCol(std::string move, int &row, int &col)
{
    if (move.length() != 2)
    {
        //std::cout << "Invalid move. Please enter a move in the format 'c2'." << std::endl;
        return -1;
    }
    col = tolower(move[0]) - 'a';
    row = move[1] - '1';
    if (row < 0 || row >= SIZE || col < 0 || col >= SIZE)
    {
        return -1;
    }
    return 0;
}

int OthelloGame::rowColToMove(int row, int col, std::string &move) const
{
    if (row < 0 || row >= SIZE || col < 0 || col >= SIZE)
    {
        return -1;
    }
    move = "";
    move += (char)(col + 'a');
    move += (char)(row + '1');
    return 0;
}

// create a constructor
OthelloGame::OthelloGame()
{
    // initialize the board with 8x8
    board.resize(SIZE);

    // initialize the board
    for (int i = 0; i < SIZE; i++)
    {
        board[i].resize(SIZE);
        for (int j = 0; j < SIZE; j++)
        {
            board[i][j] = EMPTY;
        }
    }
    // set the initial 4 pieces
    board[3][3] = Pawn_X;
    board[3][4] = Pawn_O;
    board[4][3] = Pawn_O;
    board[4][4] = Pawn_X;
}

OthelloGame::OthelloGame(const OthelloGame& other)
{
    // Initialize the board with the same size as the other board
    board.resize(other.board.size());
    for (int i = 0; i < SIZE; i++)
    {
        board[i].resize(other.board[i].size());
    }

    // Copy the values from the other board
    for (int i = 0; i < SIZE; i++)
    {
        for (int j = 0; j < SIZE; j++)
        {
            board[i][j] = other.board[i][j];
        }
    }
}

void OthelloGame::printMoves() const
{
    std::cout << "Moves history: ";
    for (const auto &move : moves)
    {
        std::cout << move << " ";
    }
    std::cout << std::endl;
}

void OthelloGame::PlayerMove(int currentPlayer)
{
    int row, col;
    string move;
    bool validMove = false;

    //cout << "\nPlayer " << (currentPlayer==1 ? "X" : "O") << "'s turn." << std::endl;

    while (!validMove)
    {
        cout << "\nEnter your move (e.g. c2): ";
        cin >> move;
        if (moveToRowCol(move, row, col) == 0)
        {
            if (board[row][col] == AVAILABLE_MOVE)
            {
                validMove = true;
            }
            else
            {
                cout << "Invalid move. Try again!." << std::endl;
            }
        } else {
            cout << "Invalid move. Try again!." << std::endl;
        }
    }
    moves.push_back(move);
    makeMove(row, col, currentPlayer);
}

bool OthelloGame::isValidMove(int row, int col) const{
    if(board[row][col] == AVAILABLE_MOVE){
        return true;
    }else{
        return false;
    }
}

bool OthelloGame::isGameOver() const
{
    // Check for available moves for Pawn_X
    OthelloGame tempGame(*this); // Create a copy of the current game state
    tempGame.calculateAvailableMoves(Pawn_X);
    for (int i = 0; i < SIZE; i++)
    {
        for (int j = 0; j < SIZE; j++)
        {
            if (tempGame.board[i][j] == AVAILABLE_MOVE)
            {
                return false; // Pawn_X can still make a move
            }
        }
    }

    // Check for available moves for Pawn_O
    tempGame = *this; // Reset the copy to the current game state
    tempGame.calculateAvailableMoves(Pawn_O);
    for (int i = 0; i < SIZE; i++)
    {
        for (int j = 0; j < SIZE; j++)
        {
            if (tempGame.board[i][j] == AVAILABLE_MOVE)
            {
                return false; // Pawn_O can still make a move
            }
        }
    }
    // If no available moves for either player, the game is over
    return true;
}

// make the chosen move and flip the opponent's pieces
void OthelloGame::makeMove(int row, int col, int currentPlayer){
    int opponent = (currentPlayer == Pawn_X) ? Pawn_O : Pawn_X;

    //cout<<"&&&&&&&&&&&&&" << row << "  " <<col << "&&&&&&&&&&&&\n";
    // Make the move
    board[row][col] = currentPlayer;

    // Flip the opponent's pieces
    for (int dx = -1; dx <= 1; dx++)
    {
        for (int dy = -1; dy <= 1; dy++)
        {
            if (dx == 0 && dy == 0) continue; // Skip the case where dx and dy are both 0

            int x = row + dx;
            int y = col + dy;

            // Check if the immediate next cell in the direction (dx, dy) is occupied by the opponent's piece
            if (x >= 0 && x < SIZE && y >= 0 && y < SIZE && board[x][y] == opponent)
            {
                // Move in the direction (dx, dy) until we find a piece of the current player's color
                while (x >= 0 && x < SIZE && y >= 0 && y < SIZE)
                {
                    x += dx;
                    y += dy;

                    // If we find an empty cell or we go out of the board, the move is not valid
                    if (x < 0 || x >= SIZE || y < 0 || y >= SIZE || board[x][y] == EMPTY)
                    {
                        break;
                    }
                    // If we find a piece of the current player's color, flip all the opponent's pieces in between
                    else if (board[x][y] == currentPlayer)
                    {
                        while (board[x -= dx][y -= dy] == opponent) // Go back to the original cell, flipping the opponent's pieces
                        {
                            board[x][y] = currentPlayer;
                        }
                        break;
                    }
                }
            }
        }
    }
}

void OthelloGame::calculateAvailableMoves(int currentPlayer) {
    int opponent = (currentPlayer == Pawn_X) ? Pawn_O : Pawn_X;
    const int directions[8][2] = {
        {-1, 0}, {1, 0}, {0, -1}, {0, 1},   // Vertical and horizontal
        {-1, -1}, {-1, 1}, {1, -1}, {1, 1}  // Diagonal directions
    };

    // Clear previously available moves from the board
    for (int i = 0; i < SIZE; ++i) {
        for (int j = 0; j < SIZE; ++j) {
            if (board[i][j] == AVAILABLE_MOVE) {
                board[i][j] = EMPTY;
            }
        }
    }

    // Check each position on the board
    for (int row = 0; row < SIZE; ++row) {
        for (int col = 0; col < SIZE; ++col) {
            if (board[row][col] != EMPTY) {
                continue;  // Skip occupied cells
            }

            bool validMove = false;

            // Check all 8 directions for a valid move
            for (int i = 0; i < 8; ++i) {
                int dx = directions[i][0], dy = directions[i][1];
                int x = row + dx, y = col + dy;
                bool opponentFound = false;

                // Move in the current direction
                while (x >= 0 && x < SIZE && y >= 0 && y < SIZE && board[x][y] == opponent) {
                    opponentFound = true;
                    x += dx;
                    y += dy;
                }

                // If an opponent was found and the line ends with a player's piece
                if (opponentFound && x >= 0 && x < SIZE && y >= 0 && y < SIZE && board[x][y] == currentPlayer) {
                    validMove = true;  // This position is a valid move
                    break;  // No need to check other directions for this position
                }
            }

            if (validMove) {
                board[row][col] = AVAILABLE_MOVE;  // Mark valid move
            }
        }
    }
}



/*
void OthelloGame::printBoard() const
{
    cout << "    A   B   C   D   E   F   G   H " << std::endl;
    for (int i = 0; i < SIZE; ++i)
    {
        cout << i + 1 << " ";
        for (int j = 0; j < SIZE; ++j)
        {
            cout << "|";
            if (board[i][j] == EMPTY)
            {
                cout << "---";
            }
            else if (board[i][j] == Pawn_X)
            {
                cout << " X ";
            }
            else if (board[i][j] == Pawn_O)
            {
                cout << " O ";
            }else if(board[i][j] == AVAILABLE_MOVE){
                cout << " * ";
            }
        }
        cout << "|" << std::endl;
    }
} */

void OthelloGame::printBoard() const
{
    cout << "  a b c d e f g h" << std::endl;
    for (int i = 0; i < SIZE; ++i)
    {
        cout << i + 1 << " ";
        for (int j = 0; j < SIZE; ++j)
        {
            if (board[i][j] == EMPTY)
            {
                cout << ". ";
            }
            else if (board[i][j] == Pawn_X)
            {
                cout << "X ";
            }
            else if (board[i][j] == Pawn_O)
            {
                cout << "O ";
            }else if(board[i][j] == AVAILABLE_MOVE){
                cout << "* ";
            }
        }
        cout << std::endl;
    }
}

bool OthelloGame::hasValidMoves(int player) const
{
    for (int i = 0; i < SIZE; i++)
    {
        for (int j = 0; j < SIZE; j++)
        {
            if (board[i][j] == AVAILABLE_MOVE)
            {
                return true;
            }
        }
    }
    return false;
}

void OthelloGame::printResult() const
{
    int playerXScore = 0;
    int playerOScore = 0;

    // Calculate scores
    for (const auto &row : board)
    {
        for (const auto &cell : row)
        {
            if (cell == Pawn_X)
            {
                ++playerXScore;
            }
            else if (cell == Pawn_O)
            {
                ++playerOScore;
            }
        }
    }

    // Print winner
    if (playerXScore > playerOScore)
    {
        std::cout << "X:" << playerXScore << "/" << "O:" << playerOScore << " Player X won!\n";
    }
    else if (playerOScore > playerXScore)
    {
        std::cout << "X:" << playerXScore << "/" << "O:" << playerOScore << " Player O won!\n";
    }
    else
    {
        std::cout << "X:" << playerXScore << "/" << "O:" << playerOScore << " It's a draw!\n";
    }
}

// Method to convert game state to JSON
void OthelloGame::exportToJSON() const 
{
    std::string json = "{\n";
    json += "  \"FirstPlayer\": \"" + firstPlayer + "\",\n";
    json += "  \"Depth\": " + std::to_string(depth) + ",\n";
    json += "  \"Moves\": [";
    for (size_t i = 0; i < moves.size(); ++i) {
        json += "\"" + moves[i] + "\"";
        if (i < moves.size() - 1) {
            json += ", ";
        }
    }
    json += "]\n}";

    std::ofstream file("game_data.json");
    if (file.is_open()) {
        file << json;
        file.close();
    }
}

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>
#include <signal.h>
#include <errno.h>
#include <poll.h>
#include <sys/types.h>
#include <sys/wait.h>
#include "OthelloGame.h"
#include "AIPlayer.h"

#include <iostream>
using namespace std;

int main(int argc, char *argv[]) {
    int pid, fd_1[2], fd_2[2];
    int status;

    if(pipe(fd_1) == -1) exit(-1); //fd_1 reads from grader writes to student
    if(pipe(fd_2) == -1) exit(-2); //fd_2 reads from student writes to grader

    pid = fork();

    if (pid == 0) {
        //Students code execution
        close(fd_1[1]);
        close(fd_2[0]);
        dup2(fd_1[0], 0);
        dup2(fd_2[1], 1);
        close(fd_1[0]);
        close(fd_2[1]);
    
        execlp("../OtHello_Student/main", "main", (char*)NULL);

        cerr << "Fail execlp\n";
        exit(-1);
    } else {
        OthelloGame game;
        AIPlayer ai;
        int bytes_read = 0, bytes_total = 0, out, row = 0, col = 0;
        int size = 2048;
        std::string output_std, move_played;
        std::size_t pos;
        char* output;
        int AI, student;
        std::string firstPlay, studentPawn , AIPawn, depth_student, depth_AI;

        //check arguments
        if(argc != 4) {
            cerr << "Give arguments in form of:\n(AI Depth) (Student Depth) (First player:(AI or Student))\n";
            return -1;
        } else {
            depth_AI = argv[1];
            depth_student = argv[2];
            firstPlay = argv[3];
        }
        
        //initialize based on arguments 
        //Who plays first and what message should we check 
        if(firstPlay == "Student") {
            studentPawn = "O"; //String for checking certain output from student/child
            AIPawn = "X\n"; //String for initializing the student/child program
            AI = 1;
            student = 2;
        } else if(firstPlay == "AI") {
            studentPawn = "X";
            AIPawn = "O\n"; 
            AI = 2;
            student = 1;
        }
        
        //File with prints of student program
        FILE* fp = fopen("Game_log_student_view.txt", "w+");
        if (!fp) {
            return 1;
        }
        //File with prints of auto-player program
        if (freopen("Game_log_Autolab_view.txt.txt", "w+", stdout) == nullptr) {
            return 1;
        }

        std::fprintf(fp, "Depth AI: %s Depth Student: %s First player: %s\n", depth_AI.c_str(), depth_student.c_str(), firstPlay.c_str());

        output = (char*)malloc(size*sizeof(char));
        if(output == NULL) return -1;

        close(fd_1[0]);
        close(fd_2[1]);

        struct pollfd pfd;
        pfd.fd = fd_2[0];
        pfd.events = POLLIN;

        struct timespec timeout;
        //An o Student Kathisteri prepei na megalosei h timi toy
        timeout.tv_sec = 0; 
        timeout.tv_nsec = 100000000; 

        sigset_t sigmask;
        sigemptyset(&sigmask);


        while(!waitpid(pid, &status, WNOHANG)) {
            out = ppoll(&pfd, 1, &timeout, &sigmask);
            if(out == -1) break;
            if(out > 0 && (pfd.revents & POLLIN)) {
                
                //Allocates more space for the output if needed
                if(size - bytes_total - 1 == 0) {
                    size = size*2;
                    output = (char*)realloc(output, size*sizeof(char));
                }

                //Reads from child
                bytes_read = read(fd_2[0], &(output[bytes_total]), size - bytes_total - 1);

                //if fail
                if(bytes_read < 0) {
                    free(output);
                    return -1;
                }else{
                    //\0 to make it a string
                    bytes_total += bytes_read;
                    output[bytes_total] = '\0';
                }

            } else{
                //Print out for debagging
                std::fprintf(fp, "%s", output);
                //make out to std_string for easy of use
                output_std = std::string(output);
                
                //Check for key phrases
                if(output_std.find("Choose color (black/white/b/w/B/W/O/X/o/x):") != std::string::npos) {
                    write(fd_1[1], AIPawn.c_str(), 2);
                    output[0] = '\0';
                } 
                else if(output_std.find("Estimate forward moves [1,9]: ") != std::string::npos) {
                    write(fd_1[1], (depth_student + "\n").c_str(), 2);
                    output[0] = '\0';
                } 
                else if(output_std.find("Invalid move. Try again!.") != std::string::npos) {
                    game.printBoard();
                    game.printMoves();
                    cout << "\n";
                    cerr << "Autolab played a move that was invalid for your program, it should be valid.\n";
                    free(output);
                    return -1;
                } 
                else if(output_std.find("\nEnter your move (e.g. c2): ") != std::string::npos) {

                    //Find the move that the student made
                    pos = output_std.find("Player " + studentPawn + " played: ");
                    do {
                        //cerr<<"******" << pos << "\n";
                        if(pos != std::string::npos) {
                            //Make move onn our board
                            move_played = output_std.substr(pos + 17, 2);
                            game.moveToRowCol(move_played, row, col);

                            game.calculateAvailableMoves(student);
                            if(!game.hasValidMoves(student)) {
                                game.printBoard();
                                game.printMoves();
                                cout << "\n";
                                cerr<<"Played wrong move.\n";
                                free(output);
                                return -1;
                            }else if(game.board[row][col] == AVAILABLE_MOVE) {
                                game.moves.push_back(move_played);
                                game.makeMove(row, col, student);
                                cout << "Move detected " << move_played <<"\n\n";
                                game.printBoard();
                                game.printMoves();
                                cout << "\n";
                            }else {
                                game.printBoard();
                                game.printMoves();
                                cout << "\n";
                                cerr<<"Played wrong move.\n";
                                free(output);
                                return -1;
                            }
                            
                        }
                        pos = output_std.find("Player " + studentPawn + " played: ", pos + 17);
                    }while(pos != std::string::npos);
                    //play our move
                    game.calculateAvailableMoves(AI);

                    if(game.hasValidMoves(AI)) {
                        ai.makeMove(game, stoi(depth_AI), AI);                          
                        move_played = game.moves.back();
                        cout << "Move played by Auto-player " << move_played <<"\n\n";
                        game.printBoard();   
                        game.printMoves();
                        cout << "\n";          
                        write(fd_1[1], (move_played + "\n").c_str(), 3);
                    }else {
                        game.printBoard();
                        game.printMoves();
                        cout << "\n";
                        cerr<<"You program expects move from autolab when it should not.\n";
                        free(output);
                        return -1;
                    }
                    output[0] = '\0';
                }
                else if(output_std.find("Not available moves!\n") != std::string::npos) {
                    pos = output_std.find("Player " + studentPawn + " played: ");
                    do {
                        //cerr<<"******" << pos << "\n";
                        if(pos != std::string::npos) {
                            //Make move onn our board
                            move_played = output_std.substr(pos + 17, 2);
                            game.moveToRowCol(move_played, row, col);

                            game.calculateAvailableMoves(student);
                            if(!game.hasValidMoves(student)) {
                                game.printBoard();
                                game.printMoves();
                                cout << "\n";
                                cerr<<"Played wrong move.\n";
                                free(output);
                                return -1;
                            }else if(game.board[row][col] == AVAILABLE_MOVE) {
                                game.moves.push_back(move_played);
                                game.makeMove(row, col, student);
                                cout << "Move detected " << move_played <<"\n\n";
                                game.printBoard();
                                game.printMoves();
                                cout << "\n";
                            }else {
                                game.printBoard();
                                game.printMoves();
                                cout << "\n";
                                cerr<<"Played wrong move.\n";
                                free(output);
                                return -1;
                            }
                            
                        }
                        pos = output_std.find("Player " + studentPawn + " played: ", pos + 17);
                    }while(pos != std::string::npos);
                    output[0] = '\0';
                }
                else if(output_std.find("Game Over!\n") != std::string::npos) {
                    break;
                }
                bytes_total = 0;
                bytes_read = 0;
            }
        }
        close(fd_1[1]);
        close(fd_2[0]);

        if (WIFSIGNALED(status)) {
            int sig = WTERMSIG(status);
            if (sig == SIGSEGV) {
                cerr << "Child process segfaulted (SIGSEGV)!\n";
                free(output);
                return 1; 
            }
        }
        if(firstPlay == "Student") {
            game.firstPlayer = "AI";
        } else {
            game.firstPlayer = "HUMAN";
        }
        
        game.depth = stoi(depth_student);
        game.exportToJSON();
        free(output);
    }

    return 0;
}
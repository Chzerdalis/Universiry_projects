#include <stdio.h>   
#include <stdlib.h>  
#include <unistd.h>
#include <sys/wait.h>
#include <sys/time.h>
#include <fcntl.h>
#include <string.h>
#include <signal.h>
#include <errno.h>

typedef struct {
    int output;
    int memory_acc;
    int compilation;
    int termination;
} grade_info;

int compiling_program(char* program_name);
static void handler(int sig);
void execute_grade(grade_info *grades, char* cfile, char* argfile, char* infile, char* outfile, char* time);
void print_results(grade_info grades);
int error_count(int fd);
void find_args(char* argfile, char*** table);

int main(int argc, char* argv[]) {
    int errors_warnings = 0;
    grade_info grades = {0, 0, 0, 0};
    
    //checks validity of arguments
    if(argc != 6) {
        return 41;
    }

    //compiling program and checking err
    errors_warnings = compiling_program(argv[1]);
    if(errors_warnings == -1) {
        grades.compilation = -100;
        print_results(grades);
        return 1;
    }else {
        grades.compilation = errors_warnings * (-5);
    }
    //execute and grade program
    execute_grade(&grades, argv[1], argv[2], argv[3], argv[4], argv[5]);
    //print results
    print_results(grades);
    return 0;
}

//compiles program and checks error out
int compiling_program(char* program_name) {
    int pid, size, res, fd;
    char *executable_name, *error_file_name;

    //i ctreate the name of the eroors output
    size = strlen(program_name);
    error_file_name = (char*)malloc(size + 3);
    if(error_file_name == NULL) exit(42);
    strcpy(error_file_name, program_name);
    error_file_name[size - 1] = 'e';
    error_file_name[size] = 'r';
    error_file_name[size + 1] = 'r';
    error_file_name[size + 2] = '\0';

    //open file for errors
    fd = open(error_file_name, O_RDWR | O_CREAT | O_TRUNC, S_IRWXU);
    if(fd == -1) exit(42);
    
    //frees memory of the error string
    free(error_file_name);
    
    //create the name of the executable
    size = strlen(program_name);
    executable_name = (char*)malloc(size + 1);
    if(executable_name == NULL) exit(42);
    strcpy(executable_name, program_name);
    executable_name[size - 2] = '\0';

    pid = fork();
    if(pid == -1) exit(42);

    if(pid == 0) {
        //child process
        //compliling the given program
        if(dup2(fd, 2) == -1) exit(42);
        if(close(fd) == -1) exit(42);
        if(execl("/usr/bin/gcc", "gcc", "-Wall", "-g",  program_name, "-o", executable_name, NULL) == -1) exit(42);
    }

    //main process handles errors
    //waiting for the child to die
    if(waitpid(pid, NULL, 0) == -1) exit(42);
    //counts errors
    res = error_count(fd);
    //free mem of name for executable
    free(executable_name);
    return res;
}

/*this function reads from the errors file
 line by line with buffs of 64 and checks for the key words
 if it finds an error returns -1 else the count of errors*/
int error_count(int fd) {
    char* buff, *res;
    int size_realloc = 0, size_string = 0;
    int warning_count = 0;
    
    //moves fd to the start
    if(lseek(fd, 0, SEEK_SET) == -1) exit(42);
    //redirects input to fd
    if(dup2(fd, 0) == -1) exit(42);
    if(close(fd) == -1) exit(42);

    while(1) {
        buff = NULL;
        size_realloc = 0;
        size_string = 0;
        //reads until saving a whole line of text using fgets
        while(1) {
            size_realloc += 64;

            buff = (char*)realloc(buff, size_realloc);
            if(buff == NULL) exit(42);

            res = fgets(&buff[size_string], 64, stdin);
            //reaches eof
            if(res == NULL) break;
            //true if it has read a whole line
            size_string = strlen(buff);
            if(buff[size_string - 1] == '\n') break;
        }
        if(res == NULL) {
            free(buff);
            break;
        }
        //checks for the key words
        if(strstr(buff, " error: ") != NULL) {
            free(buff);
            return -1;
        }else if(strstr(buff, "warning:") != NULL) {
            warning_count++;
        }
        free(buff);
    }
    return warning_count;
}

/*empty handler that handles SIGALARM and 
prevents from stopping the program*/
static void handler(int sig) {
}

/*this function executes the given program 
checks for given singals, comperes its output to a given one,
and sets an alarm to stop its execution after a given time*/
void execute_grade(grade_info *grades, char* cfile, char* argfile, char* infile, char* outfile, char* time) {
    struct itimerval alarm = { {0} };
    struct sigaction action = { {0} };
    int pid_1, pid_2, fd_pipe[2], fd_1, size, res;
    int status_1 , status_2;
    char **table;
    char* helper;

    /*allocating memory for the array of pointers that
    will contain the arguments needed for the execution*/
    table = (char**)malloc(sizeof(char*));
    if(table == NULL) exit(42);

    if(pipe(fd_pipe) == -1) exit(42);

    //creates the sting that is needed to run the program
    //e.x. ./program
    size = strlen(cfile);
    helper = (char*)malloc(size + 3);
    helper[0] = '.';
    helper[1] = '/';
    helper[2] = '\0';
    strcat(helper, cfile);
    helper[size] = '\0';

    //creates the first argyment
    //e.x. the same as above without ./
    cfile[strlen(cfile) - 2] = '\0';
    table[0] = cfile;
    
    pid_1 = fork();
    if(pid_1 == -1) exit(42);

    if(pid_1 == 0) {
        //child p2
        //saves arguments into a dynamic table
        find_args(argfile, &table);

        //opens in file
        fd_1 = open(infile, O_RDONLY);
        if(fd_1 == -1) exit(42);
        
        //redirects in and outs 
        //to the in file and one end of the write end of the pipe
        if(close(fd_pipe[0]) == -1) exit(42);
        if(dup2(fd_1, 0) == -1) exit(42);
        if(close(fd_1) == -1) exit(42);
        if(dup2(fd_pipe[1], 1) == -1) exit(42);
        if(close(fd_pipe[1]) == -1) exit(42);

        //runs program
        if(execv(helper, table) == -1) exit(42);
    } else {
        pid_2 = fork();
        if(pid_2 == -1) exit(42);

        if(pid_2 == 0) {
            //child p3
            //redirects input to the read end of the pipe
            if(close(fd_pipe[1]) == -1) exit(42);
            if(dup2(fd_pipe[0], 0) == -1) exit(42);
            if(close(fd_pipe[0]) == -1) exit(42);

            //runs p4diff to compare the outputs
            if(execl("./p4diff", "p4diff", outfile, NULL) == -1) exit(42);
        }else {

            //closes ends of the pipe in order fot the read to not block
            if(close(fd_pipe[0]) == -1) exit(42);
            if(close(fd_pipe[1]) == -1) exit(42);

            //sets handler
            action.sa_handler = handler;
            if(sigaction(SIGALRM, &action, NULL) == -1) exit(42);

            //sets alarm
            alarm.it_value.tv_sec = atoi(time);
            alarm.it_value.tv_usec = 0;
            alarm.it_interval.tv_sec = 0;
            alarm.it_interval.tv_usec = 0;
            if(setitimer(ITIMER_REAL, &alarm, NULL) == -1) exit(42);

            //waits for the program to end
            //if sigalarm comes waitpid fails with a certer errno
            res = waitpid(pid_1, &status_2, 0);
            if(res == -1 && errno == EINTR) {
                //if this is the case child diesss
                kill(pid_1, SIGKILL); 
                grades->termination = -100; 
            }else if(res == -1) {
                exit(42);
            }

            //if the process ends before alarm
            //the alarm is set off
            alarm.it_value.tv_sec = 0;

            //wait for the output grade
            if(waitpid(pid_2, &status_1, 0) == -1) exit(42);

            if (WIFEXITED(status_1)) {
                grades->output = WEXITSTATUS(status_1);
            }

            //checks for certain signals that may have impeded the program
            if(WIFSIGNALED(status_2)) {
                if(WTERMSIG(status_2) == SIGSEGV || WTERMSIG(status_2) == SIGABRT || WTERMSIG(status_2) == SIGBUS) {
                    grades->memory_acc = -15;
                }
            }
            
            //frees mem
            free(helper);
            free(table);
        }
    }
}

/*this function finds and puts on an array of pointers
the arguments from the given file that are needed for the 
execution of the program*/
void find_args(char* argfile, char*** table) {
    int res;
    char *arg;
    int size = 1;
    FILE* demo;

    //opens file with args
    demo = fopen(argfile, "r");
    if(demo == NULL) exit(42);
    while(1) {
        res = fscanf(demo, "%ms", &arg);
        *table = (char**)realloc(*table, ++size * sizeof(char*));
        if(*table == NULL) exit(42);
        (*table)[size - 1] = arg;
        if(res == EOF) break;
    }
    *table = (char**)realloc(*table, ++size * sizeof(char*));
    if(*table == NULL) exit(42);
    (*table)[size - 1] = NULL;
    if(fclose(demo) == -1) exit(42);
}

//prints the final results
void print_results(grade_info grades) {
    int final_result;

    final_result = grades.output + grades.memory_acc + grades.compilation + grades.termination;
    if(final_result < 0) {
        final_result = 0;
    }
    printf("\nCompilation: %d\n\nTermination: %d\n\nOutput: %d\n\nMemory access: %d\n\nScore: %d\n",
    grades.compilation, grades.termination, grades.output, grades.memory_acc, final_result);
}
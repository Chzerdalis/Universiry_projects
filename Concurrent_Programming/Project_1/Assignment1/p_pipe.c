#include"p_pipe.h"
static pipe_descriptor_t *pipe_descriptor = NULL;
static database_t *database= NULL;
static int counter=0;
static int is_open=0;
static char **database_buffer; //TODO: crusial at the ending point

/* Trexteto me valgrind yparxei thema me thn mnhmh xanei bytes*/
/* Yparxei thema me ta race conditions*/

int pipe_open(int size){
    counter += 1; 
    is_open +=1;
    //array of structs that keep the read and write info
    database = realloc(database, sizeof(database_t)*counter);
    assert(database != NULL);

    database[counter - 1].read = size;
    database[counter - 1].write = size;
    database[counter - 1].pipe_size = size;
    
    //array of structs that keeps the pipes info
    pipe_descriptor=realloc(pipe_descriptor,sizeof(pipe_descriptor_t)*counter);
    assert(pipe_descriptor != NULL);

    pipe_descriptor[counter - 1].return_val = counter;
    pipe_descriptor[counter - 1].is_open = true;

    //the buffer array of arrays of chars
    database_buffer = (char **)realloc(database_buffer,counter*sizeof(char *));
    assert(database_buffer !=NULL);
    
    database_buffer[counter -1] =(char *)malloc(sizeof(char)* size); 
    assert(database_buffer[counter - 1] != NULL);

    return (pipe_descriptor[counter -1].return_val);
}

int pipe_write(int p, char c){//TODO: Add the mechanism of DBSM

    //mechanism to check if the location is valid and the pipe is still open
    int location = search_id(p);
    if(location == -1 || pipe_descriptor[location].is_open == false){
        return(-1);
    }

    //writes to pipe
    int s = database[location].pipe_size;
    if(database[location].write % s != database[location].read % s) {

        database_buffer[location][(database[location].write + 1) % s] = c;

        database[location ].write = database[location].write + 1;

        return (1);
    }else if(database[location].write == database[location].read){

        database_buffer[location][(database[location].write + 1) % s] = c;

        database[location ].write = database[location].write + 1;
        
        return (1);
    }

    //blocks and waits
    while(database[location].write % s == database[location].read % s);
    database_buffer[location][(database[location].write + 1) % s] = c;
    database[location].write = database[location].write + 1;

    return (1);
}

int pipe_read(int p,char *c){
    int location = search_id(p); // case if pipe doesnt exists
    int i;
    if(location == -1){
        return(-1);
    }

    int s = database[location].pipe_size;

    //checks if pipe is to be closed 
    if(pipe_descriptor[location].is_open == false && database[location].write == database[location].read){ 
        free(database_buffer[location]);
        database_buffer[location] = NULL;
        if(is_open == 0){
            free(pipe_descriptor);
            pipe_descriptor = NULL;
            for(i = 0; i<counter; i++) {
                free(database_buffer[i]);
            }
            free(database_buffer);
            database_buffer = NULL;
            free(database);
            database = NULL;
        }
        return(0);
    }

    //blocks and waits to read
    while(database[location].write == database[location].read);

    //reads
    *c = database_buffer[location][(database[location].read + 1) % s];
    database[location].read = database[location].read + 1;

    return (1);
}

int pipe_writeDone(int p){
    int location = search_id(p);
    //closes write if pipe exists and write is open
    if(location == -1){
        return(-1);
    }
    if(pipe_descriptor[location].is_open == false){
        return(-1);
    }
    pipe_descriptor[location].is_open = false;
    return(1);
}

//gets pipe discriptor and returns his position in the databuffer
static int search_id(int p){
    for(int i=0; i< counter; i++){
        if(pipe_descriptor[i].return_val == p){
            return(i);
        }
    }
    return(-1);
}


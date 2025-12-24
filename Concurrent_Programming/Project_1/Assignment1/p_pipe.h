#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#include<stdbool.h>
extern int pipe_open(int size);
extern int pipe_write(int p,char c);
extern int pipe_read(int p,char *c);
extern int pipe_writeDone(int p);
static int search_id(int p);

typedef struct pipe_descriptor{
    int return_val;
    bool is_open;
} pipe_descriptor_t;
typedef struct pipe_info{
    int read;
    int write;
    int pipe_size;
} database_t;





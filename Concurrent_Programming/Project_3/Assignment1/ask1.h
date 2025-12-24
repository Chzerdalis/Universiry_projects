#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<stdbool.h>
#include<unistd.h>

typedef struct{
    int val;
    int id;
    int wait;
    bool init;
    pthread_mutex_t mutex;
    pthread_cond_t cond;
}mysem_t;


extern int mysem_init(mysem_t* s,int n);
extern int mysem_up(mysem_t* s);
extern int mysem_down(mysem_t* s);
extern int mysem_destroy(mysem_t* s);
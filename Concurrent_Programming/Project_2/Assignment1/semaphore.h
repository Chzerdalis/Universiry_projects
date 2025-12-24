#include<stdio.h>
#include<stdlib.h>
#include<stdbool.h>
#include <sys/ipc.h>
#include <sys/sem.h>
#include <time.h>
#include<pthread.h>
#include <errno.h>
#include <unistd.h>
#include <sys/stat.h> 

char filename[12] = "semaphore.h";
int count = 0;
typedef struct{
    int sem_id;
    bool init;
}mysem_t ;

extern int mysem_init(mysem_t *s,int n);
extern int mysem_down(mysem_t *s);
extern int mysem_up(mysem_t *s);
extern int mysem_destroy(mysem_t *s);


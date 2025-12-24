#include <stdio.h>
#include <ucontext.h>
#include <stdlib.h>
#include <signal.h>
#include<unistd.h>
#include <sys/time.h>
#include <math.h>
#define _XOPEN_SOURCE 700
#define _GNU_SOURCE 
#define STACK_SIZE 8000 //8KB

typedef struct {
    ucontext_t context;
}co_t;

typedef struct {
    int value;
}sem_t;

struct thr_t{
    co_t *co;
    int thread_id;
    struct thr_t* next_thread;
    struct thr_t* previous_thread;
    int critical_segment;
}; 

//Thread declarations
int mythreads_init();
int mythreads_create(struct thr_t *thr, void(body)(void*), void *arg);
int mythreads_yield();
int mythreads_join(struct thr_t *thr);
int mythreads_destroy(struct thr_t *thr);
int mythreads_sem_create(sem_t *s, int val);
int mythreads_sem_down(sem_t *s);
int mythreads_sem_up(sem_t *s);
int mythreads_sem_destroy(sem_t *s);
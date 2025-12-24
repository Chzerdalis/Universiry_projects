#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include<time.h>
#include "ask2.h"

#define RED_TEXT "\033[1;31m"
#define BLUE_TEXT "\033[1;34m"
#define RESET_TEXT "\033[0m"

sem_t mtx, wrt;
int n_reader = 0;
int count = 0, limit;
struct thr_t writer_thread, *reader_thread;

void reader(void *arg) {
    int i = (int)arg;
    printf(BLUE_TEXT"[[%d]]\n"RESET_TEXT, i);
    while(1) {
        sleep(1);
        mythreads_sem_down(&mtx);
        printf(BLUE_TEXT"reader (%d) takes turn\n"RESET_TEXT, reader_thread[i].thread_id);
        n_reader++;
        if(n_reader == 1) { 
            printf(BLUE_TEXT"reader (%d) blocks write\n"RESET_TEXT, reader_thread[i].thread_id);
            mythreads_sem_down(&wrt);
        }
        mythreads_sem_up(&mtx);
        sleep(1);
        if(count == limit){
            printf(BLUE_TEXT"Exit (%d) reader\n"RESET_TEXT, reader_thread[i].thread_id);
            break;
        }
        printf(BLUE_TEXT"count = %d (%d)\n"RESET_TEXT, count, reader_thread[i].thread_id);
        mythreads_sem_down(&mtx);
        n_reader--;
        if(n_reader == 0) {
            printf(BLUE_TEXT"reader (%d) unblocks write\n"RESET_TEXT, reader_thread[i].thread_id);
            mythreads_sem_up(&wrt);
        }
        mythreads_sem_up(&mtx);
    }
}

void writer(void *arg) {
    while(1) {
        sleep(4);
        printf(RED_TEXT"Write blocks\n"RESET_TEXT);
        mythreads_sem_down(&wrt);
        printf(RED_TEXT"Write takes turn\n"RESET_TEXT);
        count++;
        printf(RED_TEXT"Writer makes count %d\n"RESET_TEXT, count);
        if(count == limit) {
            printf(RED_TEXT"Exit writer\n"RESET_TEXT);
            break;
        }
        mythreads_sem_up(&wrt);
    }
    mythreads_sem_up(&wrt);
}

int main(int argc, char* argv[]) {
    int i;
    int n = atoi(argv[1]);
    limit = atoi(argv[2]);
    mythreads_init();
    mythreads_sem_create(&wrt, 1);
    mythreads_sem_create(&mtx, 1);
    srand(time(NULL));

    reader_thread = (struct thr_t *)malloc(sizeof(struct thr_t) * n);

    mythreads_create(&writer_thread, writer, NULL);
    for(i = 0; i < n; i++) {
        mythreads_create(&reader_thread[i], reader, (void *)i);
    }

    mythreads_join(&writer_thread);
    for(i = 0; i < n; i++) {
        mythreads_join(&reader_thread[i]); 
        mythreads_destroy(&reader_thread[i]);
    }

    mythreads_destroy(&writer_thread);
    mythreads_sem_destroy(&wrt);
    mythreads_sem_destroy(&mtx);

    return 0;
}

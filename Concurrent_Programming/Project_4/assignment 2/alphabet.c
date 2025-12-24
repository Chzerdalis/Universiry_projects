#include "ask2.c"
sem_t sem1;
void alphabet_worker (void *args );

int main(int argc, char *argv[]) {
    int delay1, delay2, delay3;
    struct thr_t **thread_array;
    delay1 = 5;
    delay2 = 10;
    delay3 = 40;

    // In this example we are going to use 3 threads so we malloc x3
    thread_array = malloc(3*sizeof(struct thr_t *));
    // thread_array[0] = &ga;
    mythreads_init();
    mythreads_sem_create(&sem1, 1);
    // In order to test the threads created we will create two or more functions  
    //print letters alphabetically and as an argument they receive the delay between prints
    thread_array[1] = malloc(sizeof(struct thr_t));
    mythreads_create(thread_array[1], alphabet_worker, &delay1);
    thread_array[2] = malloc(sizeof(struct thr_t));
    mythreads_create(thread_array[2], alphabet_worker, &delay2);
    thread_array[3] = malloc(sizeof(struct thr_t));
    mythreads_create(thread_array[3], alphabet_worker, &delay3);

    mythreads_join(thread_array[1]);
    mythreads_join(thread_array[2]);
    mythreads_join(thread_array[3]);
    printf("everything finished !\n"); 
    mythreads_destroy(thread_array[1]);
    printf("first thread destroyed!\n"); 
    mythreads_destroy(thread_array[2]);
    printf("second thread destroyed\n"); 
    mythreads_destroy(thread_array[3]);
    printf("third thread destroyed\n"); 
    mythreads_sem_destroy(&sem1);

    printf("all done bye bye!\n"); 
    return 0;
}

void alphabet_worker (void *args ) {
    int i, *delay, thread;
    delay = args;
    thread = current_thread->thread_id;
    char character = 'a';
    printf("i am thread %d and i have delay %d\n", thread, *delay);
    for (i = 0; i < 25; i ++) {
        usleep(100000*(*delay));
        // sleep(delay);
        mythreads_sem_down(&sem1);
        if (i == 10) {
            printf("thread %d locking to print\n", thread);
            for(;i < 15; i++) {
                usleep(100000*(*delay));
                printf("thread %2.d print:%c\n", thread, character+i);
            }
        }
        else {
            printf("thread %2.d print:%c\n", thread, character+i);
        }
        mythreads_sem_up(&sem1);
        if (i == 15) {
            printf("thread %d unlocking\n", thread);
        }
    }
    mythreads_return(current_thread);
}
#include "ask2.h"

void alphabet_worker(void *args);
void timer_handler(int signum);
void mythreads_return();
int mycoroutines_init(co_t *main_co);
int mycoroutines_create(co_t *co, void (*body)(void*), void *arg);
int mycoroutines_switchto(co_t *co_sig, co_t *co_switch);
int mycoroutines_destroy(co_t *co);

struct thr_t *current_thread, *main_thread; 
int threads_created;
co_t my_return;

unsigned int timer_interval = 15; // in decaseconds
struct itimerval timer;
struct sigaction sa;
// Signal handler for timer/alarm

// Simple main initialization
int mycoroutines_init(co_t *main_co) {
    if (getcontext(&main_co->context) == -1 ) {
        return (-1);
    }
    return (0);
}

//Create and initialize a coroutine
int mycoroutines_create(co_t *co, void (*body)(void*), void *arg) {
    if (getcontext(&co->context) == -1 ) {
        return (-1);
    }
    //when a thread finishes execution return thread takes turn
    co->context.uc_link = &my_return.context;
    co->context.uc_stack.ss_sp = malloc(STACK_SIZE);
    co->context.uc_stack.ss_size = STACK_SIZE;
    makecontext(&co->context, (void (*)(void))body, 1, arg);
    return (0);
}

int mycoroutines_switchto(co_t *co_sig, co_t *co_switch){
    
    current_thread = current_thread->next_thread;
    if ( swapcontext(&co_sig->context, &co_switch->context) == -1 ) {
        return (-1);
    }
    return (0);
}

int mycoroutines_destroy(co_t *co) {
    free(co->context.uc_stack.ss_sp);
    free(co);
    return (0);
}

// Initialize the timer and set the signal handler
int mythreads_init() {
    int  decaseconds = 0, seconds = 0;
    double division,temp;

    //init main thread
    main_thread= malloc(sizeof(struct thr_t));
    main_thread->co = malloc(sizeof(co_t));
    threads_created = 1;
    if ( mycoroutines_init(main_thread->co) == -1 ) {
        return(-1);
    }
    main_thread->next_thread = main_thread;
    main_thread->previous_thread = main_thread;
    main_thread->thread_id = 0;
    current_thread = main_thread;
    main_thread->critical_segment = 0;
    //init return coroutine
    mycoroutines_create(&my_return, mythreads_return, NULL);

    //Initialize timer
    if (sigemptyset(&sa.sa_mask) == -1 ) {
        return(-1);
    }
    sa.sa_flags = 0;
    sa.sa_handler = &timer_handler;
    if (sigaction(SIGALRM, &sa, NULL) == -1 ) {
        return (-1);
    }

    // Configure the timer to expire every 'timer_interval' seconds
    if (timer_interval > 10) {
        division = (double)timer_interval / 10;
        decaseconds = modf(division, &temp) * 10;
        seconds = temp;
    }
    else {
        decaseconds = timer_interval;
    }
    printf("seconds are %d and deca are %d\n", seconds, decaseconds);
    timer.it_value.tv_sec = seconds;
    timer.it_value.tv_usec = 100000*decaseconds;
    timer.it_interval.tv_sec = seconds;
    timer.it_interval.tv_usec = 100000*decaseconds;

    // Start the timer
    if ( setitimer(ITIMER_REAL, &timer, NULL) == -1 ) {
        return(0);
    }

    return 0;
}

// Signal handler for timer/alarm
void timer_handler(int signum) {
    printf("I AM TIMER \n");
    if (current_thread->critical_segment == 0) {
        mythreads_yield(); // Voluntarily yield control to another thread
    }
}

//When a thread finishes it removes it from the list
void mythreads_return() {
    current_thread->critical_segment = 1;
    
    current_thread->next_thread->previous_thread = current_thread->previous_thread;
    current_thread->previous_thread->next_thread = current_thread->next_thread;
    current_thread->thread_id = -1;

    current_thread->critical_segment = 0;
    mythreads_yield();
}

// Voluntarily yield control to another thread
int mythreads_yield() {
    current_thread->critical_segment = 1;
    
    if (mycoroutines_switchto(current_thread->co, current_thread->next_thread->co) == -1) {
        return (-1);
    }
    current_thread->critical_segment = 0;
    return 0;
} 

// Create a new thread
int mythreads_create(struct thr_t *thread, void (*body)(void *), void *arg) {

    thread->critical_segment = 1;

    thread->co = malloc(sizeof(co_t));
    thread->next_thread = main_thread;
    thread->previous_thread = main_thread->previous_thread;
    main_thread->previous_thread->next_thread = thread;
    main_thread->previous_thread = thread;
    thread->thread_id = threads_created++;
    if (mycoroutines_create(thread->co, body, arg) == -1 ) {
        return (-1);
    }
    thread->critical_segment = 0;
    return 0;
}

// Wait for the specified thread to terminate
int mythreads_join(struct thr_t *thread) {
    
    while (thread->thread_id > 0 ) {
        if (mythreads_yield() == -1) {
            return (-1);
        }
    }
    return 0;
}

// Destroy a thread
int mythreads_destroy(struct thr_t *thread) {
    if (thread->thread_id == 0 ) {
        timer.it_value.tv_sec = 0;
        timer.it_value.tv_usec = 0;
        if (setitimer(ITIMER_REAL, &timer, NULL) == -1) {
            return (-1);
        }
        free(main_thread->co);
        free(main_thread);
        current_thread=NULL;
    }
    else {
        if (mycoroutines_destroy(thread->co) == -1) {
            return (-1);
        }
    }
    return 0;
}

// Create and initialize a semaphore
int mythreads_sem_create(sem_t *s, int val) {
    if (val != 1 && val != 0) {
        return (-1);
    }
    s->value = val;
    return 0;
}

// Decrease the semaphore value
int mythreads_sem_down(sem_t *s) {
    current_thread->critical_segment = 1;
    // Wait until the semaphore value is positive
    while (s->value <= 0) {
        current_thread->critical_segment = 0;
        if (mythreads_yield() == -1) {
            return (-1);
        }
        current_thread->critical_segment = 1;
    }
    s->value--;
    current_thread->critical_segment = 0;
    return 0;
}

// Increase the semaphore value
int mythreads_sem_up(sem_t *s) {
    current_thread->critical_segment = 1;
    if (s->value == 1) {
        return 0;
    }
    else {
        s->value = 1;
    }
    current_thread->critical_segment = 0;
    return 0;
}

// Destroy a semaphore
int mythreads_sem_destroy(sem_t *s) {
    // Nothing specific to destroy for this simple semaphore
    return 0;
}

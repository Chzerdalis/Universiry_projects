#include"ask1.h"

static int counter = 1;

int mysem_init(mysem_t* s,int n){ 
    if(s->init == true){ // Check if semaphore is aleady initialized  
        printf("Semaphore is already initialized\n");
        return (-1);
    }

    if(n > 1 || n < 0){ // Check if semaphore is Wrongly initialized 
        printf("Wrong itialization of semaphore :(\n");
        return (0);
    }
    pthread_mutex_init(&s->mutex,NULL);
    pthread_cond_init(&s->cond,NULL);
    pthread_mutex_lock(&s->mutex);

    s->val = n;
    s->id = counter;
    s->init = true;
    s->wait = 0;
    counter +=1;
    
    pthread_mutex_unlock(&s->mutex);
    return (1);
}

int mysem_up(mysem_t *s){
    if(s->init == false) {     
        printf("Semaphore with id: %d is not initialised :(\n", s->id);
        return(-1);
    }

    pthread_mutex_lock(&s->mutex); // Got into monitor section
    if(s->val == 1) {
        if(s->wait > 0){
            for(int i=0; i<s->wait; i++){
                pthread_cond_signal(&s->cond);   
            }
        }
        pthread_mutex_unlock(&s->mutex);
        return (0);
    }
    s->val++;
    s->wait -=1; // update variable responsible for waking up  
    
    pthread_cond_signal(&s->cond); // Signaling for up()
    
    
    
    pthread_mutex_unlock(&s->mutex); // Exiting monitor Section
    return (1);
}

int mysem_down(mysem_t *s){
    if(s->init == false){
        printf("Semaphore with id: %d is not initialised :(\n", s->id);
        return(-1);
    }

    pthread_mutex_lock(&s->mutex); // Entering Monitor section

    while (s->val == 0) { // Wait while semaphore is 0
        s->wait++; // Increment the wait counter
        pthread_cond_wait(&s->cond, &s->mutex); // Wait on condition variable
        s->wait--; // Decrement the wait counter
    }
    s->val--; // Decrement the semaphore value

    pthread_mutex_unlock(&s->mutex); // Exiting Monitor section
    return (1);
}

int mysem_destroy(mysem_t *s) {
    if((s->init == false) || (s->id > counter || s->id < 1 )) {
        printf("Semaphore with id: %d is not initialised or is already destroyed\n", s->id);
        return(-1);
    }
    pthread_mutex_lock(&s->mutex);
    if(s->wait != 0 ){
        for(int i=0; i<s->wait; i++){
            pthread_cond_signal(&s->cond); // wake threads waiting 
        }
    }
    pthread_mutex_unlock(&s->mutex);
    pthread_cond_destroy(&s->cond);
    pthread_mutex_destroy(&s->mutex);
    s->init = false;
    
    return (1);
}

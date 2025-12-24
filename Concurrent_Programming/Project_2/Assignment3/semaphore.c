#include "semaphore.h"

int mysem_init(mysem_t *s,int n){
    key_t sem_key;
    int proj_id;
    char filename[256];

    // If semaphore is already initialized return;
    if (s->init == true){
        //printf("sem already initialized\n");
        return(-1);
    }
    // If n != 1 or 0 return;
    else if(n != 1 && n != 0){
        //printf("give correct n\n");
        return 0;
    }    
    // Create and initialize semaphore
    else {
        if ( getcwd(filename, sizeof(filename)) == NULL) {
            perror("cant get file path :");
            exit(0);
        }
        //get random number and create unique key for the semaphore
        srand(time(NULL));
        do {
            proj_id = rand()%100 + 1;
            sem_key = ftok(filename, proj_id);
            if (sem_key == -1) {
                perror("sem_key is negative :");
            }
            errno = 0;
            s->sem_id = semget(sem_key, 1, IPC_CREAT | IPC_EXCL | S_IRWXU);
            if (s->sem_id < 0 ) {
                // perror("i am erroring because :");
                // printf("Error number: %d...trying again\n", errno);
                usleep(5000);
            }
        } while(errno == EEXIST);
        
        if (s->sem_id == -1) {
            perror("Error creating semaphore :");
            exit(EXIT_FAILURE);
        }
        if (semctl(s->sem_id, 0, SETVAL , n) == -1) {
            perror("Error initializing semaphore :");
            exit(EXIT_FAILURE);
        }
        s->init = true;
    return(1);
    //printf("sem initialized\n");
    }
    return (-1);
}

int mysem_down(mysem_t *s){
    struct sembuf op;

    if(s->init == false){
        //printf("sem not initialized\n");
        return(-1);
    }

    op.sem_num = 0; op.sem_op = -1; op.sem_flg = 0;
    if (semop(s->sem_id, &op, 1) == -1) {
        perror("Error decreasing semaphore :");
        exit(EXIT_FAILURE);
    }
    return(1);
}

int mysem_up(mysem_t *s){
      struct sembuf op;

    //If semaphore isnt initialised return
    if(s->init == false){
        //printf("sem not initialized\n");
        return(-1);
    }
    // if semaphore is already 1 return 0.
    else if(semctl(s->sem_id, 0, GETVAL) == 1){
        //printf("special condition: calling up while sem is already 1\n");
        return(0);
    }
    op.sem_num = 0; op.sem_op = 1; op.sem_flg = 0;
    if (semop(s->sem_id, &op, 1) == -1) {
        perror("Error increasing semaphore :");
        exit(EXIT_FAILURE);
    }
    return 1;
}

int mysem_destroy(mysem_t* s) {
    if (s->init == false) {
        //printf("Semaphore not initialized or already removed\n");
        return -1;
    }

    errno = 0;
    if (semctl(s->sem_id, 0, IPC_RMID) == -1) {
        perror("Error removing semaphore");
        return -1;
    }

    s->sem_id = -1;
    s->init = false;

    //printf("Semaphore successfully destroyed\n");

    return 1;
}
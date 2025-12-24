#include"semaphore.h"

// sem.o: semaphore.c semaphore.h
	// $(CC) $(CFLAGS) -c semaphore.c 

int mysem_init(mysem_t *s,int n){
    key_t sem_key;
    int proj_id;
    
    // If semaphore is already initialized return;
    if (s->init == true){
        printf("sem already initialized\n");
        return(-1); // Case if semaphore is already initialized
    }
    // If n != 1 or 0 return;
    else if(n != 1 && n != 0){
        printf("give correct n\n");
        return 0;
    }    
    // Create and initialize semaphore
    else {
        //get random number and create unique key for the semaphore
        do {
            srand(time(NULL));
            proj_id = rand()%100 + 1;
            sem_key = ftok(filename, proj_id);
           if (sem_key == -1) {
            perror("fucking keus ");
           }
            printf("filename is %s\n and key is %d\n", filename, sem_key);
            errno = 0;
            s->sem_id = semget(sem_key, 1, IPC_CREAT | IPC_EXCL | S_IRWXU);
            if (s->sem_id < 0 ) {
                perror("i am erroring because :");
                printf("Error number: %d\n", errno);
                sleep(1);
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
    printf("sem initialized\n");
    }
}
int mysem_down(mysem_t *s){
    struct sembuf op;

    if(s->init == false){
        printf("sem not initialized\n");
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
        printf("sem not initialized\n");
        return(-1);
    }
    // if semaphore is already 1 return 0.
    else if(semctl(s->sem_id, 0, GETVAL) == 1){
        printf("eidikh periptwsh kanoyme up enw to semaphore einai 1\n");
        return(0);
    }

    op.sem_num = 0; op.sem_op = 1; op.sem_flg = 0;
    if (semop(s->sem_id, &op, 1) == -1) {
        perror("Error increasing semaphore :");
        exit(EXIT_FAILURE);
    }
    return 1;
}
int mysem_destroy(mysem_t*s){
    if (s->init == false) {
        printf("semaphore not initialized or already removed\n");
        return(-1);
    }
    errno = 0;
    semctl(s->sem_id, 0, IPC_RMID);
    if (errno == EIDRM) {
        printf("semaphore already removed :)\n");
        return (-1);
    }
    s->sem_id = -1;
    s->init = false;

    return(1);
}

int main(int argc,char *argv[]){
    mysem_t *sem;
    int func = 0;
    int n, i, semsum = 1;
    sem = (mysem_t*)malloc(sizeof(mysem_t));
    sem->init = false;
    errno = 0;
    perror("gey ");
    printf("what do you want to do ?\ninit : 0\ndown: 1\nup: 2\ndestroy: 3\ncreate: 4\n\n");
    scanf("%d",&func);
while (func != -1) {
    switch (func)
    {
        //mysem_init(*s, n)
    case 0:
        printf("which semaphore init bitch ? \n");
        scanf("%d", &i);
        printf("give init value : 0 or 1\n");
        scanf("%d", &n);
        if (mysem_init(&sem[i], n) == 1) {
        }
        break;
        // mysem_down(*s)
    case 1:
        printf("which semaphore minus bitch ? \n");
        scanf("%d", &n);
        mysem_down(&sem[n]);
        break;
        // mysem_up(*s)
    case 2:
        printf("which semaphore up bitch ? \n");
        scanf("%d", &n);
        mysem_up(&sem[n]);
        break;
        // mysem_destroy(*s)
    case 3:
        printf("which semaphore destroy bitch ? \n");
        scanf("%d", &n);
        if (mysem_destroy(&sem[n]) == 1 ) {
            // semsum--;
        }
        break;
        //create semaphore
    case 4:
        sem = (mysem_t*)realloc(sem, sizeof(mysem_t) * semsum);
        sem[semsum-1].init = false;
        sem[semsum-1].sem_id = -1;
        semsum++;

        printf("semaphore %d created\n", semsum-1);
        break;
    default:
        printf("eisai autismos\n");
        break;
    }
    for (i = 0; i < semsum -1; i++) {
        printf("\n");
        if (sem[i].init == true) {
            printf("semaphore |%d| has a value of |%d|\n", i, semctl(sem[i].sem_id, 0, GETVAL));
        }
        else  {
            printf("semaphore |%d| has been destroyed or hasnt been initialized\n", i); 
        }
    }
     printf("\n\ngive me another func boy\ninit : 0\ndown: 1\nup: 2\ndestroy: 3\ncreate: 4\n\n");
     scanf("%d", &func);   


    }
    for (i = 0 ; i < semsum; i++) {
        if (sem[i].init == true) {
            errno = 0;
            semctl(sem[i].sem_id, 0, IPC_RMID);
            perror("removed ? ");
        }
            
    }
    free(sem);
    return 0;
}
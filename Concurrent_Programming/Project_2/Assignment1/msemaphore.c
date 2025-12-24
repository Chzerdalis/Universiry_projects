#include "semaphore.h"

int mysem_init(mysem_t *s, int n) {
    key_t key;

    if(s->init == true) {return (-1);}
    if(n != 0 && n != 1) {return (0);}

    //geting key
    count += count;
    key = ftok(filename, count);
    s->sem_id = semget(key, 1, IPC_CREAT | IPC_EXCL | S_IRWXU);
    s->init = true;
    return(1);
}

int mysem_down(mysem_t *s) {
    struct sembuf op;

    if(s->init == false) { return (-1);}

    op.sem_num = 0; op.sem_op = -1; op.sem_flg = 0;
    semop(s->sem_id, &op, 1);
    
    return 1;
}

int mysem_up(mysem_t *s) {
    struct sembuf op;

    if(s->init == false) { return (-1);}

    if(semctl(s->sem_id, 0, GETVAL) == 1) {return(0);}

    op.sem_num = 0; op.sem_op = 1; op.sem_flg = 0;
    semop(s->sem_id, &op, 1);

    return(1);
}

int mysem_destroy(mysem_t *s) {
    if(s->init == false) { return (-1);}

    errno = 0;
    semctl(s->sem_id, 0, IPC_RMID);
    if(errno == EIDRM) {
        return(-1);
    }
    s->sem_id = -1;
    s->init = false;
    return (1);
}


int main() {
    
    
    
    
    return 0;
}
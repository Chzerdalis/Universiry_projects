#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<stdbool.h>
#include <unistd.h>

typedef struct {
    int index;
    unsigned int num;
    bool thread_available;
    bool terminate;
}info_t;

int isPrime(int n) {
	if (n == 2 || n == 3)
		return 1;

	if (n <= 1 || n % 2 == 0 || n % 3 == 0)
		return 0;

	// To check through all numbers of the form 6k Â± 1
	for (int i = 5; i * i <= n; i += 6) {
		if (n % i == 0 || n % (i + 2) == 0)
			return 0;
	}
	return 1;
}

void *worker_thread(void *arg){
    info_t *inf = (info_t *)arg;
    int res;
    //stays live until termination
    while(1) {
        if(inf->thread_available == false) {
            res = isPrime(inf->num);
            if(res == 0){
                printf("0\n");
            }
            else{
                printf("1\n");
            }
            inf->thread_available = true;
        }
        if(inf->terminate == true) break;
    }
    return(NULL);
}

int main(int argc,char *argv[]){
    int num_workers = atoi(argv[1]);
    pthread_t thread[num_workers];
    int number;
    int counter;
    info_t *info;

    info = (info_t *)malloc(sizeof(info_t)*num_workers);

    if(info == NULL) exit(-1);

    //opens and initialises N threads
    for(counter = 0; counter < num_workers; counter++) {
        info[counter].index = counter;
        info[counter].num = 0;
        info[counter].thread_available = true;
        info[counter].terminate = false;
        pthread_create(&thread[counter],NULL,&worker_thread,(void *)&info[counter]);
    }
    //reads number until given -1 and assign to available thread
    while(1) {
        scanf("%d", &number);

        if (number == -1) {
            //terminates
            for(counter = 0; counter < num_workers; counter++) {
                info[counter%num_workers].terminate = true;
    
            }
            free(info);
            return 0;
        }

        //constantly checks for available thread
        bool br = false;
        for(counter = 0; br == false; counter++) {
            if(info[counter%num_workers].thread_available == true) {
                info[counter%num_workers].num = number;
                info[counter%num_workers].thread_available = false;
                br = true;
            }
        }
    }
}

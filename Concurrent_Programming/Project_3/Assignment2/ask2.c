#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<stdbool.h>
#include<unistd.h>

bool terminate;
pthread_mutex_t mutex;
pthread_cond_t condition;
int count = 0, terminated = 0;
int option = 0;

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
    int res;
    int prime;
    //stays live until termination
    while(1) {

        pthread_mutex_lock(&mutex);
        while(count == 0 && terminate != true) {
            pthread_cond_signal(&condition);
            pthread_cond_wait(&condition, &mutex);
        }
        if(terminate == true) break;
        prime = *(int *)arg;
        count -= 1;
        pthread_cond_signal(&condition);
        pthread_mutex_unlock(&mutex);

        res = isPrime(prime);
        if(res == 0){
            if(option == 0){
                printf("0\n");
            }else {
                printf("thread:%ld result:0 number:%d\n", pthread_self(), prime);
            }
        }
        else{
            if(option == 0){
                printf("1\n");
            }else {
                printf("thread:%ld result:1 number:%d\n", pthread_self(), prime);
            }
        }
    }
    terminated += 1;
    pthread_mutex_unlock(&mutex);
    return(NULL);
}

int main(int argc,char *argv[]){
    int num_workers = atoi(argv[1]);
    pthread_t thread[num_workers];
    int number = 0;
    int counter;

    option = atoi(argv[2]);
    
    pthread_mutex_init(&mutex, NULL);
    pthread_cond_init(&condition, NULL);

    //opens and initialises N threads
    for(counter = 0; counter < num_workers; counter++) {
        pthread_create(&thread[counter],NULL,&worker_thread,(void *)&number);
    }

    //reads number until given -1 and assign to available thread
    while(1) {
        pthread_mutex_lock(&mutex);
        while(count == 1) {
            pthread_cond_signal(&condition);
            pthread_cond_wait(&condition, &mutex);
        }

        scanf("%d", &number);
        count += 1;

        if (number == -1) {
            terminate = true;
            
            while(terminated != num_workers) {
                pthread_cond_signal(&condition);
                pthread_mutex_unlock(&mutex);
                pthread_mutex_lock(&mutex);
            }
            return 0;
        }
        pthread_mutex_unlock(&mutex);
    }
}

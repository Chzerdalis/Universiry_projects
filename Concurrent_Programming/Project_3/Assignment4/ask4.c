#include <stdio.h>
#include <stdlib.h>
#include <pthread.h>
#include <stdbool.h>
#include <unistd.h>
#include <signal.h>

pthread_mutex_t mutex;
pthread_cond_t train_finish, train_wait;
int boarded;
bool end;

void *passenger_thread(void *args) {
    int *max_passenger = (int*)(args);
    
    // Get in line to board
    pthread_mutex_lock(&mutex);

    printf("i am getting in line\n");

    //if signaled to board but passengers have not exited wait
    while(boarded == *max_passenger){

        // unlock mutex until train is able to unlock and remove passengers
        printf("have to unblock train\n");
        pthread_mutex_unlock(&mutex);
        sleep(1);
        pthread_mutex_lock(&mutex);
    }
    // Board normally
    if(boarded < *max_passenger -1) {
        printf("\nboarding\n\n");
        boarded++;

        // wait for the ride to finish
		pthread_cond_wait(&train_finish,&mutex);
    }
    // If you are the last passenger notify the train to start 
    else if(boarded == *max_passenger -1) {
        boarded++;
        printf("\ncaller is boarding\n\n");
        printf("\ncalled the train to start\n\n");
        pthread_cond_signal(&train_wait);
    }    
    pthread_mutex_unlock(&mutex);
    return NULL;
}

void *train_thread(void *args) {
    int i, k=0;
    while (1) {
        pthread_mutex_lock(&mutex);
        
        //wait while boarding
        boarded = 0;
        printf("train is waiting\n");
        pthread_cond_wait(&train_wait, &mutex);
         
        if (end == true) {
            printf("train broken\n");
            break;
        }

        //start the ride
        printf("ride started\n");
        sleep(5);
        k++;
        printf("ride %d ended \n", k);

        //passengers leaving the ride 
        for ( i = boarded; i > 0; i--) {
            pthread_cond_signal(&train_finish);
        }

        printf("train is ready\n");
        pthread_mutex_unlock(&mutex);
    }
    return NULL;
}


void cleanup() {
     // Free allocated resources or perform cleanup operations
    pthread_cond_broadcast(&train_finish);
    pthread_mutex_lock(&mutex);
    end = true; 
    pthread_mutex_unlock(&mutex);
    pthread_cond_signal(&train_wait);
    sleep(1);
}

void signalHandler(int signal) {
    // Handle signals if needed
    cleanup();
    exit(signal);
}

int main(int argc,char *argv[]){
    if (argc != 2) {
        printf("give correct args\n");
        return(0);
    }
    int max_passengers = atoi(argv[1]);
    if (max_passengers <= 0) {
        printf("train must hold at least one passenger\n");
        return(0);
    }
    int i, k, j, z, *spawn_number; 
    double *spawn_time;
    pthread_t train;
    pthread_t *passengers;

    spawn_time = (double*)malloc(sizeof(double));
    spawn_number = (int*)malloc(sizeof(int));
    
    //Gather passenger number and arrival time
    signal(SIGINT, signalHandler);
    signal(SIGTERM, signalHandler);
    printf("at which time intervals (decaseconds) should i spawn passengers and how many each time ?\n\n");
    i = 0;
    k = 0;
    while(1) {
        scanf("%le", &spawn_time[i]);
        if (spawn_time[i] == -1) {
            if (i == 0) {
                free(spawn_number);
                free(spawn_time);
                return(0);
            }
            break;
        }
        scanf("%d", &spawn_number[i]);
        if (spawn_number[i] < 0) {
            printf("passengers must be non-negative integer\n");
            return(0);
        }
        k += spawn_number[i]; 
        i++;
        spawn_time = (double *)realloc(spawn_time,sizeof(double)*(1+i));
        spawn_number = (int *)realloc(spawn_number,sizeof(int)*(1+i));
    }
    if (k == 0) {
        printf("no passengers will arrive\n");
        return(0);
    }
    printf("total passengers are %d\n", k);
    //initialize the mutexes and conditions we are using
    boarded = 0;
    pthread_mutex_init(&mutex,NULL);
	pthread_cond_init(&train_wait,NULL);
    pthread_cond_init(&train_finish,NULL);

    //Make the train and start creating the passengers
    end = false;
    passengers = (pthread_t *)malloc(sizeof(pthread_t)*k);
    pthread_create(&train,NULL,&train_thread,(void *)&end);
    
    z = 0;
    for (k = 0; k < i; k++) {
        usleep(spawn_time[k]*100000);
        printf("spawning %d at %.2fs\n", spawn_number[k], (spawn_time[k]/10));
        for (j = 0; j < spawn_number[k]; j++) {
            pthread_create(&passengers[z+j], NULL, &passenger_thread, &max_passengers);
        }
        z += j;
    }
    pthread_join(train, NULL);
    return (0);
}
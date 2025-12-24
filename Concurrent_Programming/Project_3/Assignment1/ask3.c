#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include"ask1.h"
#include<assert.h>

#define RED_TEXT "\033[1;31m"
#define BLUE_TEXT "\033[1;34m"
#define RESET_TEXT "\033[0m"
#define BLACK_TEXT "\033[32m"
#define YELLOW_TEXT "\033[33m"

int car_counter = 0, car_on_brige = 0;
bool red_turn = false, blue_turn = false;
int max_cars, total_cars = 0, help = 0, t1, t2, iterations, i;
mysem_t full, empty;
mysem_t s_blue,s_red;
pthread_mutex_t mutex;

//function that emulates brige
void *consumer(void *arg){
    while(total_cars != 0){    
        usleep(500);

        pthread_mutex_lock(&mutex);
        printf("Attempt consume\n");
        //car_counter helps us synchronize the threads
        --car_counter;
        //stops the consumer when there are no cars left
        --total_cars;

        //empty
        if(car_counter == -1) {

            if(blue_turn == true) {
                blue_turn = false;
                mysem_down(&s_blue);
                mysem_up(&s_red);
            }else if(red_turn == true){
                red_turn = false;
                mysem_down(&s_red);
                mysem_up(&s_blue);
            }
            printf("UNBLOCKS RED AND BLUE\n");

            pthread_mutex_unlock(&mutex);
            printf(YELLOW_TEXT"BLOCKS EMPTY\n"RESET_TEXT);
            mysem_down(&empty);
            pthread_mutex_lock(&mutex);

            printf("BACK TO CONSUMER\n");
            car_counter--;
            //special case when is blocked empty but blocked full also
            if(car_counter >= 1 && max_cars == 1){
                printf(BLACK_TEXT"UNBLOCKS FULL\n"RESET_TEXT);
                mysem_up(&full);
            }
        //empty special case when brige length is 1
        }else if(car_counter == help - 1 && max_cars == 1){

            if(blue_turn == true) {
                blue_turn = false;
                mysem_down(&s_blue);
                mysem_up(&s_red);
            }else if(red_turn == true){
                red_turn = false;
                mysem_down(&s_red);
                mysem_up(&s_blue);
            }

            pthread_mutex_unlock(&mutex);
            printf(YELLOW_TEXT"BLOCKS empty\n"RESET_TEXT);
            mysem_down(&empty);
            pthread_mutex_lock(&mutex);
            printf("BACK TO CONSUMER\n");

            car_counter--;
        //brige is full
        }else if(car_counter > max_cars - 1) {

            printf(BLACK_TEXT"UNBLOCKS full\n"RESET_TEXT);
            mysem_up(&full);
        }

        printf("ONE got out\n");
        help = car_counter;
        printf("Cars in brige [%d]\n", --car_on_brige);
        pthread_mutex_unlock(&mutex);

    }      
    return NULL;
}

void *producer_blue(void *arg){      
        
    pthread_mutex_lock(&mutex);
    printf(BLUE_TEXT"ATTEMPT FOR BLUE\n"RESET_TEXT);

    //synchronization of cars 
    if(red_turn == true) {
        pthread_mutex_unlock(&mutex);
        printf(BLUE_TEXT"BLOCKS BECAUSE RED ALREADY IN\n"RESET_TEXT);
        mysem_down(&s_blue);
        pthread_mutex_lock(&mutex);
        printf(BLUE_TEXT"BLUE TAKES TURN\n"RESET_TEXT);
    }
    mysem_up(&s_blue);
    blue_turn = true;
    //
    ++car_counter;
    //if is full
    if(car_counter > max_cars){

        pthread_mutex_unlock(&mutex);
        printf(BLACK_TEXT"BLOCKS FULL BLUE\n"RESET_TEXT);
        mysem_down(&full);
        pthread_mutex_lock(&mutex);
        printf(BLUE_TEXT"BACK TO BLUE AFTER UNBLOCK\n"RESET_TEXT);

    }
    //if is empty
    if(car_counter == 0){
        printf(YELLOW_TEXT"UNBLOCKS EMPTY BLUE\n"RESET_TEXT);
        car_counter++;
        mysem_up(&empty);
    }

    printf(BLUE_TEXT"blue got in\n"RESET_TEXT);
    help = 0;
    printf("Cars in brige [%d]\n", ++car_on_brige);
    pthread_mutex_unlock(&mutex);
    
    return NULL;
}

void *producer_red(void *arg){       
       
    pthread_mutex_lock(&mutex);
    printf(RED_TEXT"ATTEMPT FOR RED\n"RESET_TEXT);

    //synchronization of cars
    if(blue_turn == true) {
        pthread_mutex_unlock(&mutex);
        printf(RED_TEXT"BLOCKS BECAUSE BLUE ALREADY IN\n"RESET_TEXT);
        mysem_down(&s_red);
        pthread_mutex_lock(&mutex);
        printf(RED_TEXT"RED TAKES TURN\n"RESET_TEXT);
    }
    mysem_up(&s_red);
    red_turn = true;
    //
    ++car_counter;
    //if is full
    if(car_counter > max_cars){

        pthread_mutex_unlock(&mutex);
        printf(BLACK_TEXT"BLOCKS FULL RED\n"RESET_TEXT);
        mysem_down(&full);
        pthread_mutex_lock(&mutex);
        printf(RED_TEXT"BACK TO RED AFTER UNBLOCK\n"RESET_TEXT);

    }
    //is its empty
    if(car_counter == 0){
        printf(RED_TEXT"UNBLOCKS EMPTY RED\n"RESET_TEXT);
        car_counter++;
        mysem_up(&empty);
    }

    printf(RED_TEXT"red got in\n"RESET_TEXT);
    help = 0;
    printf("Cars in brige [%d]\n", ++car_on_brige);
    pthread_mutex_unlock(&mutex);
    
    return NULL;
}

int main(int argc,char *argv[]){

    if(argc != 5){
        exit(-1);
    }
    pthread_t *red_car,*blue_car;
    pthread_t consumer_thread;
    printf("initializing semaphores...\n\n");
    mysem_init(&full,0);
    mysem_init(&s_blue,0);
    mysem_init(&s_red,0);
    mysem_init(&empty,0);
    pthread_mutex_init(&mutex,NULL);
    printf("ready...\n\n");
    
    max_cars = atoi(argv[1]);
    iterations = atoi(argv[2]);
    t1 = atoi(argv[3]);
    t2 = atoi(argv[4]);
    total_cars = 2*iterations; 

    blue_car =(pthread_t *)malloc(sizeof(pthread_t) * iterations);
    assert(blue_car != NULL);
    red_car = (pthread_t *)malloc(sizeof(pthread_t) * iterations);
    assert(red_car != NULL);

    pthread_create(&consumer_thread,NULL,&consumer,NULL);

    for(i = 0; i < iterations; i++){
        usleep(t2);
        pthread_create(&red_car[i],NULL,&producer_red,NULL);
        usleep(t1);
        pthread_create(&blue_car[i],NULL,&producer_blue,NULL);
    }

    for(i = 0; i < iterations; i++){
        pthread_join(blue_car[i],NULL);
    }
    for(i = 0; i < iterations; i++){
        pthread_join(red_car[i],NULL);
    }
    pthread_join(consumer_thread,NULL);

    free(red_car);
    free(blue_car);
    red_car = NULL;
    blue_car = NULL;
    mysem_destroy(&full);
    mysem_destroy(&empty);
    mysem_destroy(&s_blue);
    mysem_destroy(&s_red);
    pthread_mutex_destroy(&mutex);
    
    return 0;
}
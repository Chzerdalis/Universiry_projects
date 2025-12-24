#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<stdbool.h>
#include<assert.h>
#include<unistd.h>

#define RED_TEXT "\033[1;31m"
#define BLUE_TEXT "\033[1;34m"
#define RESET_TEXT "\033[0m"
#define BLACK_TEXT "\033[32m"
#define YELLOW_TEXT "\033[33m"

int car_counter = 0, car_on_brige = 0;
bool red_turn = false, blue_turn = false, full_again = false;
int max_cars, total_cars = 0, help = 0, t1, t2, iterations, i;
pthread_mutex_t mutex;
pthread_cond_t full, empty, s_blue, s_red;

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
                pthread_cond_signal(&s_red);
            }else if(red_turn == true){
                red_turn = false;
                pthread_cond_signal(&s_blue);
            }
            printf("UNBLOCKS RED AND BLUE\n");
            printf(YELLOW_TEXT"BLOCKS EMPTY\n"RESET_TEXT);
            pthread_cond_wait(&empty, &mutex);
            printf(YELLOW_TEXT"BACK TO CONSUMER\n"RESET_TEXT);

            car_counter--;
            //special case when is blocked empty but blocked full also
            if(car_counter >= max_cars){
                printf(BLACK_TEXT"UNBLOCKS FULL\n"RESET_TEXT);
                pthread_cond_signal(&full);
            }
        //empty special case when brige length is 1
        }else if(car_counter == help - max_cars){

            if(blue_turn == true) {
                blue_turn = false;
                pthread_cond_signal(&s_red);
            }else if(red_turn == true){
                red_turn = false;
                pthread_cond_signal(&s_blue);
            }
            printf("UNBLOCKS RED AND BLUE\n");
            printf(YELLOW_TEXT"BLOCKS empty\n"RESET_TEXT);
            pthread_cond_wait(&empty, &mutex);
            printf(YELLOW_TEXT"BACK TO CONSUMER\n"RESET_TEXT);

            car_counter--;
        //brige is full
        }else if(car_counter > max_cars - 1) {

            printf(BLACK_TEXT"UNBLOCKS full\n"RESET_TEXT);
            pthread_cond_signal(&full);
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
    while(red_turn == true) {
        printf(BLUE_TEXT"BLOCKS BECAUSE RED ALREADY IN\n"RESET_TEXT);
        pthread_cond_wait(&s_blue, &mutex);
        printf(BLUE_TEXT"BLUE TAKES TURN\n"RESET_TEXT);
    }
    pthread_cond_signal(&s_blue);
    blue_turn = true;
    //
    ++car_counter;
    //if is full
    full_again = true;
    while(car_counter > max_cars && full_again){
        printf(BLACK_TEXT"BLOCKS FULL BLUE\n"RESET_TEXT);
        pthread_cond_wait(&full, &mutex);
        if(car_on_brige == max_cars) {
            full_again = true;
        }else{
            full_again = false;
        }
        printf(BLUE_TEXT"BACK TO BLUE AFTER UNBLOCK\n"RESET_TEXT);
    }
    //if is empty
    if(car_counter == 0){
        printf(YELLOW_TEXT"UNBLOCKS EMPTY BLUE\n"RESET_TEXT);
        car_counter++;
        pthread_cond_signal(&empty);
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
    while(blue_turn == true) {
        printf(RED_TEXT"BLOCKS BECAUSE BLUE ALREADY IN\n"RESET_TEXT);
        pthread_cond_wait(&s_red, &mutex);
        printf(RED_TEXT"RED TAKES TURN\n"RESET_TEXT);
    }
    pthread_cond_signal(&s_red);
    red_turn = true;
    
    ++car_counter;
    full_again = true;
    //if is full
    while(car_counter > max_cars && full_again){
        printf(BLACK_TEXT"BLOCKS FULL RED\n"RESET_TEXT);
        pthread_cond_wait(&full, &mutex);
        if(car_on_brige == max_cars) {
            full_again = true;
        }else{
            full_again = false;
        }
        printf(RED_TEXT"BACK TO RED AFTER UNBLOCK\n"RESET_TEXT);
    }
    //is its empty
    if(car_counter == 0){
        printf(YELLOW_TEXT"UNBLOCKS EMPTY RED\n"RESET_TEXT);
        car_counter++;
        pthread_cond_signal(&empty);
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
    pthread_cond_init(&full, NULL);
    pthread_cond_init(&empty, NULL);
    pthread_cond_init(&s_blue,NULL);
    pthread_cond_init(&s_red,NULL);
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
    
    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&full);
    pthread_cond_destroy(&empty);
    pthread_cond_destroy(&s_blue);
    pthread_cond_destroy(&s_red);

    return 0;
}

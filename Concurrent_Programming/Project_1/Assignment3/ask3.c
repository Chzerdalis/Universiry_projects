#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<stdbool.h>
#include<unistd.h>
#include<string.h>
#include<math.h>

typedef struct {
    char* file_name;
    bool ready;
    int start, end;
    int number, depth;
}info_t;

void insertion_sort(int* arr, int n) {
    for (int i = 1; i < n; i++) {
        int tmp = arr[i];
        int j = i - 1;

    while (tmp < arr[j] && j >= 0) {
        arr[j + 1] = arr[j];
        --j;
    }
    arr[j + 1] = tmp;
  }
}

int leafs = 0;

int calc_leafs(int size) {
    int i;

    for(i = 0; size > 64; i++) {
        size = size/2;
    }

    return (pow(2, i));
}

void *External_merge(void *arg) {
    info_t *father = (info_t *)arg;
    int size, *buff;
    FILE *fp1, *fp2, *fp3;;
    info_t *child1, *child2;
    pthread_t *t1, *t2;
    int n1, n2, i, j;


    fp1 = fopen(father->file_name, "r+");
    if(fp1 == NULL) {
        printf("44[%s]\n", father->file_name);
        exit(1);
    }

    //sort in memory
    size = father->end - father->start;
    if(size <= 64) {
        buff = (int *)malloc(sizeof(int)*(size));
        if(buff == NULL) exit(-1);
        //reads the given 64 ints
        if(fseek(fp1, father->start*sizeof(int), SEEK_SET) == -1) exit(-1);
        fread(buff, sizeof(int), size, fp1);
        //sorts
        insertion_sort(buff, size);
        //overwrites the sorted ints
        if(fseek(fp1, father->start*sizeof(int), SEEK_SET) == -1) exit(-1);
        fwrite(buff, sizeof(int), size, fp1);

        fclose(fp1);
        free(buff);
        //shows that its done
        father->ready = true;
        return NULL;
    }
    fclose(fp1);
    //allocates mem for structs 
    child1 = (info_t*)malloc(sizeof(info_t));
    child2 = (info_t*)malloc(sizeof(info_t));
    t1 = (pthread_t*)malloc(sizeof(pthread_t));
    t2 = (pthread_t*)malloc(sizeof(pthread_t));
    if(child1 == NULL || child2 == NULL || t1 == NULL || t2 == NULL) exit(1);

    //initialize info for threads
    child1->file_name = father->file_name;
    child1->start = father->start;
    child1->end = (father->start + father->end)/2;
    child1->ready = false;
    child1->depth = father->depth + 1;
    child1->number = father->number;

    child2->file_name = father->file_name;
    child2->start = child1->end;
    child2->end = father->end;
    child2->ready = false;
    child2->depth = father->depth + 1;
    child2->number = father->number + (leafs/(pow(2, child2->depth)));

    pthread_create(t1,NULL,&External_merge,(void *)child1);
    pthread_create(t2,NULL,&External_merge,(void *)child2);
    
    //blocks until the treads finish
    while(child1->ready == false || child2->ready == false);
    
    //open help file and 2nd fp for original file
    fp1 = fopen(father->file_name, "r+");
    if(fp1 == NULL) {
        printf("7[%s]\n", father->file_name);
        exit(1);
    }

    char file_name[10];
    sprintf(file_name, "%d", father->number);
    fp2 = fopen(file_name, "w+");
    if(fp2 == NULL) {
        printf("5[%s]\n", father->file_name);
        exit(1);
    }

    fp3 = fopen(father->file_name, "r+");
    if(fp3 == NULL) {
        printf("6[%s]\n", father->file_name);
        exit(1);
    }

    if(fseek(fp2, 0, SEEK_SET) == -1) exit(-1);

    if(fseek(fp1, child1->start*sizeof(int), SEEK_SET) == -1) exit(-1);
    fread(&n1, sizeof(int), 1, fp1);

    if(fseek(fp3, child2->start*sizeof(int), SEEK_SET) == -1) exit(-1);
    fread(&n2, sizeof(int), 1, fp3);

    i = child1->start + 1;
    j = child2->start + 1;
    
    //sort the two parts of the file in the temp file
    while(i <= child1->end && j <= child2->end) {
        if(n1 < n2) {
            fwrite(&n1, sizeof(int), 1, fp2);
            fread(&n1, sizeof(int), 1, fp1);
            i++;
        }else{
            fwrite(&n2, sizeof(int), 1, fp2);
            fread(&n2, sizeof(int), 1, fp3);
            j++;
        }
    }
    while(i <= child1->end) {
        fwrite(&n1, sizeof(int), 1, fp2);
        fread(&n1, sizeof(int), 1, fp1);
        i++;
    }
    while(j <= child2->end) {
        fwrite(&n2, sizeof(int), 1, fp2);
        fread(&n2, sizeof(int), 1, fp3);
        j++;
    }

    //overwrite with the sorted form
    if(fseek(fp2, 0, SEEK_SET) == -1) exit(-1);
    if(fseek(fp1, father->start*sizeof(int), SEEK_SET) == -1) exit(-1);
    for(i = father->start; i < father->end; i++) {
        fread(&n1, sizeof(int), 1, fp2);
        fwrite(&n1, sizeof(int), 1, fp1);
    }

    fclose(fp1);
    fclose(fp2);
    fclose(fp3);
    remove(file_name);
    free(child1);
    free(child2);
    free(t1);
    free(t2);
    //shows taht its done
    father->ready = true;
    return NULL;
}

int main(int argc, char* argv[]) {
    info_t* start_arg;
    FILE* fp;

    fp = fopen(argv[1], "r");
    if(fp == NULL) exit(-1);
    if(fseek(fp, 0, SEEK_END) == -1) exit(-1);

    start_arg = (info_t*)malloc(sizeof(info_t));
    if(start_arg == NULL) exit(-1);
    //initialise first struct
    start_arg->file_name = argv[1];
    start_arg->start = 0;
    start_arg->end = ftell(fp) / sizeof(int);;
    start_arg->ready = false;
    start_arg->number = 0;
    start_arg->depth = 0;

    //calculates leafs
    leafs = calc_leafs(start_arg->end);

    External_merge((void*)start_arg);
    
    free(start_arg);
    fclose(fp);
    return 0;
}

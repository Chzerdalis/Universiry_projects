#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<stdbool.h>
#include <unistd.h>
#include <string.h>

int main() {
    int array[9] = {1, 3, 5, 7, 9, 2, 4, 6, 8};
    int rr[9] =    {1, 2, 3, 4, 5, 6, 7, 8, 9};
    FILE *fp1, *fp2;

    fp1 = fopen("test.bin", "w+");
    fwrite(array, sizeof(int), 9, fp1);
    fp2 = fopen("pp.bin", "w+");
    fwrite(rr, sizeof(int), 9, fp2);

    
    return 0;
}
#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<stdbool.h>
#include <unistd.h>

int main(int argc, char* arg[]) {
    int number, res, i = 0, j = 0;
    while(1) {
        res = scanf("%d\n", &number);
        if(res == -1) break;
        if(number == 1) {
            i++;
        }else{
            j++;
        }
    }
    printf("ones:%d zeros:%d\n", i, j);
    return 0;
}

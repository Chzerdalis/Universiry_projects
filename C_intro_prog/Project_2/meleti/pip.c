#include<stdio.h>

int main() {
    int d, res;
    do {
        res = scanf(" @%d", &d);
        printf("%d\n", d);
    }while(res == 1);
    return 0;
}
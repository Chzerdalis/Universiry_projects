#include <stdio.h>

int main(int argc, char *argv[]) {
    int i, res, sum = 0, j = 0;
    double avg;
    while(1) {
        res = scanf(" @ %d", &i);
        if(res != 1) break;
        sum += i;
        j++;
    }
    avg = (double)sum / j;
    printf("%lf\n", avg);
    return 0; 
}
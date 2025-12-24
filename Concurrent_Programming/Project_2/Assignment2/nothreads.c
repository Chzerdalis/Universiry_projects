#include<stdio.h>
#include<stdlib.h>
#include<pthread.h>
#include<stdbool.h>
#include <unistd.h>

int main() { 
    int n;
    while(1) {
        scanf("%d", &n);
        if(n == -1) break;
        if (n == 2 || n == 3) {
            printf("%d 1\n", n); 
        }else if (n <= 1 || n % 2 == 0 || n % 3 == 0) {
            printf("%d 0\n", n); 
        }
        // To check through all numbers of the form 6k Â± 1 
        for (int i = 5; i * i <= n; i += 6) { 
            if (n % i == 0 || n % (i + 2) == 0) 
                printf("%d 0\n", n); 
        }
        printf("%d 1\n", n);
    }
	return 1;
}
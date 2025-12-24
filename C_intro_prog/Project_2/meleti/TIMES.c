#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
    int i, j;

    for(i = 0, j = 0; i < atoi(argv[1]); i++, j++) {
        if(j == atoi(argv[2])) {
            printf("f %d\n", i);;
            j = 0;
        }
    }
    return 0;
}
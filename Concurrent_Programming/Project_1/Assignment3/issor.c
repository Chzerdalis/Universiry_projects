#include <math.h> 
#include <stdio.h> 
#include <time.h>
#include <stdlib.h>
#include<unistd.h>

int main(int argc, char* argv[]) {
    FILE* fd;
    int n1, n2;


    fd = fopen("rand.bin", "r+");
    fseek(fd, 0, SEEK_SET);
    fread(&n2, sizeof(int), 1, fd);
    n1 = n2;
    while(fread(&n2, sizeof(int), 1, fd)) {
        if(n2 < n1) {
            printf("NOT SORTED\n");
            return 0;
        }
    n1 = n2;
    }
    printf("SORTED\n");
    return 1;
}

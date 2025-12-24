#include <math.h> 
#include <stdio.h> 
#include <time.h>
#include <stdlib.h>
#include<unistd.h>

void print_file(char *s){
    FILE* fp = fopen(s,"r+");
    int buff;
    
    while(fread(&buff,sizeof(int),1,fp)){
        printf("%d\n",buff);
    }
}


int main(int argc, char* argv[]) {
    print_file(argv[1]);
    return 0;
}

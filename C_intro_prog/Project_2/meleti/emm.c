#include <stdio.h>
#include <string.h>
#include <stdlib.h>

typedef struct {
    char name[32];
    int times;
}gay;

int main() {
    char first[32], last[32], c;
    int a, b, size = 0, i, j = 0;
    gay *table = NULL;
    
    do{
        scanf(" %c %d %s %s %d", &c, &a, first, last, &b);
        if(c != 'a') {
            break;
        }
        for(i = 0; i < size; i++) {
            if(strcmp(last, table[i].name) == 0) {
                table[i].times++;
                j++;
            }
        }
        if(j == 0) {
            size++;
            table = (gay*)realloc(table, size * sizeof(gay));
            strcpy(table[size - 1].name, last);
            table[size - 1].times = 1;
        }else {
            j = 0;
        }
    } while(1);

    for(i = 0; i < size; i++) {
        if(table[i].times == 1) {
            printf("%s\n", table[i].name);
        }
    }
    return 1;
}
    

#include <math.h> 
#include <stdio.h> 
#include <time.h>
#include <stdlib.h>
#include<unistd.h>

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

// auto to meros kanei arxeio me tuxaious arithmous
void kanwArithmous(int n) {
    int randomNumber ;
    int i;
    FILE *fp1;

    fp1 = fopen("rand.bin", "wb");
    srand(time(NULL));

    for (i = 0; i < n; i++) {
        randomNumber = rand();
        fwrite(&randomNumber, sizeof(int), 1, fp1);
    }
    fclose(fp1);

    return;
}
// Driver code 
int main(int argc, char* argv[]) { 
    kanwArithmous(atoi(argv[1]));
    return 0;
}




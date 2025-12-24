#include"project1.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
int binary_search(int *list, const int aem, int start, int finish, int *comps);
int sort(int *a);

int main() {
    int a[] = {9645, 3847, 8934, 8465, 9999, 999, 10100, 3434, 6545};
    int res;
    int comps;
    comps = 0;
    res = sort(a);
    printf("%d\n", res);
    for(res = 0; res < 9; res++) {
        printf("%d ", a[res]);
    }printf("\n");
    res = binary_search(a, 3847, 0, 8, &comps);
    printf("%d, %d\n", res, comps);
}

int binary_search(int *list, const int aem, int start, int finish, int *comps) {
int middle;

  if(start <= finish) {
    middle = (finish - start) / 2 + start;
    printf("#%d#\n", middle);
    *comps = *comps + 1;
    if(list[middle] == aem) {
      return middle;
    }
    *comps = *comps + 1;
    if(list[middle] < aem) {
      return binary_search(list, aem, middle + 1, finish, comps);
    }

    return binary_search(list, aem, start, middle - 1, comps);
  }
  return -1;
}

int sort(int *a) {
    int i, j, key, comps = 0;

    for(i = 1; i < 9; i++) {
        key = a[i];
        j = i - 1;

        while(a[j] > key && j >= 0) {
            comps++;
            a[j + 1] = a[j];
            j = j - 1;
        }
        if(j>0)comps++;
        a[j+1] = key;
    }
    return comps;
}
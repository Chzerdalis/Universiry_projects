#include <stdio.h>

int main(int argc, char* argv[]) {
    char a[6];

    printf("%s ", argv[1]);
    scanf("%3s", a);
    printf("%s\n", a);
    return 1;
}

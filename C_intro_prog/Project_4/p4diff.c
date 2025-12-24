#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <fcntl.h>
#include <string.h>

int max(int a, int b) {
    if(a > b) {
        return a;
    }else {
        return b;
    }
}

int min(int a, int b) {
    if(a > b) {
        return b;
    }else {
        return a;
    }
}

int my_read(int fd, char* buffer, int size) {
    int bytes_read, total_bytes_read = 0;
    do{
        bytes_read = read(fd, &buffer[total_bytes_read], size - total_bytes_read);
        if(bytes_read == -1) return 42;
        total_bytes_read += bytes_read;
    }while(bytes_read != 0);
    return total_bytes_read;
}

int main(int argc, char* argv[]) {
    int fd, bytes_from_in, bytes_from_file, i, correct = 0, total_bytes_file = 0;
    int total_bytes_in, check_1 = 0, check_2 = 0;
    char buff_1[64], buff_2[64];

    fd = open(argv[1], O_RDONLY);
    if(fd == -1) exit(42);

    do {
        if(check_1 == 0) {
            bytes_from_in = my_read(0, buff_1, 64);
        }
        if(bytes_from_in == 0) {
            check_1 = 1;
        }

        if(bytes_from_in == -1) exit(42);

        total_bytes_in += bytes_from_in;


        if(check_2 == 0) {
            bytes_from_file = my_read(fd, buff_2, 64);
        }
        if(bytes_from_file == 0) {
            check_2 = 1;
        }

        if(bytes_from_file == -1) exit(42);

        total_bytes_file += bytes_from_file;


        for(i = 0; i < min(bytes_from_file, bytes_from_in); i++) {
            if(buff_1[i] == buff_2[i]) {
                correct++;
            }
        }
    }while(bytes_from_file != 0 || bytes_from_in != 0);

    if(total_bytes_file == 0 && total_bytes_in == 0) {
        return 100;
    }

    return (correct * 100) / max(total_bytes_file, total_bytes_in);
}

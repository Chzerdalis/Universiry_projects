#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "objdb.h"
#include <errno.h>

int main() {
    int res;

    res = open("16", O_RDWR);
    res = lseek(res, -2, SEEK_SET);
    printf("%d\n\n", res);
    printf("%d\n\n", errno);
    perror("Error");
    return 1;
}

/*temp_fd = open(fname, O_RDWR | O_CREAT | O_EXCL, S_IRWXU);
    if(temp_fd == -1 && errno != 17) {
        return -2;
    }else if(temp_fd == -1) {
        temp_fd = open(fname, O_RDWR);
        read(temp_fd, buff_meta_data, META_SIZE);
        if(strncmp("chris", buff_meta_data, META_SIZE) == 0) {
            return temp_fd;
        }else {
            close(temp_fd);
            return -1;
        }
    }else {
        write(temp_fd, "chris", META_SIZE);
        write(temp_fd, &file_size, sizeof(int));
        return temp_fd;
    }


temp_fd = open(fname, O_RDWR);
    if(temp_fd == -1 && errno != 2) {
        return -2;
    }else if(temp_fd == -1) {
        temp_fd = open(fname, O_RDWR | O_CREAT, S_IRWXU);
        write(temp_fd, "chris", META_SIZE);
        write(temp_fd, &file_size, sizeof(int));
        return temp_fd;
    }else {
        read(temp_fd, buff_meta_data, META_SIZE);
        if(strncmp("chris", buff_meta_data, META_SIZE) == 0) {
            return temp_fd;
        }else {
            close(temp_fd);
            return -1;
        }
    }
    */
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <sys/stat.h>
#define BUFFER_SIZE 4096
int main(int argc, char *argv[]) {
    int fd_src, fd_dest;
    char buff[BUFFER_SIZE];
    ssize_t bytes_read, bytes_written;
    unsigned long long total_bytes = 0;

    // Open the destination file
    fd_dest = open("../mountdir/overwrite.txt", O_RDWR | O_CREAT | O_TRUNC, S_IRWXU);
    if (fd_dest < 0) {
        perror("Error opening destination file");
        return 1;
    }
    write(fd_dest, "HELLO WORLD!", 12);
    write(fd_dest, "HELLO WORLD!", 12);
    fd_src = open("../mountdir/overwrite.txt", O_RDWR | O_CREAT, S_IRWXU);
    //write (fd_src, "GOODBYE", 7);

    // Close the files
    close(fd_dest);
    close(fd_src);

    // Open the destination file
    fd_dest = open("../overwrite.txt", O_RDWR | O_CREAT | O_TRUNC, S_IRWXU);
    if (fd_dest < 0) {
        perror("Error opening destination file");
        return 1;
    }
    write(fd_dest, "HELLO WORLD!", 12);
    write(fd_dest, "HELLO WORLD!", 12);
    fd_src = open("../overwrite.txt", O_RDWR | O_CREAT, S_IRWXU);
    write (fd_src, "GOODBYE", 7);

    // Close the files
    close(fd_dest);
    close(fd_src);

    remove("../mountdir/overwrite.txt");
    remove("../overwrite.txt");
    printf("Files created and deleted successfully.\n");

    return 0;

}
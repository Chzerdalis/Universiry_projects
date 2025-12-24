malakies pou diegraja 
int error_count(int fd) {
    char *buff = NULL, *res = NULL, *temp = NULL;
    int counter = 0, bytes_read;

    //save errout on a string
    if(lseek(fd, 0, SEEK_SET) == -1) exit(42);
    while(1) {
        counter = counter + chunk;
        buff = (char*)realloc(buff, counter);
        if(buff == NULL) {
            exit(42);
        }
        bytes_read = my_read(fd, &buff[counter - chunk], chunk);
        if(bytes_read == -1) {
            free(buff);
            exit(42);
        }
        if(bytes_read != chunk) {
            break;
        }
    }
    buff = (char*)realloc(buff, counter + 1);
    if(buff == NULL) exit(42);
    buff[counter] = '\0';

    //check for errors
    res = strstr(buff, "error:");
    if(res != NULL) {
        free(buff);
        return -1;
    }
    
    //count warnings
    counter = 0;
    temp = buff;
    while(1) {
        res = strstr(buff, "warning:");
        if(res != NULL) {
            counter++;
            buff = &res[7];
        }else {
            free(temp);
            return counter;
        }
    }
}
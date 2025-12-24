#include <fcntl.h>
#include <unistd.h>
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include "objdb.h"
#include <errno.h>
/*this function open a new data base and closes the 
previous if there is one already open, also
if it succedes it returns the new fd, if the file is not valid -1
and if open fails -2*/
int open_base(int fd, char* fname) {
    int temp_fd, file_size = META_SIZE + sizeof(int);
    char buff_meta_data[META_SIZE];
    //checks for open bases
    if(fd > 2) {
        if(close(fd) == -1) return 42;
    }
    errno = 0;
    temp_fd = open(fname, O_RDWR | O_CREAT | O_EXCL, S_IRWXU);
    /*if errno = EEXIST then it means that the open failed
    because the nam already exist else it failed and the program ends*/
    if(temp_fd == -1 && errno != EEXIST) {
        return -2;
    }else if(temp_fd == -1) {
        /*checks for the files validity 
        via the metadata*/
        temp_fd = open(fname, O_RDWR);
        if(temp_fd == -1) return -2;
        if(read(temp_fd, buff_meta_data, META_SIZE) == -1) return 42;
        if(strncmp("chris", buff_meta_data, META_SIZE) == 0) {
            return temp_fd;
        }else {
            if(close(temp_fd) == -1) return 42;
            return -1;
        }
    }else {
        /*writes metadata to the new base and saves space for
        and integer that will be the size of the file*/
        if(write(temp_fd, "chris", META_SIZE) == -1) return 42;
        if(write(temp_fd, &file_size, sizeof(int)) == -1) return 42;
        return temp_fd;
    }
}
/*this function seaches for an objname and if it finds it size else if not
it returns 0*/
int find_objname(int fd, char* objname) {
    int name_size = 0, data_size, res;
    char* name_buff = NULL;
    //moves fd before the first name
    if(lseek(fd, META_SIZE + sizeof(int), SEEK_SET) == -1) return 42;
    do {
        //reads name
        res = read(fd, &name_size, sizeof(int));
        if(res == -1) return 42;
        //saves name in a string
        name_buff = (char*)malloc(name_size * sizeof(char) + 1);
        if(name_buff == NULL) return 42;
        if(res == 0) {
            //reaches eof frees dinamic memory
            //and returns 0 which means the name wasnt found
            free(name_buff);
            return 0;
        }
        if(read(fd, name_buff, name_size) == -1) return 42;
        name_buff[name_size] = '\0';
        //compares name
        if(strcmp(objname, name_buff) == 0) {
            free(name_buff);
            return name_size;
        }
        free(name_buff);
        //moves to the next name
        if(read(fd, &data_size, sizeof(int)) == -1) return 42;
        if(lseek(fd, data_size, SEEK_CUR) == -1) return 42;
    }while(1);
}
/*this function imports data from another file and marks with a name that the user chooses
if succes returns 1, if name already exists returns -3, if import file not found -2, and if
data base not open -1*/
int import_data (int fd, char* name_file, char* objname) {
    int fd_import_file, name_size, res;
    int bytes_read, file_size;
    int data_size_imported = 0;
    char buffer[chunk];

    //checks data base
    if(fd < 0) return -1;
    //opens import file
    fd_import_file = open(name_file, O_RDONLY);
    if(fd_import_file == -1) return -2;
    //checks for the name
    res = find_objname(fd, objname);
    if(res == 42) return 42;
    if(res != 0) return -3;
    //writes data
    name_size = strlen(objname);
    if(write(fd, &name_size, sizeof(int)) == -1) return 42;
    if(write(fd, objname, name_size) == -1) return 42;
    if(write(fd, &data_size_imported, sizeof(int)) == -1) return 42;

    do {
        bytes_read = 0;
        bytes_read = my_read(fd_import_file, buffer, chunk);
        if(bytes_read == -1) return 42; 
        if(my_write(fd, buffer, bytes_read) == -1) return 42;
        data_size_imported += bytes_read;
    }while(bytes_read != 0);
    //'returns' back to save the data size and change the file size 
    if(lseek(fd, -data_size_imported - 4, SEEK_CUR) == -1) return 42;
    if(write(fd, &data_size_imported, sizeof(int)) == -1) return 42;
    if(lseek(fd, META_SIZE, SEEK_SET) == -1) return 42;
    if(read(fd, &file_size, sizeof(int)) == -1) return 42;
    file_size += data_size_imported + name_size + 2 * sizeof(int);
    if(lseek(fd, -4, SEEK_CUR) == -1) return 42;
    if(write(fd, &file_size, sizeof(int)) == -1) return 42;
    if(close(fd_import_file) == -1) return 42;
    return 1;
}
/*this function exports data to a choosen file 
if the name of the data isnt found returns -3 nad if the new file could
not be opened -2*/
int export_data(int fd, char* new_file_name, char* objname) {
    char buffer[chunk];
    int fd_export_file, data_size;
    int bytes_read, res;
    
    //checks for base
    if(fd < 0) return -1;
    //seaches name
    res = find_objname(fd, objname);
    if(res == 42) return 42;
    if(res == 0) return -3;
    //opens new export file
    fd_export_file = open(new_file_name, O_RDWR | O_CREAT | O_EXCL, S_IRWXU);
    if(fd_export_file == -1) return -2;
    //copies data
    if(read(fd, &data_size, sizeof(int)) == -1) return 42;
    do {
        bytes_read = 0;
        
        if(data_size <= chunk) {
            bytes_read = my_read(fd, buffer, data_size);
            if(bytes_read == -1) return 42;
            data_size -= bytes_read;
        }else{
            bytes_read = my_read(fd, buffer, chunk);
            if(bytes_read == -1) return 42;
            data_size -= bytes_read;
        }

        if(my_write(fd_export_file, buffer, bytes_read) == -1) return 42;

    }while(data_size > 0);
    //closes export file
    if(close(fd_export_file) == -1) return 42;
    return 1;
}
/*this functions deletes data fromthe base if it succeds retunrs 1
if the data isnot found -2*/
int delete_data (int fd, char* objname) {
    int file_size, data_del_size;
    int name_size, bytes_read;
    char buffer[chunk];

    //checks for basa
    if(fd < 0) {
        return -1;
    }
    //searches data
    name_size = find_objname(fd, objname);
    if(name_size == 42) return 42;
    if(name_size == 0) return -2;
    //goes to the end of the data we want deleted
    if(read(fd, &data_del_size, sizeof(int)) == -1) return 42;
    if(lseek(fd, data_del_size, SEEK_CUR) == -1) return 42;
    //and deletes the data by coping the data below it and over writing it
    //this happens with one file descriptor going back and forth
    do{
        bytes_read = my_read(fd, buffer, chunk);
        if(bytes_read == -1) return 42;
        if(lseek(fd, - 2 * sizeof(int) - data_del_size - name_size - bytes_read, SEEK_CUR) == -1) return 42;
        if(my_write(fd, buffer, bytes_read) == -1) return 42;
        if(lseek(fd, 2 * sizeof(int) + data_del_size + name_size, SEEK_CUR) == -1) return 42;
    }while(bytes_read != 0);
    /*here it reads the file size then cuts the file to the right size and updates the file size*/
    if(lseek(fd, META_SIZE, SEEK_SET) == -1) return 42;
    if(read(fd, &file_size, sizeof(int)) == -1) return 42;
    if(ftruncate(fd, file_size - 2 * sizeof(int) - data_del_size - name_size) == -1) return 42;
    file_size -= 2 * sizeof(int) + data_del_size + name_size;
    if(lseek(fd, -4, SEEK_CUR) == -1) return 42;
    if(write(fd, &file_size, sizeof(int)) == -1) return 42;
    return 1;
}
/*this function is exactly like reads 
but guaranteeds the read of all the bytes*/
int my_read(int fd, char* buffer, int size) {
    int bytes_read, total_bytes_read = 0;
    do{
        bytes_read = read(fd, &buffer[total_bytes_read], size - total_bytes_read);
        if(bytes_read == -1) return 42;
        total_bytes_read += bytes_read;
    }while(bytes_read != 0);
    return total_bytes_read;
}
/*the same but write*/
int my_write(int fd, char* buffer, int size) {
    int bytes_written, total_bytes_written = 0;
    do{
        bytes_written = write(fd, &buffer[total_bytes_written], size - total_bytes_written);
        if(bytes_written == -1) return 42;
        total_bytes_written += bytes_written;
    }while(bytes_written != 0);
    return total_bytes_written;
}
/*this function is used in function find 
and it returns with the help of a string in the arguments
all the objnames one by one, if it succeds returns 1, 
if no names left 0*/
int search_objnames(int fd, char** name_buff) {
    int name_size = 0, data_size, res;
    //reads the name size
    res = read(fd, &name_size, sizeof(int));
    if(res == -1) return 42;
    //allocates exact memory needed
    *name_buff = (char*)malloc(name_size * sizeof(char) + 1);
    if(*name_buff == NULL) {
        return 42;
    }else if(res == 0) {
        free(*name_buff);
        return 0;
    }
    //write the name in the string
    if(read(fd, *name_buff, name_size) == -1) return 42;
    (*name_buff)[name_size] = '\0';
    //goes to the next name
    if(read(fd, &data_size, sizeof(int)) == -1) return 42;
    if(lseek(fd, data_size, SEEK_CUR) == -1) return 42;
    return 1;
}
/*this funtion finds the names that are asked and saves them in a dimamic table
it returns a struct with the pointer to the table and the size of it*/
/*if it returns -2 as a size it needs to return 42*/
dinamic_table find(int fd, char* name_for_search) {
    char *name_buff = NULL, *temp_1;
    char **temp_2;
    int res;
    dinamic_table names_table = {NULL, 0};
    //checks for base
    if(fd < 0) {
        names_table.size = -1;
        return names_table;
    }

    if(lseek(fd, META_SIZE + sizeof(int), SEEK_SET) == -1) {
        names_table.size = -2;
        return names_table;
    }
    do{
        //checks for the mode of the search
        if(strcmp(name_for_search, "*") == 0) {
            //finds name
            res = search_objnames(fd, &name_buff);
            if(res == 42) {
                names_table.size = -2;
                return names_table;
            }else if(res == 0) {
                return names_table;
            }
            //changes size of the table
            temp_2 = (char**)realloc(names_table.table_ptr, sizeof(char*) * (++names_table.size));
            if(temp_2 == NULL) {
                names_table.size = -2;
                return names_table;
            }
            //saves name
            names_table.table_ptr = temp_2;
            names_table.table_ptr[names_table.size - 1] = name_buff;

        }else{
            //finds name
            res = search_objnames(fd, &name_buff);
            if(res == 42) {
                names_table.size = -2;
                return names_table;
            }else if(res == 0) {
                return names_table;
            }
            //checks if the name should be added
            temp_1 = strstr(name_buff, name_for_search);
            if(temp_1 != NULL) {
                //changes size of the table
                temp_2 = (char**)realloc(names_table.table_ptr, sizeof(char*) * (++names_table.size));
                if(temp_2 == NULL) {
                    names_table.size = -2;
                    return names_table;
                }
                //saves name
                names_table.table_ptr = temp_2;
                names_table.table_ptr[names_table.size - 1] = name_buff;
            }else{
                //frees memory from the function search_objnames
                //in case the should not be added
                free(name_buff);
            }

        }
    }while(1);
}
//this function prints the names saved in the dinamic table
void print_names(char** names_table, int size) {
    int  i;

    printf("\n##\n");
    for(i = 0; i < size; i++) {
        printf("%s\n", names_table[i]);
    }
}
//this frees the memory used from the table
void free_mem(dinamic_table names_table) {
    int i;

    for(i = 0; i < names_table.size; i++) {
        free(names_table.table_ptr[i]);
    }
    free(names_table.table_ptr);
}
/*this function closes any data base that is open*/
int close_base(int fd) {
    if(fd < 0) {
        return -1;
    }else{
        if(close(fd) == -1) return 42;
        return -2;
    }
}
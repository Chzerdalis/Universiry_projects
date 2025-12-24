#include <stdio.h>
#include "objdb.h"
#include <stdlib.h>

int main (int argc, char* argv[]) {
    int fd = -1, res;
    char *file_name, *objname, option, *dbname;
    dinamic_table names_table = {NULL, 0};

    while(1) {
        scanf(" %c", &option);
        switch (option) {
            case 'o' : {
                scanf(" %ms", &dbname);
                fd = open_base(fd, dbname);
                if(fd == -2) {
                    fprintf(stderr, "\nError opening %s.\n", dbname);
                }else if(fd == -1) {
                    fprintf(stderr, "\nInvalid db file %s.\n", dbname);
                }else if(fd == 42) {
                    perror("Error");
                    return 42;
                }
                free(dbname);
                break;
            }
            case 'i' : {
                scanf(" %ms %ms", &file_name, &objname);
                res = import_data(fd, file_name, objname);
                if(res == -1) {
                    fprintf(stderr, "\nNo open db file.\n");
                }else if(res == -2) {
                    fprintf(stderr, "\nFile %s not found.\n", file_name);
                }else if(res == -3) {
                    fprintf(stderr, "\nObject %s already in db.\n", objname);
                }else if (res == 42) {
                    perror("Error");
                    return 42;
                }
                free(file_name);
                free(objname);
                break;
            }
            case 'e' : {
                scanf(" %ms %ms", &objname, &file_name);
                res = export_data(fd, file_name, objname);
                if(res == -1) {
                    fprintf(stderr, "\nNo open db file.\n");
                }else if(res == -2) {
                    fprintf(stderr, "\nCannot open file %s.\n", file_name);
                }else if(res == -3) {
                    fprintf(stderr, "\nObject %s not in db.\n", objname);
                }else if (res == 42) {
                    perror("Error");
                    return 42;
                }
                free(file_name);
                free(objname);
                break;
            }
            case 'd' : {
                scanf(" %ms", &objname);
                res = delete_data(fd, objname);
                if(res == -1) {
                    fprintf(stderr, "\nNo open db file.\n");
                }else if(res == -2) {
                    fprintf(stderr, "\nObject %s not in db.\n", objname);
                }else if (res == 42) {
                    perror("Error");
                    return 42;
                }
                free(objname);
                break;
            }
            case 'f' : {
                scanf(" %ms", &objname);
                names_table = find(fd, objname);
                if(names_table.size == -1) {
                    fprintf(stderr, "\nNo open db file.\n");
                }else if(names_table.size == -2) {
                    perror("Error");
                    return 42;
                }else{
                    print_names(names_table.table_ptr, names_table.size);
                    free_mem(names_table);
                }
                free(objname);
                break;
            }
            case 'c' : {
                res = close_base(fd);
                if(res == -1) {
                    fprintf(stderr, "\nNo open db file.\n");
                }else if(res == 42) {
                    perror("Error");
                    return 42;
                }else {
                    //i set fd to -1 if a data base is closed
                    fd = -1;
                }
                break;
            }
            case 'q' : {
                if(close_base(fd) == 42) {
                    perror("Error");
                    return 42;
                }
                return 0;
            }
            default : {
                fprintf(stderr, "\nInvalid command.\n");
                while(option != '\n') {
                    scanf("%c", &option);
                }
            }
        }
    }
    return 42;
}
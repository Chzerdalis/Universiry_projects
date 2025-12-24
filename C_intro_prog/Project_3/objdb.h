//this is the struct of dinamic table
typedef struct {
    char** table_ptr;
    int size;
} dinamic_table;
extern int open_base(int fd, char* name);
extern int find_objname(int fd, char* objname);
extern int import_data (int fd, char* name_file, char* objname);
extern int export_data(int fd, char* new_file_name, char* objname);
extern int my_read(int fd, char* buffer, int size);
extern int my_write(int fd, char* buffer, int size);
extern int delete_data (int fd, char* objname);
extern int search_objnames(int fd, char** name_buff);
extern dinamic_table find(int fd, char* name_for_search);
extern void print_names(char** names_table, int size);
extern void free_mem(dinamic_table names_table);
extern int close_base(int fd);
#define META_SIZE 5
#define chunk 512

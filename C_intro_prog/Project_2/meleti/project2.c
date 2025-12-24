/* ONOMATEPWNYMO:CHRISTODOULOS ZERDALIS 
   AEM:03531
 */
#include"project2.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct {
  char first_name[NAMESIZE];
  char last_name[NAMESIZE];
} nameT;
//struct for the students courses
struct courses{
  struct courses *next_course;
  unsigned short int course_id;
};
typedef struct courses student_coursesT;
/*in this struct i have added the head of the courses list
the next and pren pointers of the double list of the 
hash table and the int bucket size whick i use in the sentinel
to count the nubmers of students in the list*/
struct student {
  nameT name;
  unsigned int bucket_size;
  unsigned long int aem;
  unsigned short int courses;
  student_coursesT *head_courses;
  struct student *next_stud, *prev_stud;
};
typedef struct student student_infoT;

/*i use the int variable sorted in order to know if the list
is sorted or not (0 not 1 yes) and use it in order to know 
which method of searching to use
Also i use the size of the array and the number of inputted students
to know when to add or remove possitions of the array*/
typedef struct {
  student_infoT **students_info;
  unsigned int size;
  unsigned int number_students;
  unsigned short int sorted; 
} listT;

typedef struct {
  student_infoT **table;
  unsigned int size, min_size, n_elements, largest_bucket;
} hash_tableT;

int linear_search(listT *list, const unsigned long int aem, unsigned long int *comps);
void clear(listT *list, hash_tableT *hash_table, const int init);
int find(listT *list, const unsigned long int aem, unsigned long int *indi_comps);
int add(listT *list, hash_tableT *hash_table, const unsigned long int aem, const unsigned short int courses, const char *first_name, const char *last_name, const int change);
void print(listT *list);
int mod(listT *list, const unsigned long int aem, const unsigned short int courses);
int binary_search(listT *list, const unsigned long int aem, unsigned long int *indi_comps, int start, int finish);
int rmv(listT *list, hash_tableT *hash_table, const unsigned long int aem, const int change);
void upper(char *str);
unsigned long int sort(listT *list);
int isreg(listT *list, const unsigned long int aem, const unsigned short int course_id, student_coursesT **save_prev);
int reg(listT *list, const unsigned long int aem, const unsigned short int course_id);
int list_courses(listT *list, const unsigned long int aem);
int unreg(listT *list, const unsigned long int aem, const unsigned short int course_id);
void clear_courses(listT *list, int i);
int init_hash_table(hash_tableT *hash_table, unsigned int min_size);
void clear_hash_table(hash_tableT *hash_table);
unsigned long int hash(const char *last_name);
student_infoT* find_hash_table(hash_tableT *hash_table, const unsigned long int aem, const char *last_name, int add_sub);
int find_by_name(hash_tableT *hash_table, const unsigned long int aem, const char *last_name, unsigned long int *comps);
int add_hash(hash_tableT *hash_table, student_infoT *student_to_add);
void print_by_name(hash_tableT *hash_table);
int rmv_hash(hash_tableT *hash_table, student_infoT *student_to_rmv);
void rehash(hash_tableT *hash_table, listT *list, unsigned int size);

int main (int argc, char *argv[]) {
	listT list;
  hash_tableT hash_table;
  char option, *first_name, *first_name_help, *last_name, *last_name_help;
  unsigned long int aem;
  unsigned short int courses, course_id;
  unsigned long int comps = 0;
  int res, i;
  unsigned long int res_sort;
  student_coursesT *save_prev = NULL;
  //unexpected number of arguments
  if(argc != 4) {
    return 42;
  }

  //initialize the array of pointers
  list.size = atoi(argv[1]);
  list.number_students = 0;
  list.sorted = 0;
  list.students_info = (student_infoT**)malloc(atoi(argv[1])*sizeof(student_infoT*));
  if( list.students_info == NULL) {
    return 43;
  }
  for(i = 0; i < atoi(argv[1]); i++) {
    list.students_info[i] = NULL;
  }
  //init hash table
  hash_table.min_size = atoi(argv[3]);
  res = init_hash_table(&hash_table, atoi(argv[3]));
  if(res == 0) {
    return 43;
  }
  while(1) {
    scanf(" %c", &option);
    switch (option) {
      case ('a') :{
        //scans the information
        //saves strings in dynamic memory
        scanf("%lu %ms %ms %hu", &aem, &first_name, &last_name, &courses);
        //checks for invalid input
        if(aem == 0 || courses == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        //checks for name lenght
        if(strlen(last_name) > NAMESIZE - 1 || strlen(first_name) > NAMESIZE - 1) {
          printf("\nTrimmed name(s).\n");
        }
        //reduses first name
        if(strlen(first_name) > NAMESIZE - 1) {
          first_name_help = (char*)realloc(first_name, NAMESIZE);
          if(first_name_help == NULL) {
            return 1;
          }
          first_name = first_name_help;
          //puts \0 to became string
          first_name[NAMESIZE - 1] = '\0';
        }
        //reduses last name
        if(strlen(last_name) > NAMESIZE - 1) {
          last_name_help = (char*)realloc(last_name, NAMESIZE);
          if(last_name_help == NULL) {
            return 1;
          }
          last_name = last_name_help;
          //puts \0 to became strings
          last_name[NAMESIZE - 1] = '\0';
        }
        //makes letters upper case
        upper(first_name);
        upper(last_name);
        res = add(&list, &hash_table, aem, courses, first_name, last_name, atoi(argv[2]));
        if(res == 1) {
          printf("\nA-OK %lu, %u %u\n", aem, list.number_students, list.size);
        }else {
          printf("\nA-NOK %lu, %u %u\n", aem, list.number_students, list.size);
        }
        //frees memory
        free(last_name);
        free(first_name);
        break;
      }
      case ('r') :{
        scanf("%lu", &aem);
        if(aem == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        res = rmv(&list, &hash_table, aem, atoi(argv[2]));
        //chooses what to print from remove output
        if(res == 1) {
          printf("\nR-OK %lu, %u %u\n", aem, list.number_students, list.size);
        }else {
          printf("\nR-NOK %lu, %u %u\n", aem, list.number_students, list.size);
        }
        break;
      }
      case ('m') :{
        scanf("%lu %hu", &aem, &courses);
        if(aem == 0 || courses == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        res = mod(&list, aem, courses);
        if(res == 1){
          printf("\nM-OK %lu\n", aem);
        }else {
          printf("\nM-NOK %lu\n", aem);
        }
        break;
      }
      case ('s') :{
        /*res_sort is different from res 
        as it is a uns long int*/
        res_sort = sort(&list);
        printf("\nS-OK\n");
        //prints in stderr copmarisons
        fprintf(stderr, "\n$%lu\n", res_sort);
        break;
      }
      case ('f') :{
        scanf("%lu", &aem);
        if(aem == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        res = find(&list, aem, &comps);
        if(res == -1) {
          printf("\nF-NOK %lu\n", aem);
          fprintf(stderr, "\n$%lu\n", comps);
          //prints in stderr copmarisonsps);
          comps = 0;
        }else {
          printf("\nF-OK %s %s %hu\n", list.students_info[res]->name.first_name, 
          list.students_info[res]->name.last_name, list.students_info[res]->courses);
          //prints in stderr copmarisons
          fprintf(stderr, "\n$%lu\n", comps);
          comps = 0;
        }
        break;
      }
      case ('p') :{
        //prints array
        print(&list);
        break;
      }
      case ('c') :{
        //clears all entries
        clear(&list, &hash_table, 1);
        printf("\nC-OK\n");
        break;
      }
      case ('q') :{
        //quits program
        clear(&list, &hash_table, 0);
        return 0;
      }
      case ('g') :{
        //adds course
        scanf("%lu %hu", &aem, &course_id);
        if(aem == 0 || course_id == 0) {
          printf("\nInvalid input\n");
          break;
        }
        res = reg(&list, aem, course_id);
        if(res == 1) {
          printf("\nG-OK %lu %hu\n", aem, course_id);
        }else if(res == -1) {
          printf("\nG-NOK %hu\n", course_id);
        }else if(res == 0){
          printf("\nG-NOK %lu\n", aem);
        }else{
          printf("\nG-NOK MEM\n");
        }
        break;
      }
      case ('i') :{
        scanf("%lu %hu", &aem, &course_id);
        if(aem == 0 || course_id == 0) {
          printf("\nInvalid input\n");
          break;
        }
        res = isreg(&list, aem, course_id, &save_prev);
        if(res == 1) {
          printf("\nYES\n");
        }else if(res == -1){
          printf("\nNO\n");
        }else{
          printf("\nI-NOK %lu\n", aem);
        }
        break;
      }
      case ('l') :{
        scanf("%lu", &aem);
        if(aem == 0) {
          printf("\nInvalid input\n");
          break;
        }
        res = list_courses(&list, aem);
        if(res == 0) {
          printf("\nL-NOK %lu\n", aem);
        }
        break;
      }
      case ('u') :{
        scanf("%lu %hu", &aem, &course_id);
        if(aem == 0 || course_id == 0) {
          printf("\nInvalid input\n");
          break;
        }
        res = unreg(&list, aem , course_id);
        if(res == 0) {
          printf("\nU-NOK %lu\n", aem);
        }else if(res == -1) {
          printf("\nU-NOK %hu\n", course_id);
        }else{
          printf("\nU-OK %lu %hu\n", aem, course_id);
        }
        break;
      }
      case ('t') :{
        print_by_name(&hash_table);
        break;
      }
      case ('n') :{
        scanf("%ms", &last_name);
        if(strlen(last_name) > NAMESIZE - 1) {
          last_name_help = (char*)realloc(last_name, NAMESIZE);
          if(last_name_help == NULL) {
            return 1;
          }
          last_name = last_name_help;
          //puts \0 to became string
          last_name[NAMESIZE - 1] = '\0';
        }
        upper(last_name);
        res = find_by_name(&hash_table, aem, last_name, &comps);
        if(res == 0) {
          printf("\nN-NOK %s\n", last_name);
        }
        fprintf(stderr, "\n@%lu\n", comps);
        comps = 0;
        free(last_name);
        break;
      }
      default : {
        //clears buffer
        printf("\nInvalid command.\n");
        while(option != '\n') {
          scanf("%c", &option);
        }
      }
    }
  }
}
/*searches one by one all the students based #
on ther aem and returns its position in the array if it returns 'number_students
it means that the aem was not found*/
int linear_search(listT *list, const unsigned long int aem, unsigned long int *comps) {
  int i;
  
  for (i = 0; (i < list->number_students) && (aem != list->students_info[i]->aem); i++);
  if(comps != NULL) {
    if(i == list->number_students) {
      *comps = i;
    }else {
      *comps = i + 1;
    }
  }
  return i;
}
/*searches the array with binary linear_search start and finish are the boundries of the linear_search
if it finds the given aem returns the students position in the arry if not returns -1*/
int binary_search(listT *list, const unsigned long int aem, unsigned long int *comps, int start, int finish) {
int middle;

  if(start <= finish) {
    middle = (finish - start) / 2 + start;
    /*in functions that dont require the comparisons i use NULL pointer as an argument
    and this if protects the program from failling*/
    if(comps != NULL) {
      (*comps)++;
    }
    if(list->students_info[middle]->aem == aem) {
      return middle;
    }
    //the same here
    if(comps != NULL) {
      (*comps)++;
    }
    if(list->students_info[middle]->aem < aem) {
      return binary_search(list, aem, comps, middle + 1, finish);
    }

    return binary_search(list, aem, comps, start, middle - 1);
  }
  return -1;
}
/*This funtion uses linear_search to find a given aem
if it finds the aem it returns its position else returns -1*/
int find(listT *list, const unsigned long int aem, unsigned long int *comps) {
  int res;
  if(list->sorted == 0) {
    res = linear_search(list, aem, comps);
  } else{
    res = binary_search(list, aem, comps, 0, list->number_students - 1);
  }
  if(res == list->number_students) {
    return -1;
  }else {
    return res;
  }
}
/*this funtion modifies a students owed courses based on thier aem
if it fails -1 else 1*/
int mod(listT *list, const unsigned long int aem, const unsigned short int courses) {
  int res;

  if(list->sorted == 0) {
    res = linear_search(list, aem, NULL);
  } else{
    res = binary_search(list, aem, NULL, 0, list->number_students - 1);
  }

  if(res == list->number_students || res == -1) {
    return -1;
  }else {
    list->students_info[res]->courses = courses;
    return 1;
  }

}
/*this funtion add students in the array if the student already exists returns -1 
if it succeds in adding him returns  1 and if memory allocation fails in any point of he function
it returns 0*/
int add(listT *list, hash_tableT *hash_table, const unsigned long int aem, const unsigned short int courses, const char *first_name, const char *last_name, const int change) {
  int res, res_of_add, i, j;
  student_infoT **students_info;
  student_infoT *student;
  //checks for the kind of linear_search
  if(list->sorted == 0) {
    res = linear_search(list, aem, NULL);
  } else{
    res = binary_search(list, aem, NULL, 0, list->number_students - 1);
  }
  //checks if the given aem already exists
  if(res == list->number_students || res == -1) {
    //checks for space in the array
    if(list->size - list->number_students == 0) {
      //creates space
      //change is the number of new pos added every time
      students_info = (student_infoT**)realloc(list->students_info, (list->size + change) * sizeof(student_infoT*));
      if(students_info == NULL) {
        return 0;
      }
      list->students_info = students_info;
      //make the new pointers NULL
      for(i = list->size, j = 0; j < change; j++) {
        list->students_info[i + j] = NULL;
      }
      //creates memory foe the new entrie
      student = (student_infoT*)malloc(sizeof(student_infoT));
      if(student == NULL) {
        return 0;
      }
      //copies data
      student->aem = aem;
      student->courses = courses;
      student->bucket_size = 0;
      student->head_courses = NULL;
      strcpy(student->name.first_name, first_name);
      strcpy(student->name.last_name, last_name);
      //assigns pointer
      list->students_info[list->size] = student;
      //changes the size the n of students and assumes the array unsorted
      list->number_students++;
      list->size += change;
      list->sorted = 0;
      res_of_add = add_hash(hash_table, student);
      if(res_of_add == 0) {
        rehash(hash_table, list, hash_table->size * 2);
      }
      return 1;
    }else{
      //the same story but without creating more room
      student = (student_infoT*)malloc(sizeof(student_infoT));
      if(student == NULL) {
        return 0;
      }
      student->aem = aem;
      student->courses = courses;
      student->bucket_size = 0;
      student->head_courses = NULL;
      strcpy(student->name.first_name, first_name);
      strcpy(student->name.last_name, last_name);
      list->students_info[list->number_students] = student;
      list->number_students++;
      list->sorted = 0;
      res_of_add = add_hash(hash_table, student);
      if(res_of_add == 0) {
        rehash(hash_table, list, hash_table->size * 2);
      }
      return 1;
    }
  }else {
    return -1;
  }
}
//prints all entries
void print(listT *list) {
  int i;

  printf("\n##\n");
  if(list->students_info != NULL) {
    for(i = 0; i < list->number_students; i++) {
      printf("%ld %s %s %hd\n", list->students_info[i]->aem, list->students_info[i]->name.first_name, list->students_info[i]->name.last_name, list->students_info[i]->courses);
    }
  }
}
//clears all entries and frees every pointer that is uses for dynamic memory allocation
void clear(listT *list, hash_tableT *hash_table, const int init) {
  int i;

  clear_hash_table(hash_table);
  if(init == 1) {
    init_hash_table(hash_table, hash_table->min_size);
  }
  for(i = 0; i < list->number_students; i++) {
    clear_courses(list, i);
    free(list->students_info[i]);
  }
  free(list->students_info);
  list->students_info = NULL;
  list->size = 0;
  list->number_students = 0;
  list->sorted = 0;
}
/*this funtion removes the given student by his aem from the array and if 
a certain number of unused position appears then it reduses its size 
if the aem doesnt exist it returns -1 and if it succeds it returns 1*/
int rmv(listT *list, hash_tableT *hash_table, const unsigned long int aem, const int change) {
  int res, res_of_rmv;
  student_infoT *temp; 
  student_infoT **students_info;
  //checks for method of linear_search
  if(list->sorted == 0) {
    res = linear_search(list, aem, NULL);
  } else{
    res = binary_search(list, aem, NULL, 0, list->number_students - 1);
  }
  //checks existance
  if(res == list->number_students || res == -1) {
    return -1;
  }else {
    /*in order to avoid any unused posstions in the midlle
    of the array it transfers the last entri on the one that
    is to be removed and then removes the last*/
    //this can make a sorted array to unsorted
    temp = list->students_info[res];
    res_of_rmv = rmv_hash(hash_table, temp);
    clear_courses(list, res);
    list->students_info[res] = list->students_info[list->number_students - 1];
    //it free the memory that is used for the students info
    free(temp);
    list->students_info[list->number_students - 1] = NULL;
    //reduces n of stud
    list->number_students--;
    //assumes the array unsorted
    list->sorted = 0;
    //checks for reducing the size of the array
    /*change is the number of free spaces which have 
    to appers in order for the array to get smaller*/
    if(res_of_rmv == 0) {
        rehash(hash_table, list, hash_table->size / 2);
    }
    if(list->size - list->number_students >= change) {
      students_info = (student_infoT**)realloc(list->students_info, (list->size - change) * sizeof(student_infoT*));
      list->students_info = students_info;
      //reduces size
      list->size -= change;
      return 1;
    }else {
      return 1;
    }
  }
}
//converts the letters of a string to uppercase used in add option
void upper(char *str) {
  int i;

  for(i = 0; str[i] != '\0'; i++) {
    str[i] = toupper(str[i]);
  }
}
//sorts the given array and returns the numbers of comparisons used
unsigned long int sort(listT *list) {
    int i, j;
    unsigned long int comps = 0;
    student_infoT *key;

    for(i = 1; i < list->number_students; i++) {
        key = list->students_info[i];
        j = i - 1;

        while(j >= 0 && list->students_info[j]->aem > key->aem) {
            comps++;
            list->students_info[j + 1] = list->students_info[j];
            j = j - 1;
        }
        if(j >= 0) {
          comps++;
        }
        list->students_info[j + 1] = key;
    }
    list->sorted = 1;
    return comps;
}
/*searches for a course of a student if it finds it it returns 1 if not -1 nad if 
the student does not exist 0, also it saves the previous struct on the list
so it can be used in reg and unreg*/
/*when prev is NULL it means that the item we are interested in 
is next to the head of the list*/
int isreg(listT *list, const unsigned long int aem, const unsigned short int course_id, student_coursesT **save_prev) {
  student_coursesT *curr, *prev = NULL;//i initialize prev so i can use it as mention above
  int res;

  if(list->sorted == 0) {
    res = linear_search(list, aem, NULL);
  } else{
    res = binary_search(list, aem, NULL, 0, list->number_students - 1);
  }
  if(res == list->number_students || res == -1) {
    return 0;
  }
  /*if the head points to NULL or the first course in 'bigger' than the one we are adding then the pren stays NULL
  and in both cases we know that course is to be added after the head*/
  for(curr = list->students_info[res]->head_courses; (curr != NULL) && (curr->course_id < course_id); prev = curr, curr = prev->next_course);
  *save_prev = prev;
  if(curr == NULL || curr->course_id != course_id) {
    return -1;
  }
  return 1;
}
//it prints all the courses of a student if exixsts
int list_courses(listT *list, const unsigned long int aem) {
  student_coursesT *curr;
  int res;

   if(list->sorted == 0) {
    res = linear_search(list, aem, NULL);
  } else{
    res = binary_search(list, aem, NULL, 0, list->number_students - 1);
  }
  if(res == list->number_students || res == -1) {
    return 0;
  }
  printf("\nL-OK %s %lu\n", list->students_info[res]->name.last_name, aem);
  for(curr = list->students_info[res]->head_courses; curr != NULL; curr = curr->next_course) {
    printf("%hu\n", curr->course_id);
  }
  return 1;
}
/*adds a new sudject if it already exitst it returns -1 if the student does not returns
0 if allocation of memory fails returns -2*/
int reg(listT *list, const unsigned long int aem, const unsigned short int course_id) {
  int res;
  student_coursesT *save_prev = NULL, *temp;

  res = isreg(list, aem, course_id, &save_prev);
  if(res == 0) {
    return 0;
  }else if(res == 1) {
    return -1;
  }
  temp = (student_coursesT*)malloc(sizeof(student_coursesT));
  if(temp == NULL) {
    return -2;
  }
  if(save_prev != NULL) {
    temp->course_id = course_id;
    temp->next_course = save_prev->next_course;
    save_prev->next_course = temp;
  }else{
    res = find(list, aem, NULL);
    temp->course_id = course_id;
    temp->next_course = list->students_info[res]->head_courses;
    list->students_info[res]->head_courses = temp;
  }
  return 1;
}
/*this funtion removes an item from the list if it succeds it returns 1 if the aem 
does not exist it returns 0 if the id doesnt retunrs -1*/
int unreg(listT *list, const unsigned long int aem, const unsigned short int course_id) {
  int res;
  student_coursesT *save_prev = NULL, *temp;

  res = isreg(list, aem, course_id, &save_prev);
  if(res == 0) {
    return 0;
  }else if(res == -1) {
    return -1;
  }
  if(save_prev != NULL) {
    temp = save_prev->next_course;
    save_prev->next_course = save_prev->next_course->next_course;
    free(temp);
  }else {
    res = find(list, aem, NULL);
    temp = list->students_info[res]->head_courses;
    list->students_info[res]->head_courses = list->students_info[res]->head_courses->next_course;
    free(temp);
  }
  return 1;
}
//clears courses of students (frees memory)
void clear_courses(listT *list, int i) {
  student_coursesT *curr, *temp;

  for(curr = list->students_info[i]->head_courses; curr != NULL; temp = curr, curr = curr->next_course, free(temp));
  list->students_info[i]->head_courses = NULL;
}
//fuction to help me initialize the hash table
//it creates the array of pointers and the sentinels of the lists
//returns 0 if memory allocation fails in any way, else 1
int init_hash_table(hash_tableT *hash_table, unsigned int size) {
  int i;
  student_infoT *sentinel;

  hash_table->table = (student_infoT**)malloc((size)*sizeof(student_infoT*));
  if(hash_table->table == NULL) {
    return 0;
  }
  hash_table->largest_bucket = 0;
  hash_table->n_elements = 0;
  hash_table->size = size;
  for(i = 0; i < size; i++) {
    sentinel = (student_infoT*)malloc(sizeof(student_infoT));
    if(sentinel == NULL) {
      return 0;
    }
    /*note that the only variable in the stuct of the sentinel that 
    doesnot change is the course and it stays zero, i use it later to identify them*/
    hash_table->table[i] = sentinel;
    hash_table->table[i]->aem = 0;
    hash_table->table[i]->courses = 0;
    hash_table->table[i]->bucket_size = 0;
    hash_table->table[i]->head_courses = NULL;
    hash_table->table[i]->next_stud = hash_table->table[i];
    hash_table->table[i]->prev_stud = hash_table->table[i];
  }
  return 1;
}
//it free all teh memory of the hash table
void clear_hash_table(hash_tableT *hash_table) {
  int i;
  
  for(i = 0; i < hash_table->size; i++) {
    free(hash_table->table[i]);
  }
  free(hash_table->table);
  hash_table->table = NULL;
}
//this fuction dereclty returns the appropriate pointer to add or sud an ite from the double list
/*also depending on the value of add_sub it changes the number of items in the list
if 1 adds one else subs one.i do this on this function and not add_hash_table or rmv_hash_table
because i know the location of the lists sentinel, and it has no sideeffects as i only use it in add
and rmv and i know that if they are used surely something is going to be added or removed*/
student_infoT* find_hash_table(hash_tableT *hash_table, const unsigned long int aem, const char *last_name, int add_sub) {
  unsigned long int pos;
  unsigned int i;
  student_infoT *curr;

  pos = hash(last_name) % hash_table->size;
  if(add_sub == 1) {
    hash_table->table[pos]->bucket_size += 1;
  }else if(add_sub == 0) {
    hash_table->table[pos]->bucket_size -= 1;
  }
  //updates new largest bucket
  if(hash_table->table[pos]->bucket_size > hash_table->largest_bucket) {
    hash_table->largest_bucket = hash_table->table[pos]->bucket_size;
  }
  //in case of two buckets being the largest bucket and one of then being reduced
  if(add_sub == 0 && hash_table->table[pos]->bucket_size + 1 == hash_table->largest_bucket) {
    for(i = 0; i < hash_table->size && hash_table->table[i]->bucket_size <= hash_table->table[pos]->bucket_size; i++);
    if(i == hash_table->size) {
      hash_table->largest_bucket -= 1;
    }
  }
  strcpy(hash_table->table[pos]->name.last_name,last_name);
  hash_table->table[pos]->aem = aem;
  for(curr = hash_table->table[pos]->next_stud; (strcmp(last_name, curr->name.last_name) > 0); curr = curr->next_stud);
  if(strcmp(last_name, curr->name.last_name) == 0) {
    for(; strcmp(last_name, curr->name.last_name) == 0 && curr->aem < aem; curr = curr->next_stud);
  }
  return curr->prev_stud;
}
/*This function finds the student asked by his last name via the hash_table
, simirarly with the previous one, BUT it prints all the students info with this name
returns o if not found else 1*/
int find_by_name(hash_tableT *hash_table, const unsigned long int aem, const char *last_name, unsigned long int *comps) {
  student_infoT *curr;
  unsigned long int pos;
  
  pos = hash(last_name) % hash_table->size;
  strcpy(hash_table->table[pos]->name.last_name,last_name);
  hash_table->table[pos]->aem = aem;
  for(curr = hash_table->table[pos]->next_stud; ((*comps)++, strcmp(last_name, curr->name.last_name) > 0); curr = curr->next_stud);
  if(curr == hash_table->table[pos] || strcmp(last_name, curr->name.last_name) != 0) {
    if(curr == hash_table->table[pos]) {
      (*comps)--;
    }
    return 0;
  }else {
    printf("\nN-OK %s\n", last_name);
    for(; (*comps)++, strcmp(last_name, curr->name.last_name) == 0 && curr != hash_table->table[pos]; curr = curr->next_stud) {
      printf("%s %lu %hu\n", curr->name.first_name, curr->aem, curr->courses);
    }
    return 1;
  }
}
//this is the hash function
unsigned long int hash(const char *last_name) {
  unsigned long int hash = 5381;
  int c;

  while((c = *last_name++)) {
    hash = ((hash << 5) + hash) + c;
  }
  return hash;
}
//this funtion add to the list that corresponds to the right bucket of the hask_table
int add_hash(hash_tableT *hash_table, student_infoT *student_to_add) {
  student_infoT *prev, *temp;
  double load_factor;

  prev = find_hash_table(hash_table, student_to_add->aem, student_to_add->name.last_name, 1);

  hash_table->n_elements += 1;
  temp = prev->next_stud;
  prev->next_stud->prev_stud = student_to_add;
  prev->next_stud = student_to_add;
  prev->next_stud->prev_stud = prev;
  prev->next_stud->next_stud = temp;
  load_factor = (double)hash_table->n_elements/hash_table->size;
  if(load_factor >= HIGH_LOAD) {
    return 0;
  }
  return 1;
}

int rmv_hash(hash_tableT *hash_table, student_infoT *student_to_rmv) {
  student_infoT *prev;
  double load_factor;

  prev = find_hash_table(hash_table, student_to_rmv->aem, student_to_rmv->name.last_name, 0);
  
  hash_table->n_elements -= 1;
  prev->next_stud = prev->next_stud->next_stud;
  prev->next_stud->prev_stud = prev;
  load_factor = (double)hash_table->n_elements/hash_table->size;
  if(load_factor <= LOW_LOAD) {
    return 0;
  }
  return 1;
}

void print_by_name(hash_tableT *hash_table) {
  unsigned int i;
  student_infoT *curr;
  double load_factor;

  load_factor = (double)hash_table->n_elements / hash_table->size;
  printf("\n##\n");
  printf("%u %u %.2lf %u\n", hash_table->size, hash_table->n_elements, load_factor, hash_table->largest_bucket);
  for(i = 0; i < hash_table->size; i++) {
    if(1) {
      printf("%u %u", i, hash_table->table[i]->bucket_size);
      for(curr = hash_table->table[i]->next_stud; curr != hash_table->table[i]; curr = curr->next_stud) {
        printf(" [ %lu %s %s %hu ]", curr->aem, curr->name.first_name, curr->name.last_name, curr->courses);
      }
      printf("\n\n");
    }
  }
}

void rehash(hash_tableT *hash_table, listT *list, unsigned int size) {
  unsigned int i;
  int res;

  if(size < hash_table->min_size) {
    size = hash_table->min_size;  
  }
  clear_hash_table(hash_table);
  res = init_hash_table(hash_table, size);
  if(res != 0) {
    for(i = 0; i < list->number_students; i++) {
    add_hash(hash_table, list->students_info[i]);
    }
  }
}
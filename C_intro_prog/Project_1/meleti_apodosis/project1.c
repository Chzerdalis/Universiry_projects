/* ONOMATEPWNYMO: CHRISTOSDOULOS ZERDALIS
   AEM: 03531
 */
#include"project1.h"
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <ctype.h>

typedef struct {
  char first_name[NAMESIZE];
  char last_name[NAMESIZE];
} nameT;

typedef struct {
  nameT name;
  unsigned long int aem;
  unsigned short int corses;
} student_infoT;
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

int search(listT *list, const int aem, unsigned long int *comps);
void clear(listT *list);
int find(listT *list, const int aem, unsigned long int *indi_comps);
int add(listT *list, const int aem, const int corses, const char *first_name, const char *last_name, const int change);
void print(listT *list);
int mod(listT *list, const int aem, const int corses);
int binary_search(listT *list, const int aem, unsigned long int *indi_comps, int start, int finish);
int remove1(listT *list, const int aem, const int change);
void upper(char *str);
unsigned long int sort(listT *list);

int main (int argc, char *argv[]) {
	listT list;
  char option, *first_name, *first_name_help, *last_name, *last_name_help;
  unsigned long int aem;
  unsigned short int corses;
  unsigned long int comps = 0;
  int res;
  unsigned long int res2;
  //unexpected number of arguments
  if(argc != 3) {
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

  while(1) {
    scanf(" %c", &option);
    switch (option) {
      case ('a') :{
        scanf("%ld %ms %ms %hd", &aem, &first_name, &last_name, &corses);
        if(aem == 0 || corses == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        if(strlen(last_name) > NAMESIZE - 1 || strlen(first_name) > NAMESIZE - 1) {
          printf("\nTrimmed name(s).\n");
        }
        if(strlen(first_name) > NAMESIZE - 1) {
          first_name_help = (char*)realloc(first_name, NAMESIZE);
          if(first_name_help == NULL) {
            return 1;
          }
          first_name = first_name_help;
          first_name[NAMESIZE - 1] = '\0';
        }
        if(strlen(last_name) > NAMESIZE - 1) {
          last_name_help = (char*)realloc(last_name, NAMESIZE);
          if(last_name_help == NULL) {
            return 1;
          }
          last_name = last_name_help;
          last_name[NAMESIZE - 1] = '\0';
        }
  
        upper(first_name);
        upper(last_name);
        res = add(&list, aem, corses, first_name, last_name, atoi(argv[2]));
        if(res == 1) {
          printf("\nA-OK %ld, %d %d\n", aem, list.number_students, list.size);
        }else {
          printf("\nA-NOK %ld, %d %d\n", aem, list.number_students, list.size);
        }
        free(last_name);
        free(first_name);
        break;
      }
      case ('r') :{
        scanf("%ld", &aem);
        if(aem == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        res = remove1(&list, aem, atoi(argv[2]));
        if(res == 1) {
          printf("\nR-OK %ld, %d %d\n", aem, list.number_students, list.size);
        }else {
          printf("\nR-NOK %ld, %d %d\n", aem, list.number_students, list.size);
        }
        break;
      }
      case ('m') :{
        scanf("%ld %hd", &aem, &corses);
        if(aem == 0 || corses == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        res = mod(&list, aem, corses);
        if(res == 1){
          printf("\nM-OK %ld\n", aem);
        }else {
          printf("\nM-NOK %ld\n", aem);
        }
        break;
      }
      case ('s') :{
        res2 = sort(&list);
        printf("\nS-OK\n");
        fprintf(stderr, "\n$%lu\n", res2);
        break;
      }
      case ('f') :{
        scanf("%ld", &aem);
        if(aem == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        res = find(&list, aem, &comps);
        if(res == -1) {
          printf("\nF-NOK %ld\n", aem);
          fprintf(stderr, "\n$%ld\n", comps);
          comps = 0;
        }else {
          printf("\nF-OK %s %s %hd\n", list.students_info[res]->name.first_name, 
          list.students_info[res]->name.last_name, list.students_info[res]->corses);
          fprintf(stderr, "\n$%lu\n", comps);
          comps = 0;
        }
        break;
      }
      case ('p') :{
        print(&list);
        break;
      }
      case ('c') :{
        clear(&list);
        printf("\nC-OK\n");
        break;
      }
      case ('q') :{
        clear(&list);
        return 0;
      }
      default : {
        printf("\nInvalid command.\n");
        while(option != '\n') {
          scanf(" %c", &option);
        }
      }
    }
  }
}
/*searches one by one all the students based #
on ther aem and returns its position in the array if it returns 'number_students
it means that the aem was not found*/
int search(listT *list, const int aem, unsigned long int *comps) {
  int i;
  
  for (i = 0; (i < list->number_students) && (aem != list->students_info[i]->aem); i++);
  /*in functions that dont require the comparisons i use NULL pointer as an argument
  and this if protects the program from failling*/
  if(comps != NULL) {
    if(i == list->number_students) {
      *comps = i;
    }else {
      *comps = i + 1;
    }
  }
  return i;
}
/*searches the array with binary search start and finish are the boundries of the search
if it finds the given aem returns the students position in the arry if not returns -1*/
int binary_search(listT *list, const int aem, unsigned long int *comps, int start, int finish) {
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
/*This funtion uses search to find a given aem
if it finds the aem it returns its position else returns -1*/
int find(listT *list, const int aem, unsigned long int *comps) {
  int res;
  //checks for the kind of search
  if(list->sorted == 0) {
    res = search(list, aem, comps);
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
int mod(listT *list, const int aem, const int corses) {
  int res;

  if(list->sorted == 0) {
    res = search(list, aem, NULL);
  } else{
    res = binary_search(list, aem, NULL, 0, list->number_students - 1);
  }

  if(res == list->number_students || res == -1) {
    return -1;
  }else {
    list->students_info[res]->corses = corses;
    return 1;
  }

}
/*this funtion add students in the array if the student already exists returns -1 
if it succeds in adding him returns  1 and if memory allocation fails in any point of he function
it returns 0*/
int add(listT *list, const int aem, const int corses, const char *first_name, const char *last_name, const int change) {
  int res;
  student_infoT **students_info;
  student_infoT *student;
  //checks for the kind of search
  if(list->sorted == 0) {
    res = search(list, aem, NULL);
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
      //saves new entry in dynamic memory
      student = (student_infoT*)malloc(sizeof(student_infoT));
      if(student == NULL) {
        return 0;
      }
      //copies data
      student->aem = aem;
      student->corses = corses;
      strcpy(student->name.first_name, first_name);
      strcpy(student->name.last_name, last_name);
      //assigns pointer
      list->students_info[list->size] = student;
      //changes the size the n of students and assumes the array unsorted
      list->number_students++;
      list->size += change;
      list->sorted = 0;
      return 1;
    }else{
      //the same story but without creating more room
      student = (student_infoT*)malloc(sizeof(student_infoT));
      if(student == NULL) {
        return 0;
      }
      student->aem = aem;
      student->corses = corses;
      strcpy(student->name.first_name, first_name);
      strcpy(student->name.last_name, last_name);
      list->students_info[list->number_students] = student;
      list->number_students++;
      list->sorted = 0;
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
      printf("%ld %s %s %hd\n", list->students_info[i]->aem, list->students_info[i]->name.first_name, list->students_info[i]->name.last_name, list->students_info[i]->corses);
    }
  }
}
//clears all entries and frees every pointer that is uses for dynamic memory allocation
void clear(listT *list) {
  int i;

  for(i = 0; i < list->number_students; i++) {
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
int remove1(listT *list, const int aem, const int change) {
  int res;
  student_infoT *temp; 
  student_infoT **students_info;
  //checks for method of search
  if(list->sorted == 0) {
    res = search(list, aem, NULL);
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
    list->students_info[res] = list->students_info[list->number_students - 1];
    //it free the memory that is used for the students info
    free(temp);
    list->students_info[list->number_students - 1] = NULL;
    //reduces n 0f stud
    list->number_students--;
    //assumes the array unsorted
    list->sorted = 0;
    //checks for reducing the size of the array
    /*change is the number of free spaces which have 
    to appers in order for the array to get smaller*/
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

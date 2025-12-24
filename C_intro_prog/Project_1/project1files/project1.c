/* ONOMATEPWNYMO: 
   AEM:
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
int sort(listT *list);

int main (int argc, char *argv[]) {
	listT list;
  char option, *first_name, *first_name_help, *last_name, *last_name_help;
  unsigned long int aem;
  unsigned short int corses;
  unsigned long int comps = 0;
  int res;
  //unexpected number of arguments
  if(argc > 3) {
    return 42;
  }

  //initialize
  list.size = atoi(argv[1]);
  list.number_students = 0;
  list.sorted = 0;
  list.students_info = (student_infoT**)malloc(atoi(argv[1])*sizeof(student_infoT*));
  if( list.students_info == NULL) {
    return 43;
  }

  while(1) {
    //printf("Type your choice.\n");
    scanf(" %c", &option);
    switch (option) {
      case ('a') :{
        scanf("%ld %ms %ms %hd", &aem, &first_name, &last_name, &corses);
        if(aem == 0 || corses == 0) {
          printf("Invalid input.\n");
          break;
        }
        if(strlen(last_name) > NAMESIZE - 1 || strlen(first_name) > NAMESIZE - 1) {
          printf("\nTrimmed name(s)\n");
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
        if(aem == 0 || corses == 0) {
          printf("\nInvalid input.\n");
          break;
        }
        scanf("%ld %hd", &aem, &corses);
        res = mod(&list, aem, corses);
        if(res == 1){
          printf("\nM-OK %ld", aem);
        }else {
          printf("\nM-NOK %ld", aem);
        }
        break;
      }
      case ('s') :{
        res = sort(&list);
        printf("\nS-OK\n");
        fprintf(stderr, "\n$%d\n", res);
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
          printf("\nF-NOK %ld", aem);
        }else {
          printf("\nF-OK %s %s %hd\n", list.students_info[res]->name.first_name, 
          list.students_info[res]->name.last_name, list.students_info[res]->corses);
          fprintf(stderr, "\n$%ld\n", comps);
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

int search(listT *list, const int aem, unsigned long int *comps) {
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

int binary_search(listT *list, const int aem, unsigned long int *comps, int start, int finish) {
int middle;

  if(start <= finish) {
    middle = (finish - start) / 2 + start;
    if(comps != NULL) {
      (*comps)++;
    }
    if(list->students_info[middle]->aem == aem) {
      return middle;
    }
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
//if it finds it returns its position else -1
int find(listT *list, const int aem, unsigned long int *comps) {
  int res;
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
//if it fails -1 else 1
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
//if it already exists returns -1 if it succeds 1 and if memory allocation fails 0
int add(listT *list, const int aem, const int corses, const char *first_name, const char *last_name, const int change) {
  int res;
  student_infoT **students_info;
  student_infoT *student;

  if(list->sorted == 0) {
    res = search(list, aem, NULL);
  } else{
    res = binary_search(list, aem, NULL, 0, list->number_students - 1);
  }

  if(res == list->number_students || res == -1) {
    if(list->size - list->number_students == 0) {
      students_info = (student_infoT**)realloc(list->students_info, (list->size + change) * sizeof(student_infoT*));
      if(students_info == NULL) {
        return 0;
      }
      list->students_info = students_info;
      student = (student_infoT*)malloc(sizeof(student_infoT));
      if(student == NULL) {
        return 0;
      }
      student->aem = aem;
      student->corses = corses;
      strcpy(student->name.first_name, first_name);
      strcpy(student->name.last_name, last_name);
      list->students_info[list->size] = student;
      list->number_students++;
      list->size += change;
      list->sorted = 0;
      return 1;
    }else{
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

void print(listT *list) {
  int i;

  if(list->students_info != NULL) {
    printf("\n##\n");
    for(i = 0; i < list->number_students; i++) {
      printf("%ld %s %s %hd\n", list->students_info[i]->aem, list->students_info[i]->name.first_name, list->students_info[i]->name.last_name, list->students_info[i]->corses);
    }
    //printf("%d %d\n", list->size, list->number_students);
    printf("\n");
  }
}

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
//if the aem doesnt exist it returns -1 and if it succeds 1
int remove1(listT *list, const int aem, const int change) {
  int res;
  student_infoT *temp; 
  student_infoT **students_info;

  if(list->sorted == 0) {
    res = search(list, aem, NULL);
  } else{
    res = binary_search(list, aem, NULL, 0, list->number_students - 1);
  }

  if(res == list->number_students || res == -1) {
    return -1;
  }else {
    temp = list->students_info[res];
    list->students_info[res] = list->students_info[list->number_students - 1];
    free(temp);
    list->students_info[list->number_students - 1] = NULL;
    list->number_students--;
    list->sorted = 0;
    if(list->size - list->number_students >= change) {
      students_info = (student_infoT**)realloc(list->students_info, (list->size - change) * sizeof(student_infoT*));
      list->students_info = students_info;
      list->size -= change;
      return 1;
    }else {
      return 1;
    }
  }
}

void upper(char *str) {
  int i;

  for(i = 0; str[i] != '\0'; i++) {
    str[i] = toupper(str[i]);
  }
}

int sort(listT *list) {
    int i, j, comps = 0;
    student_infoT *key;

    for(i = 1; i < list->number_students; i++) {
        key = list->students_info[i];
        j = i - 1;

        while(j >= 0 && list->students_info[j]->aem > key->aem) {
            comps++;
            list->students_info[j + 1] = list->students_info[j];
            j = j - 1;
        }
        if(j > 0) {
          comps++;
        }
        list->students_info[j + 1] = key;
    }
    list->sorted = 1;
    return comps;
}
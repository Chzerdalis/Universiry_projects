#include <stdio.h>
#include <ucontext.h>
#include <stdlib.h>
#include <signal.h>
#include <stdbool.h>
#define STACK_SIZE 8000 //8KB
#define BUFFER_SIZE 10000

typedef struct {
    ucontext_t context;
    ucontext_t *co_swap;
} co_t;

typedef struct {
    char data[BUFFER_SIZE];
    int size;
    bool end;
} buffer_t;

typedef struct  {
    buffer_t *arg_buffer;
    co_t *arg_context;
}args_t;

char *input;

int mycoroutines_init(co_t *main_co);
int mycoroutines_create(co_t *co, void (*body)(void*), void *arg);
int mycoroutines_switchto(co_t *co);
int mycoroutines_destroy(co_t *co);

void producer(void *args);
void consumer(void *args);

int main(int argc, char *argv[]) {
    if (argc != 2) {
        printf("give file name!\n");
        return (0);
    }
    co_t main_co, producer_co, consumer_co;
    buffer_t buffer;
    args_t arg1, arg2;
    int result;
    char command[100];


    //Get the name of the file we are copying from the args   
    input = argv[1];

    //Give as argument the shared buffer
    arg1.arg_buffer = &buffer;
    arg2.arg_buffer = &buffer;

    //Initialize all coroutines, the arg_context part of the structure is used
    //to init the context uc_link so the coroutines terminate correctly
    mycoroutines_init(&main_co);
    arg1.arg_context = &main_co;
    mycoroutines_create(&producer_co, producer, &arg1);
    arg2.arg_context = &producer_co;
    mycoroutines_create(&consumer_co, consumer, &arg2);
    
    //Set co_swap parameter so the coroutines swap correctly
    producer_co.co_swap = &consumer_co.context;
    consumer_co.co_swap = &producer_co.context; 

    // Link the main coroutine to the producer
    main_co.co_swap = &producer_co.context;

    // Initialize shared buffer
    buffer.size = 0;
    buffer.end = false;

    // Start with the main coroutine (switch to producer)
    mycoroutines_switchto(&main_co);

    // Producer finished execution

    // Cleanup
    mycoroutines_destroy(&main_co);
    mycoroutines_destroy(&producer_co);
    mycoroutines_destroy(&consumer_co);

    //Execute linux diff command
    sprintf(command,"diff output %s", input);
    printf("%s", command);
    result = system(command);
    if (result  == 0) {
        printf("\n diff exited 0, files are identical!\n");
    }
    else {
        printf("something went wrong :( ,diff result : %d\n", result);
    }

    return 0;
}

// Simple main initialization
int mycoroutines_init(co_t *main_co) {
    if (getcontext(&main_co->context) == -1 ) {
        return (-1);
    }
    return (0);
}

//Create and initialize a coroutine
int mycoroutines_create(co_t *co, void (*body)(void*), void *arg) {
    args_t *arguments = (args_t  *) arg;

    if (getcontext(&co->context) == -1 ) {
        return (-1);
    }
    co->context.uc_link = &arguments->arg_context->context;
    co->context.uc_stack.ss_sp = malloc(STACK_SIZE);
    co->context.uc_stack.ss_size = STACK_SIZE;
    arguments->arg_context = co;
    makecontext(&co->context, (void (*)(void))body, 1, arguments);
    return (0);
}

int mycoroutines_switchto(co_t *co) {
    if(swapcontext(&co->context,  co->co_swap) == -1) {
        return (-1);
    }
    return 0;
}

int mycoroutines_destroy(co_t *co) {
    free(co->context.uc_stack.ss_sp);
    return 0;
}

void producer(void *args) {
    args_t *arguments = (args_t *) args; 
    buffer_t *buffer = arguments->arg_buffer;
    co_t *context = arguments->arg_context;
    int filesize = 0, bytesRead = 0, input_size = 0; 

    // Open input file for reading
    FILE *input_file = fopen(input, "r");
    if (!input_file) {
        perror("Error opening input file");
        exit(EXIT_FAILURE);
    }
    // Get file size
	if( fseek(input_file,0,SEEK_END) == -1 ) {
		printf("error\n");
		exit(-1); 
	}
	filesize = ftell(input_file);
	rewind(input_file);
    
    //Read untill we read the whole file
    while (bytesRead != filesize) {
        //if buffer is full switch to consumer
        while (buffer->size == BUFFER_SIZE) {
            mycoroutines_switchto(context);
        }
        
        input_size = fread(buffer->data, 1 , BUFFER_SIZE, input_file);
        bytesRead += input_size;
        buffer->size += input_size; 
        //Case where error occured or bytes read dont exceed buffer size
        if ( input_size != BUFFER_SIZE || input_size == 0) {
            if (input_size == 0) {
                perror("");
                exit (0);
            }
            if (bytesRead == filesize) {
                break;
            }
        }
    }

    //We read all file contents so write the remaining bytes onto the copy file
    buffer->end = true;
    mycoroutines_switchto(context);

    printf("Producer exiting\n");

    // Close input file
    fclose(input_file);
    return;
}

void consumer(void *args) {
    args_t *arguments = (args_t *) args; 
    buffer_t *buffer = arguments->arg_buffer;
    co_t *context = arguments->arg_context;
    int i;

    // Open output file for writing
    FILE *output_file = fopen("output", "w");
    if (!output_file) {
        perror("Error opening output file");
        exit(EXIT_FAILURE);
    }

    //Write while there is data to be written and signal hasnt been sent by producer
    while (buffer->size > 0 || buffer->end != true) {
        //If buffer is empty and signal hasnt been sent switch to producer
        while (buffer->size == 0 && buffer->end != true) {
            mycoroutines_switchto(context);
        }
        //if buffer isnt full write the remaining data
        if(buffer->size < BUFFER_SIZE) {
            for ( i = 0; i < buffer->size; i++) {
                fwrite(&buffer->data[i], 1, 1, output_file);
            }
        }
        else {
            fwrite(buffer->data, 1, BUFFER_SIZE, output_file);
        }
        buffer->size = 0;
    }
    
    printf("CONSUMER EXITING\n");
    // Close output file
    fclose(output_file);
    return ;
}
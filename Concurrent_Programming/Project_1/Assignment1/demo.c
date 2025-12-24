#include"p_pipe.h"
#include<unistd.h>
#include<fcntl.h>
#include<pthread.h>
#define PERM1 O_RDONLY|O_SYNC
#define PERM2 O_RDWR|O_TRUNC|O_CREAT|O_SYNC
#define PERM3 O_WRONLY|O_CREAT|O_TRUNC|O_SYNC
#define MODE 0644 //owner read and write perms and other members only read

typedef struct info{
    int p1;
    int p2;
}info_t;

bool b1 = false;
bool b2 = false;

void *write_thread(void* arg){  
    char buff;
    info_t inf = *(info_t *)arg;

    int fd1 = open("test1.jpeg",PERM1,MODE);
    int fd3 = open("test_copy2.jpeg",PERM3,MODE);
    if(fd1 == -1 || fd3 == -1){
        exit(-1);
    }

    //reads from original file writes to pipe 1
    if(lseek(fd1,0,SEEK_SET) == -1) exit(-1);
    while(read(fd1,&buff,sizeof(char)) == 1){
        pipe_write(inf.p1,buff);
    }
    pipe_writeDone(inf.p1);
    close(fd1);

    //reads from pipe2 writes to second copy
    if(lseek(fd3,0,SEEK_SET) == -1) exit(-1);
    while(pipe_read(inf.p2,&buff)){
        if(write(fd3,&buff,sizeof(char)) == -1) exit(-1);
    }
    close(fd3);

    //sets thread to ready
    b1 = true;
    return NULL;
}

void *read_thread(void* arg){
    char buff;
    info_t inf= *(info_t *)arg;

    int fd2=open("test_copy1.jpeg",PERM2,MODE);
    if(fd2 == -1){
        exit(-1);
    }

    //reads from pipe 1 writes to copy 1
    if(lseek(fd2,0,SEEK_SET) == -1) exit(-1);
    while(pipe_read(inf.p1,&buff)){
        write(fd2,&buff,sizeof(char));
    }

    //reads from copy 1 writes to pipe 2
    if(lseek(fd2,0,SEEK_SET) == -1) exit(-1);
    while(read(fd2,&buff,sizeof(char)) == 1){
        pipe_write(inf.p2,buff);
    }
    close(fd2);
    pipe_writeDone(inf.p2);

    //sets thread to ready
    b2 = true;
    return NULL;
}

int main(int argc,char *argv[]){
    pthread_t t1,t2;
    info_t payload;
    //open pipes
    int pd1 = pipe_open(64);
    int pd2 = pipe_open(64);
    payload.p1 = pd1;
    payload.p2 = pd2;
    //call threads
    pthread_create(&t1,NULL,&write_thread,(void *)&payload);
    pthread_create(&t2,NULL,&read_thread,(void *)&payload);

    //wait to finish
    while(b1 == false || b2 == false);
    
    return 0;
}
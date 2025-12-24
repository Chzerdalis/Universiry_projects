#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>
#include<signal.h>

int main (int argc, char *argv[]) {
	int sig;
	int i;
	for (i=1; i<argc; i++) {
		printf("%s ", argv[i]);
	}
	if (argc > 1) {
		printf("\n");
		fflush(stdout);
	}
	kill(getpid(), SIGSEGV);
	return 0;
}

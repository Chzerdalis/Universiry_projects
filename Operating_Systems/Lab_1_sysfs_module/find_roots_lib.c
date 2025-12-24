#include <stdio.h>
#include "roots.h"


int main(int argc, char *argv[]) {	
	int ret = find_roots();
	
	printf("Returned %d\n", ret);

	return(1);
}

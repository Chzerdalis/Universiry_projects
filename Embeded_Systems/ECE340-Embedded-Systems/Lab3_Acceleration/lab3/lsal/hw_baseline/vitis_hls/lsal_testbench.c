#include "lsal.h"

#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include <time.h>
#include <unistd.h>
#include <assert.h>
#include <stdbool.h>
#include <sys/types.h>
#include <sys/stat.h>

#define N 33
#define M 65537

/************************************************************************/

/*
 return a random number in [0, limit].
 */
int rand_lim(int limit) {

	int divisor = RAND_MAX / (limit + 1);
	int retval;

	do {
		retval = rand() / divisor;
	} while (retval > limit);

	return retval;
}

/*
 Fill the string with random values
 */
void fillRandom(char* string, int dimension) {
	//fill the string with random letters..
	static const char possibleLetters[] = "ATCG";

	string[0] = '-';

	int i;
	for (i = 1; i < dimension; i++) {
		int randomNum = rand_lim(3);
		string[i] = possibleLetters[randomNum];
	}

}

/* ******************************************************************/
int main(int argc, char** argv) {
	int print_flag = 0;
	int i = 0;

    printf("Starting Local Alignment Code \n");
	fflush(stdout);

    char *query = (char*) malloc(sizeof(char) * N);
	char *database = (char*) malloc(sizeof(char) * M);
	int *similarity_matrix = (int*) malloc(sizeof(int) * N * M);
	short *direction_matrix = (short*) malloc(sizeof(short) * N * M);
	int *max_index = (int *) malloc(sizeof(int));

	/* Create the two input strings by calling a random number generator */
	fillRandom(query, N);
	fillRandom(database, M);

	memset(similarity_matrix, 0, sizeof(int) * N * M);
	memset(direction_matrix, 0, sizeof(short) * N * M);

	compute_matrices(query, database, max_index, similarity_matrix, direction_matrix);

	printf(" max index is %d \n", max_index[0]);
    printf(" max index is in position (%d, %d) \n", max_index[0]/N, max_index[0]%N );

	if (print_flag) {
		printf("Query: ");
		for (i = 0; i < N; i++)
			printf("%c ", query[i]);
		printf("\n");

		printf("Database: ");
		for (i = 0; i < M; i++)
			printf("%c ", database[i]);
		printf("\n");

		printf("Similarity Matrix:\n");
		for (i = 0; i < M; i++) {
			for (int j = 0; j < N; j++)
				printf("%3d ", similarity_matrix[i * N + j]);
			printf("\n");
		}
		printf("\n");

		printf("Direction Matrix:\n");
		for (i = 0; i < M; i++) {
			for (int j = 0; j < N; j++)
				printf("%s ", direction_matrix[i * N + j] == 0 ? " C" :
							  (direction_matrix[i * N + j] == 1 ? " N" :
							  (direction_matrix[i * N + j] == 2 ? "NW" : " W")));
			printf("\n");
		}
	}

	free(query);
	free(database);
	free(similarity_matrix);
	free(direction_matrix);
	free(max_index);

    // printf("cnt_ops=%d, cnt_bytes=%d\n", cnt_ops, cnt_bytes);
	return EXIT_SUCCESS;
}

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
#include "lsal.hpp"

/**********************************************************************************************
 * LSAL algorithm
 * Inputs:
 *          string1 is the query[N]
 *          string2 is the database[M]
 *          input sizes N, M
 * Outputs:
 *           max_index is the location of the highest similiarity score 
 *           similarity and direction matrices. Note that these two matrices are initialized with zeros.
 **********************************************************************************************/
void compute_matrices_golden(char *query, char *database, int *max_index,
					  int *similarity_matrix, short *direction_matrix, int N_g, int M_g) {
    // Following values are used for the N, W, and NW values wrt. similarity_matrix[i]
    int north = 0;
	int west = 0;
	int northwest = 0;
	int max_value = 0;
	int global_max = 0;
	short direction = 0;
	short match = 0;
	int row = 0;
	int prev_row = 0;

	// Scan the N*M array row-wise starting from the second row.
	for (int i = 1; i < M_g; i++) {
		for (int j = 1; j < N_g; j++) {
			row = i * N_g;
			prev_row = (i - 1) * N_g;
			// Calculate the north, west, and northwest values
			match = ( query[j] == database[i] ) ? MATCH : MISS_MATCH;

			north = similarity_matrix[prev_row + j] + GAP_i;
			northwest = match + similarity_matrix[prev_row + j - 1];
			west = similarity_matrix[row + j - 1] + GAP_d;

			// Determine the maximum value around the current cell
			max_value = north;
			direction = NORTH;

			if (northwest > max_value) {
				max_value = northwest;
				direction = NORTH_WEST;
			}

			if (west > max_value) {
				max_value = west;
				direction = WEST;
			}

			if (max_value < 0) {
				max_value = 0;
				direction = CENTER;
			}

			// Update the similarity and direction matrices
			similarity_matrix[row + j] = max_value;
			direction_matrix[row + j] = direction;

			// Find the maximum value of the similarity matrix, keep track of the index
			if (max_value > global_max) {
				global_max = max_value;
				max_index[0] = row + j;
			}
		}
	}
}
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

	int i;
	for (i = 0; i < dimension; i++) {
		int randomNum = rand_lim(3);
		string[i] = possibleLetters[randomNum];
	}

}

void fillRandom_2(char* string, int dimension) {
	//fill the string with random letters..
	static const char possibleLetters[] = "ATCG";
	int i;

	for (i = 0; i < dimension; i++) {
        if(i < N - 1) {
            string[i] = '#';
        }else if(i >= dimension - N + 1) {
            string[i] = '#';
        }else{
            int randomNum = rand_lim(3);
            string[i] = possibleLetters[randomNum];
	    }
    }
}

/* ******************************************************************/
int main(int argc, char** argv) {

    clock_t t1, t2;
 
    printf("Starting Local Alignment Code \n");
	fflush(stdout);

    char *query = (char*) malloc(sizeof(char) * N);
	char *query_golden = (char*) malloc(sizeof(char) * (N+1));

	char *database = (char*) malloc(sizeof(char) * M);

	int *similarity_matrix = (int*) malloc(sizeof(int) * (N+1) * M);

	char *direction_matrix = (char*) malloc(sizeof(char) * N * M);
	short *direction_matrix_golden = (short*) malloc(sizeof(short) * (N+1) * M);

	int *max_index = (int *) malloc(sizeof(int));
	int *max_index_golden = (int *) malloc(sizeof(int));


	/* Create the two input strings by calling a random number generator */
	fillRandom(query, N);
	fillRandom_2(database, M);

	query_golden[0] = '-';
	memcpy(query_golden + 1, query, sizeof(char) * N);

	memset(similarity_matrix, 0, sizeof(int) * N * M);
	memset(direction_matrix, 0, sizeof(short) * N * M);

    t1 = clock();
	compute_matrices(query, database, max_index, direction_matrix);
	t2 = clock();

	compute_matrices_golden(query_golden, database, max_index_golden, similarity_matrix, direction_matrix_golden, N + 1, M);

	printf(" max index is %d similarity value %d\n", max_index[0], similarity_matrix[max_index[0]]);
    printf(" max index is in position (%d, %d) \n", max_index[0]/N, max_index[0]%N);
	printf(" max index golden is in position (%d, %d) \n", max_index_golden[0]/(N+1), max_index_golden[0]%(N + 1) - 1);
	printf(" execution time of LSAL SW algorithm is %f sec \n", (double)(t2-t1) / (CLOCKS_PER_SEC));

	int i, j, k ,p ,h;

//	printf("Query: ");
//	for (i = 0; i < N; i++)
//		printf("%c ", query[i]);
//	printf("\n");
//
//	printf("Query_golden: ");
//	for (i = 0; i < N + 1; i++)
//		printf("%c ", query_golden[i]);
//	printf("\n");
//
//	printf("Database: ");
//	for (i = 0; i < M; i++)
//		printf("%c ", database[i]);
//	printf("\n");
//
//	printf("\n");
//
//	printf("Direction Matrix:\n");
//	for (i = 0; i < M - 2*(N - 1); i++) {
//		k = i;
//		for (j = 0; j < N; j++) {
//			h = N - 1 - j;
//			p = k + j;
//			printf("%s ", direction_matrix[p * N + h] == 0 ? " C" :
//						  (direction_matrix[p * N + h] == 1 ? " N" :
//						  (direction_matrix[p * N + h] == 2 ? "NW" : " W")));
//		}
//		printf("\n");
//	}
//	printf("\n");
//	printf("\n");
//	for (i = N - 1; i < M - N + 1; i++) {
//		for ( j = 1; j < N + 1; j++)
//			printf("%s ", direction_matrix_golden[i * (N+1) + j] == 0 ? " C" :
//						  (direction_matrix_golden[i * (N+1) + j] == 1 ? " N" :
//						  (direction_matrix_golden[i * (N+1) + j] == 2 ? "NW" : " W")));
//		printf("\n");
//	}


	for (i = N - 1; i < M - N + 1; i++) {
		k = i - N + 1;
		for (j = 0; j < N; j++) {
			h = N - 1 - j;
			p = k + j;
			if(direction_matrix[p * N + h] != direction_matrix_golden[i * (N+1) + j + 1]) {
				printf("Error in direction matrix at (%d, %d)\n", i, j);
				return EXIT_FAILURE;
			}
		}
	}
	printf(" \nDirection matrix is correct\n\n");
	
	// free(query);
	// free(query_golden);
	// free(direction_matrix_golden);
	// free(max_index_golden);
	// free(database);
	// free(similarity_matrix);
	// free(direction_matrix);
	// free(max_index);

    // printf("cnt_ops=%d, cnt_bytes=%d\n", cnt_ops, cnt_bytes);
	return EXIT_SUCCESS;
}

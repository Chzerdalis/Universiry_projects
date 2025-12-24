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

// #define N 256
// #define M 2048

const short GAP_i = -1;
const short GAP_d = -1;
const short MATCH = 2;
const short MISS_MATCH = -1;
const short CENTER = 0;
const short NORTH = 1;
const short NORTH_WEST = 2;
const short WEST = 3;
// static long int cnt_ops=0;
// static long int cnt_bytes=0;

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

void compute_matrices(char *query, char *database, int *max_index,
					  int *similarity_matrix, short *direction_matrix, int N, int M) {
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
	OUTER_LOOP: for (int i = 1; i < M; i++) {
		INNER_LOOP: for (int j = 1; j < N; j++) {
			row = i * N;
			prev_row = (i - 1) * N;

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

			if (max_value <= 0) {
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

	string[0] = '-';

	int i;
	for (i = 1; i < dimension; i++) {
		int randomNum = rand_lim(3);
		string[i] = possibleLetters[randomNum];
	}

}

/* ******************************************************************/
int main(int argc, char** argv) {

    clock_t t1, t2;
	int print_flag = 0;

	if (argc < 3 || argc > 5) {
		printf("%s <Query Size N> <DataBase Size M> [Print Databases 1|0]\n", argv[0]);
		return EXIT_FAILURE;
	}
 
    printf("Starting Local Alignment Code \n");
	fflush(stdout);

	/* Typically, M >> N */
	int N = atoi(argv[1]) + 1; 
    int M = atoi(argv[2]) + 1;

	if (argc >= 4)
		print_flag = atoi(argv[3]);

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

	t1 = clock();
	//#pragma omp parallel
	compute_matrices(query, database, max_index, similarity_matrix, direction_matrix, N, M);
	//# pragma omp barrier
	t2 = clock();

	printf(" max index is %d %d\n", max_index[0], similarity_matrix[max_index[0]]);
    printf(" max index is in position (%d, %d) \n", max_index[0]/N, max_index[0]%N );
	printf(" execution time of LSAL SW algorithm is %f sec \n", (double)(t2-t1) / CLOCKS_PER_SEC);

	if (print_flag) {
		printf("Query: ");
		for (int i = 0; i < N; i++)
			printf("%c ", query[i]);
		printf("\n");

		printf("Database: ");
		for (int i = 0; i < M; i++)
			printf("%c ", database[i]);
		printf("\n");

		printf("Similarity Matrix:\n");
		for (int i = 0; i < M; i++) {
			for (int j = 0; j < N; j++)
				printf("%3d ", similarity_matrix[i * N + j]);
			printf("\n");
		}
		printf("\n");

		printf("Direction Matrix:\n");
		for (int i = 0; i < M; i++) {
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

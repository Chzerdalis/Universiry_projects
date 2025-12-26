#include "lsal.h"

#define N 33
#define M 65537

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
					  int *similarity_matrix, short *direction_matrix) {
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

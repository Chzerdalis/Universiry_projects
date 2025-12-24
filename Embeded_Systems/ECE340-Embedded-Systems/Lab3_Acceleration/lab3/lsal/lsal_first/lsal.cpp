#include <stdio.h>
#include <string.h>
// #include <ap_int.h>

#include "lsal.hpp"

#define P (N+1)

void compute_matrices(char *query, char *database, int *max_index, short *direction_matrix) {
	    // Following values are used for the N, W, and NW values wrt. similarity_matrix[i]
	    int global_max = 0;
	    int *max_index_temp;
	    // Parallelize the diagonal computation

	    int i, j, k;
	    short diag_array_1[N + 1];
	    short diag_array_2[N + 1];
	    short diag_array_3[N + 1];


	    char querry_buff[N];
	    char database_buff[M];

	    short direction_buff[N];


		MEM_1: memset(diag_array_1, 0, sizeof(short) * (N+1));
		MEM_2: memset(diag_array_2, 0, sizeof(short) * (N+1));
		MEM_3: memset(diag_array_3, 0, sizeof(short) * (N+1));

		MEM_4: memcpy(querry_buff, query, sizeof(char) * N);
		MEM_5: memcpy(database_buff, database, sizeof(char) * M);

	    OUTER_LOOP: for (int k = 0; k < M - N + 1; k = k + 1) {
	        INNER_LOOP: for (i = 0; i < N; i++) {
	            j = N - 1 - i;

	            short match = (querry_buff[j] == database_buff[i + k]) ? MATCH : MISS_MATCH;
	            int north = diag_array_2[i] + GAP_i;
	            int northwest = match + diag_array_1[i + 1];
	            int west = diag_array_2[i + 1] + GAP_d;

	            int max_value = north;
	            short direction = NORTH;

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
	            //direction_matrix[(i+k) * N + j] = direction;
	            direction_buff[i] = direction;
	            diag_array_3[i] = max_value;

	            // Update thread-local maximum           max_value

				if (max_value > global_max) {
					global_max = max_value;
					max_index[0] = (i + k) * N + j;
				}

	        }

	        MEM_6: memcpy(diag_array_1, diag_array_2, sizeof(short) * (N+1));
	        MEM_7: memcpy(diag_array_2, diag_array_3, sizeof(short) * (N+1));


	        DIR_LOOP: for(i = 0; i < N; i++) {
	            j = N - 1 - i;
	            direction_matrix[(i+k) * N + j] = direction_buff[i];
	        }
	    }
	//*max_index = max_index_temp[0];
}


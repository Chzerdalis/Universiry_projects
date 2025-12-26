#include <stdio.h>
#include <string.h>
#include "lsal.hpp"

#define P (N+1)

//extern "C" {
void compute_matrices(char *query, char *database, int *max_index, char *direction_matrix) {
	    // Following values are used for the N, W, and NW values wrt. similarity_matrix[i]
		short max_value_temp = 0;
        int max_idx_temp = 0;
	    // Parallelize the diagonal computation

        int i, j, k;
	    short diag_array_1[N + 1];
#pragma HLS ARRAY_PARTITION variable=diag_array_1 dim=1 factor=32 cyclic
#pragma HLS BIND_STORAGE variable=diag_array_1 type=ram_t2p
	    short diag_array_2[N + 1];
#pragma HLS ARRAY_PARTITION variable=diag_array_2 dim=1 factor=32 cyclic
#pragma HLS BIND_STORAGE variable=diag_array_2 type=ram_t2p
	    short diag_array_3[N + 1];
#pragma HLS BIND_STORAGE variable=diag_array_3 type=ram_t2p impl=bram
#pragma HLS ARRAY_PARTITION variable=diag_array_3 dim=1 factor=16 cyclic

	    short max_value_arr[N];
#pragma HLS ARRAY_PARTITION variable=max_value_arr dim=1 factor=16 cyclic
#pragma HLS BIND_STORAGE variable=max_value_arr type=ram_t2p impl=bram
        int max_index_arr[N];
#pragma HLS ARRAY_PARTITION variable=max_index_arr dim=1 factor=16 cyclic
#pragma HLS BIND_STORAGE variable=max_index_arr type=ram_t2p

	    char querry_buff[N];
#pragma HLS ARRAY_PARTITION variable=querry_buff dim=1 factor=16 cyclic
#pragma HLS BIND_STORAGE variable=querry_buff type=ram_1wnr impl=bram
	    char database_buff[N+1];
#pragma HLS ARRAY_PARTITION variable=database_buff dim=1 factor=16 cyclic
#pragma HLS BIND_STORAGE variable=database_buff type=ram_1wnr impl=bram

	    char direction_buff[N];
#pragma HLS ARRAY_PARTITION variable=direction_buff dim=1 factor=16 cyclic
#pragma HLS BIND_STORAGE variable=direction_buff type=ram_t2p impl=bram


		MEM_1: memset(diag_array_1, 0, sizeof(short) * (N+1));
		MEM_2: memset(diag_array_2, 0, sizeof(short) * (N+1));
		MEM_3: memset(diag_array_3, 0, sizeof(short) * (N+1));

		MEM_4: memcpy(querry_buff, query, sizeof(char) * N);
		MEM_5: memcpy(database_buff + 1, database, sizeof(char) * N);
		//MEM_5: memcpy(database_buff, database, sizeof(char) * M);


//		COPY: for (k = 0; k < M; k++) {
//#pragma HLS PIPELINE
//			database_buff[k] = database[k];
//		}

        MEM_8: memset(max_value_arr, 0, sizeof(short) * N);
		MEM_9: memset(max_index_arr, 0, sizeof(int) * N);

	    OUTER_LOOP: for (k = 0; k < M - N + 1; k = k + 1) {
#pragma HLS PIPELINE

	    	for(i = 1; i < N; i++) {
	    		database_buff[i - 1] = database_buff[i];
	    	}
	    	database_buff[N-1] = database[k + N - 1];

	        INNER_LOOP: for (i = 0; i < N; i++) {
#pragma HLS UNROLL
	            j = N - 1 - i;
	            short match = (querry_buff[j] == database_buff[i]) ? MATCH : MISS_MATCH;
	            short north = diag_array_2[i] + GAP_i;
	            short northwest = match + diag_array_1[i + 1];
	            short west = diag_array_2[i + 1] + GAP_d;

	            short max_value = north;
	            char direction = NORTH;

	            if (max_value < northwest) {
	            	max_value = northwest;
	            	direction = NORTH_WEST;
	            }
	            if (max_value < west) {
	            	max_value = west;
	            	direction = WEST;
	            }
	            if (max_value <= 0) {
	            	max_value = 0;
	            	direction = CENTER;
	            }

	            direction_buff[i] = direction;
	            diag_array_3[i] = max_value;

                if(max_value > max_value_arr[i]) {
                    max_value_arr[i] = 	max_value;
                    max_index_arr[i] = (i + k) * N + j;
                }
	        }
	        memcpy(direction_matrix + (k*N), direction_buff, sizeof(char)*N);
	        memcpy(diag_array_1, diag_array_2, sizeof(short)*P);
	        memcpy(diag_array_2, diag_array_3, sizeof(short)*P);
	    }
		MAX_LOOP: for(i = 0; i < N; i++) {
#pragma HLS PIPELINE
			if(max_value_arr[i] > max_value_temp) {
				max_value_temp = max_value_arr[i];
				max_idx_temp = max_index_arr[i];
			}
		}
		*max_index = max_idx_temp;
}
//}

#ifndef LSAL_H_
#define LSAL_H_

#define N_no_pad 32
#define M_no_pad 65536

#define N (N_no_pad)
#define M (M_no_pad + 2 * (N - 1))

#define GAP_i -1
#define GAP_d -1
#define MATCH 2
#define MISS_MATCH -1
#define CENTER 0
#define NORTH 1
#define NORTH_WEST 2
#define WEST 3

void compute_matrices(char *query, char *database, int *max_index, char *direction_matrix);

#endif

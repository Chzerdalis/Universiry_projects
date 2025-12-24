#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <sys/time.h>
#include "clahe.h"

double get_time_sec() {
    struct timeval tv;
    gettimeofday(&tv, NULL);
    return tv.tv_sec + tv.tv_usec * 1e-6;
}

int main(int argc, char *argv[]){
    PGM_IMG img_in, img_out;
    double start, end, elapsed;
    char input_path[512];
    char output_path[512];
    
    if (argc != 3) {
        printf("Usage: %s <input.pgm> <output.pgm>\n", argv[0]);
        printf("Example: %s small.pgm result.pgm\n", argv[0]);
        printf("(Reads from ./input/ and writes to ./output/)\n");
        return 1;
    }

    sprintf(input_path, "input/%s", argv[1]);
    sprintf(output_path, "output/%s", argv[2]);

    printf("Loading image from: %s\n", input_path);
    img_in = read_pgm(input_path);
    
    printf("Running GPU CLAHE reference...\n");
    start = get_time_sec();
    
    img_out = apply_clahe(img_in);
    
    end = get_time_sec();
    elapsed = end - start;
    
    printf("Processing time: %.6f seconds\n", elapsed);
    printf("Throughput: %.2f MPixels/s\n", (img_in.w * img_in.h) / (elapsed * 1e6));

    write_pgm(img_out, output_path);
    printf("Result saved to %s\n", output_path);

    free_pgm(img_in);
    cudaDeviceReset();
    free_pgm(img_out);

    return 0;
}

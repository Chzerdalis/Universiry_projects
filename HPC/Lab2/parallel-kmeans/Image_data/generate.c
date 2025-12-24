#include <stdio.h>
#include <stdlib.h>
#include <time.h> // For seeding rand()

/*
* This program generates a synthetic binary data file for
* the k-means algorithm.
*
* File Format:
* - int: numObjs
* - int: numCoords
* - float[numObjs * numCoords]: data
*/
int main(int argc, char *argv[]) {
    if (argc != 4) {
        fprintf(stderr, "Usage: %s <output_file.bin> <num_objects> <num_coords>\n", argv[0]);
        fprintf(stderr, "Example: %s big_data.bin 100000 32\n", argv[0]);
        return 1;
    }

    char *filename = argv[1];
    int numObjs = atoi(argv[2]);
    int numCoords = atoi(argv[3]);

    if (numObjs <= 0 || numCoords <= 0) {
        fprintf(stderr, "Error: num_objects and num_coords must be positive integers.\n");
        return 1;
    }

    FILE *file = fopen(filename, "wb"); // Open for "write binary"
    if (!file) {
        perror("Error opening file");
        return 1;
    }

    // 1. Write the header
    if (fwrite(&numObjs, sizeof(int), 1, file) != 1) {
        perror("Error writing numObjs");
        fclose(file);
        return 1;
    }
    if (fwrite(&numCoords, sizeof(int), 1, file) != 1) {
        perror("Error writing numCoords");
        fclose(file);
        return 1;
    }

    // Seed the random number generator
    srand(time(NULL));

    // 2. Write the data
    // We create a buffer for one object to be memory-efficient
    float *object_buffer = (float*) malloc(numCoords * sizeof(float));
    if (!object_buffer) {
        fprintf(stderr, "Error allocating memory for object buffer.\n");
        fclose(file);
        return 1;
    }

    printf("Generating file %s (%d objects, %d coords)...\n", filename, numObjs, numCoords);

    for (int i = 0; i < numObjs; i++) {
        // Fill the object with random floats [0.0, 1.0]
        for (int j = 0; j < numCoords; j++) {
            object_buffer[j] = (float)rand() / (float)RAND_MAX;
        }
        
        // Write the entire object's data at once
        if (fwrite(object_buffer, sizeof(float), numCoords, file) != numCoords) {
            perror("Error writing object data");
            free(object_buffer);
            fclose(file);
            return 1;
        }
    }

    // Clean up
    free(object_buffer);
    fclose(file);

    printf("Successfully created %s.\n", filename);
    return 0;
}
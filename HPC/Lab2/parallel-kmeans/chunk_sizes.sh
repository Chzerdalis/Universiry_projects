#!/bin/bash

NUM_THREADS=56

output_file="chunk_size_results.txt"
> "$output_file"

file="Image_data/texture17695.bin"

chunk_sizes=(1 4 8 16 32 128 512 1000)

runs=20

echo "File: $file" >> "$output_file"
echo "" >> "$output_file"

printf "%s" " " >> "$output_file"
for chunk in "${chunk_sizes[@]}"; do
    printf "chunk%-6s" "$chunk" >> "$output_file"
done
printf "\n" >> "$output_file"

for ((i=1; i<=runs; i++)); do
    echo "Run $i"
    line=""
    for chunk in "${chunk_sizes[@]}"; do
        output=$(./seq_main -o -b -n 2000 -i "$file" -p "$NUM_THREADS" -x "$chunk" 2>&1)
        
        runtime=$(echo "$output" | grep "Computation timing" | awk '{print $4}')
        
        if [ -z "$runtime" ]; then
            runtime="ERROR"
        fi
        
        line+="$runtime "
        echo "Chunk size $chunk: $runtime seconds"
    done
    echo "$line" >> "$output_file"
done

echo "" >> "$output_file"

echo "All runs complete. Results saved to $output_file"
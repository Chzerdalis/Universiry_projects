#!/bin/bash

NUM_CHUNKS=$1
if [ -z "$NUM_CHUNKS" ]; then
    echo "Usage: $0 <num_chunks>"
    exit 1
fi

output_file="run_times.txt"
> "$output_file"

files=("Image_data/texture17695.bin")

threads=(1 4 8 14 28 56)
runs=20

for file in "${files[@]}"; do
    echo "File: $file" >> "$output_file"
    echo "" | tee -a "$output_file"

    printf "%s" " " >> "$output_file"
    for t in "${threads[@]}"; do
        printf "thread%-6s" "$t" >> "$output_file"
    done
    printf "\n" >> "$output_file"

    for ((i=1; i<=runs; i++)); do
        line=""
        for t in "${threads[@]}"; do
            output=$(./seq_main -o -b -n 2000 -i "$file" -p "$t" -x "$NUM_CHUNKS")

            runtime=$(echo "$output" | grep "Computation timing" | awk '{print $4}')

            line+="$runtime "
        done
        echo "$line" >> "$output_file"
    done

    echo "" >> "$output_file"
done

echo "All runs complete. Results saved to $output_file"

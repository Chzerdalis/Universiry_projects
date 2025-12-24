#!/bin/bash

clear;
gcc -Wall -g ask2.c -o ask2 -lrt

# Function to run ask2 with different worker thread counts
run_ask2() {
    threads=$1
    output_file="ask2_out${threads}.txt"

    echo "Ask2 is running with ${threads} worker threads..."
    time ./ask2 ${threads} <primes50.txt > "${output_file}"
    grep time "${output_file}"
    echo "----------------------------------------"
}

# Run ask2 with different thread counts
run_ask2 1
run_ask2 4
run_ask2 8
run_ask2 10
run_ask2 20
run_ask2 40
run_ask2 60
run_ask2 80
run_ask2 150

# Clean up
rm ask2_out*.txt

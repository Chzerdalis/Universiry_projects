
RUNS=20
INPUT_FILE="input.grey"
CSV_FILE="benchmark_results.csv"
TEMP_OUTPUT="temp_output.grey"

EXECUTABLES=(
    "v0"
    "v1"
    "v2"
    "v3"
    "v4"
    "v5"
    "v6"
    "v6_1"
    "v7"
    "v7_1"
)

# Function to run benchmark for a single executable
benchmark_executable() {
    local exec_name="$1"
    local times=()
    
    echo "Benchmarking $exec_name..."
    
    for ((run=1; run<=RUNS; run++)); do
        echo -n "  Run $run/$RUNS... "
        
        # Run the executable and capture its output
        program_output=$(./"$exec_name" "$INPUT_FILE" "$TEMP_OUTPUT" 2>&1)
        exit_code=$?
        
        if [ $exit_code -ne 0 ]; then
            echo "FAILED (exit code: $exit_code)"
            times+=("ERROR")
            echo "No time recorded"
        else
            # Extract time from program output: "Total time =  X.XXXXXX seconds"
            exec_time=$(echo "$program_output" | grep -oE "Total time\s*=\s*[0-9]+\.?[0-9]*\s*seconds" | grep -oE "[0-9]+\.?[0-9]*")
            
            if [[ "$exec_time" =~ ^[0-9]+\.?[0-9]*$ ]]; then
                times+=("$exec_time")
                echo "Time: ${exec_time}s"
            else
                echo "ERROR: Could not extract time from output"
                echo "Program output: $program_output"
                times+=("ERROR")
            fi
        fi
        
        # Clean up temporary output
        rm -f "$TEMP_OUTPUT"
    done
    
    # Calculate statistics
    local valid_times=()
    for time in "${times[@]}"; do
        if [[ "$time" =~ ^[0-9]+\.?[0-9]*$ ]]; then
            valid_times+=("$time")
        fi
    done
    
    if [ ${#valid_times[@]} -gt 0 ]; then
        # Calculate min, max, average
        local min_time=$(printf '%s\n' "${valid_times[@]}" | sort -n | head -1)
        local max_time=$(printf '%s\n' "${valid_times[@]}" | sort -n | tail -1)
        local sum=0
        for time in "${valid_times[@]}"; do
            sum=$(echo "$sum + $time" | bc -l)
        done
        local avg_time=$(echo "scale=6; $sum / ${#valid_times[@]}" | bc -l)
        
        echo "  Summary: Min=${min_time}s, Max=${max_time}s, Avg=${avg_time}s, Valid runs: ${#valid_times[@]}/$RUNS"
        
        # Store results for CSV
        results["$exec_name,min"]="$min_time"
        results["$exec_name,max"]="$max_time"
        results["$exec_name,avg"]="$avg_time"
        results["$exec_name,valid_runs"]="${#valid_times[@]}"
    else
        echo "  Summary: No valid times recorded"
        results["$exec_name,min"]="ERROR"
        results["$exec_name,max"]="ERROR"
        results["$exec_name,avg"]="ERROR"
        results["$exec_name,valid_runs"]="0"
    fi
    
    # Store individual run times
    for ((i=0; i<RUNS; i++)); do
        results["$exec_name,run$((i+1))"]="${times[$i]}"
    done
}

# Main execution
main() {
    echo "=== Sobel Filter Benchmark Script ==="
    echo "Runs: $RUNS per executable"
    echo "Output: $CSV_FILE"
    echo "======================================="
    
    # Check dependencies
    if ! command -v bc &> /dev/null; then
        echo "Error: 'bc' command not found. Please install bc for calculations."
        exit 1
    fi
    
    
    # Declare associative array for results
    declare -A results
    
    # Run benchmarks
    for exec in "${EXECUTABLES[@]}"; do
        benchmark_executable "$exec"
        echo
    done
    
    # Generate CSV file
    echo "Generating CSV file: $CSV_FILE"
    
    # Generate transposed CSV (runs as rows, executables as columns)
    # Create header with Run number and all executable names
    header="Run"
    for exec in "${EXECUTABLES[@]}"; do
        header+=",${exec}"
    done
    echo "$header" > "$CSV_FILE"
    
    # Create data rows (one row per run)
    for ((run=1; run<=RUNS; run++)); do
        row="Run_${run}"
        for exec in "${EXECUTABLES[@]}"; do
            row+=",${results[$exec,run$run]}"
        done
        echo "$row" >> "$CSV_FILE"
    done
    
    # Add summary statistics rows
    echo "" >> "$CSV_FILE"
    
    # Min times row
    min_row="Min_Time"
    for exec in "${EXECUTABLES[@]}"; do
        min_row+=",${results[$exec,min]}"
    done
    echo "$min_row" >> "$CSV_FILE"
    
    # Max times row
    max_row="Max_Time"
    for exec in "${EXECUTABLES[@]}"; do
        max_row+=",${results[$exec,max]}"
    done
    echo "$max_row" >> "$CSV_FILE"
    
    # Average times row
    avg_row="Avg_Time"
    for exec in "${EXECUTABLES[@]}"; do
        avg_row+=",${results[$exec,avg]}"
    done
    echo "$avg_row" >> "$CSV_FILE"
    
    # Valid runs row
    valid_row="Valid_Runs"
    for exec in "${EXECUTABLES[@]}"; do
        valid_row+=",${results[$exec,valid_runs]}"
    done
    echo "$valid_row" >> "$CSV_FILE"
    
    echo "Benchmark completed! Results saved to $CSV_FILE"
    echo
    echo "Summary:"
    echo "--------"
    printf "%-30s %12s %12s %12s %10s\n" "Executable" "Min(s)" "Max(s)" "Avg(s)" "Valid/Total"
    printf "%-30s %12s %12s %12s %10s\n" "------------------------------" "------------" "------------" "------------" "----------"
    
    for exec in "${EXECUTABLES[@]}"; do
        printf "%-30s %12s %12s %12s %10s\n" \
            "$exec" \
            "${results[$exec,min]}" \
            "${results[$exec,max]}" \
            "${results[$exec,avg]}" \
            "${results[$exec,valid_runs]}/$RUNS"
    done
}

# Run main function
main "$@"

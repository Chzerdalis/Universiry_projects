#!/bin/bash

# Default values
OMP_THREADS=6
PRINT=false
OUTPUT_DIR="metrics"
RUN_CALLGRIND=false
RUN_NORMAL=false
RUN_PERF=false
SKIP_MAKE=false
N_AND_M=(
    "5 12"
    "32 32"
    "32 65536"
    "256 65536"
    "256 300000"
)

# Parse command-line options
EXECUTION_MODE=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --execution=*)
            EXECUTION_MODE="${1#*=}"  # Extract the value after '='
            ;;
        --no-make)
            SKIP_MAKE=true
            ;;
        *)

            echo "Usage: $0 --execution=normal|callgrind|both"
            exit 1
            ;;
    esac
    shift
done

# Set execution flags based on the mode
case $EXECUTION_MODE in
    normal)
        RUN_NORMAL=true
        RUN_CALLGRIND=false
        RUN_PERF=false
        ;;
    callgrind)
        RUN_NORMAL=false
        RUN_CALLGRIND=true
        RUN_PERF=false
        ;;
    perf)
        RUN_NORMAL=false
        RUN_CALLGRIND=false
        RUN_PERF=true
        ;;
    all)
        RUN_NORMAL=true
        RUN_CALLGRIND=true
        RUN_PERF=true
        ;;
    *)
        echo "Invalid execution mode. Use --execution=normal|callgrind|perf|all"
        exit 1
        ;;
esac

# Run make unless --no-make is specified
if [ "$SKIP_MAKE" = false ]; then
    make
fi

echo ""

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Loop over all .cpp files
for cpp_file in *.cpp; do
    # Extract the executable name (remove .cpp extension)
    executable="${cpp_file%.cpp}"

    # Create a directory for the executable's metrics
    mkdir -p "$OUTPUT_DIR/$executable"

    # Loop over each N and M pair
    for nm in "${N_AND_M[@]}"; do
        # Split the tuple into N and M
        read -r N M <<< "$nm"

        # Define the output file path
        output_file="$OUTPUT_DIR/$executable/${N}_${M}.out"

        echo "Running $executable with N=$N and M=$M"

        # Run normal execution for runtime
        if [ "$RUN_NORMAL" = true ]; then
            bash ./run.sh "$N" "$M" --algorithm="$executable" --output="$output_file" --omp-threads="$OMP_THREADS" \
                                    --print="$PRINT" --visualize="false" --no-make
            echo "Runtime output saved to $output_file"
        fi

        # Run with Callgrind for instruction count
        if [ "$RUN_CALLGRIND" = true ]; then
            callgrind_file="$OUTPUT_DIR/$executable/${N}_${M}.callgrind"
            bash ./run.sh "$N" "$M" --callgrind --algorithm="$executable" --output="$callgrind_file" \
                                    --omp-threads="$OMP_THREADS" --print="$PRINT" --visualize="false" --no-make
            echo "Callgrind output saved to $callgrind_file"
        fi

        # Run with perf
        if [ "$RUN_PERF" = true ]; then
            perf_file="$OUTPUT_DIR/$executable/${N}_${M}"
            bash ./run.sh "$N" "$M" --perf --algorithm="$executable" --output="$perf_file" \
                                    --omp-threads="$OMP_THREADS" --print="$PRINT" --visualize="false" --no-make
        fi
        echo ""
    done
done

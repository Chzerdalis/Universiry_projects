#!/bin/bash

# Default values
N=32
M=65536
EXECUTABLE="lsal"
PRINT=true
OUTPUT_FILE="out"
VISUALIZE="false"
OMP_THREADS=0
MAKE=true
PROFILE_TOOL=""

# Function to display help
function display_help() {
    echo "Usage: $0 [OPTIONS] N M"
    echo
    echo "Options:"
    echo "  --algorithm=NAME         Specify the algorithm to use (default: ${EXECUTABLE})"
    echo "  --output=FILE            Specify the output file (default: ${OUTPUT_FILE})"
    echo "  --omp-threads=N          Set the number of OpenMP threads - if applicable (default: ${OMP_THREADS})"
    echo "  --print=true/false       Enable or disable printing (default: ${PRINT})"
    echo "  --valgrind               Run the executable under Valgrind"
    echo "  --callgrind              Run the executable under Valgrind with callgrind tool"
    echo "  --kcachegrind            Run the executable under Valgrind with callgrind and open kcachegrind"
    echo "  --perf                   Run the executable using perf"
    echo "  --visualize=true/false   Visualize the output using Python (default: ${VISUALIZE})"
    echo "  --no-make                Skip the make step"
    echo "  --help                   Display this help message"
    echo
    echo "Arguments:"
    echo "  N                        Number of rows (default: ${N})"
    echo "  M                        Number of columns (default: ${M})"
    exit 0
}

# Parse options and arguments
POSITIONAL_ARGS=()
while [[ $# -gt 0 ]]; do
    case $1 in
        --algorithm=*)
            EXECUTABLE="${1#*=}"
            shift
            ;;
        --output=*)
            OUTPUT_FILE="${1#*=}"
            shift
            ;;
        --omp-threads=*)
            OMP_THREADS="${1#*=}"
            shift
            ;;
        --no-make)
            MAKE=false
            shift
            ;;
        --print=*)
            PRINT="${1#*=}"
            shift
            ;;
        --valgrind)
            PROFILE_TOOL="valgrind"
            shift
            ;;
        --callgrind)
            PROFILE_TOOL="callgrind"
            shift
            ;;
        --kcachegrind)
            PROFILE_TOOL="kcachegrind"
            shift
            ;;
        --perf)
            PROFILE_TOOL="perf"
            shift
            ;;
        --visualize=*)
            VISUALIZE="${1#*=}"
            shift
            ;;
        --help)
            display_help
            ;;
        *)
            POSITIONAL_ARGS+=("$1")
            shift
            ;;
    esac
done

# Assign positional arguments
if [[ ${#POSITIONAL_ARGS[@]} -ge 2 ]]; then
    N="${POSITIONAL_ARGS[0]}"
    M="${POSITIONAL_ARGS[1]}"
else
    echo "Error: N and M must be provided."
    display_help
fi

PRINT_FLAG="$([[ "$PRINT" == "true" ]] && echo 1 || echo 0)"

# Build the project
if [[ "$MAKE" == "true" ]]; then
    make
fi

CMD="./$EXECUTABLE $N $M $PRINT_FLAG $OMP_THREADS"

# Run based on profile tool
case "$PROFILE_TOOL" in
    valgrind)
        valgrind -s --leak-check=full $CMD
        ;;
    callgrind)
        valgrind --tool=callgrind --callgrind-out-file=/dev/null $CMD 2> "$OUTPUT_FILE.callgrind" 1>/dev/null
        ;;
    kcachegrind)
        valgrind --tool=callgrind --callgrind-out-file=callgrind.out $CMD
        kcachegrind callgrind.out
        ;;
    perf)
        perf stat -o $OUTPUT_FILE.perf -d $CMD
        ;;
    *)
        $CMD > "$OUTPUT_FILE"
        ;;
esac

# Visualize if requested
if [[ "$VISUALIZE" == "true" ]]; then
    python3 visualize.py "$OUTPUT_FILE"
fi

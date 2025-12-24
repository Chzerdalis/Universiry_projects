#!/bin/bash

SUFFIX="$1"

DIRECTORY="results"
if [ ! -d "$DIRECTORY" ]; then
  echo "Directory $DIRECTORY does not exist, creating..."
  mkdir -p "$DIRECTORY"
else
  echo "Directory $DIRECTORY already exists."
fi

# List of profiles
PROFILES=(
  "INTERACTIVE1.conf" "INTERACTIVE2.conf"
  "INTERACTIVE3.conf" "INTERACTIVE4.conf"
  "INTERACTIVE_SPAWNER1.conf" "INTERACTIVE_SPAWNER2.conf"
  "INTERACTIVE_SPAWNER3.conf" "INTERACTIVE_SPAWNER4.conf"
  "MIXED_SPAWNERS1.conf" "MIXED_SPAWNERS2.conf"
  "MIXED_SPAWNERS3.conf" "MIXED_SPAWNERS4.conf"
  "NON_INTERACTIVE1.conf" "NON_INTERACTIVE2.conf"
  "NON_INTERACTIVE3.conf" "NON_INTERACTIVE4.conf"
  "NON_INT_SPAWNER1.conf" "NON_INT_SPAWNER2.conf"
  "NON_INT_SPAWNER3.conf" "NON_INT_SPAWNER4.conf"
)

# Run ./sjf_sched for each profile
for PROFILE in "${PROFILES[@]}"; do
  OUTPUT_FILE="${DIRECTORY}/${PROFILE%.conf}_${SUFFIX}.txt"
  echo "Running: ./sjf_sched Profiles/$PROFILE > $OUTPUT_FILE"
  ./sjf_sched "Profiles/$PROFILE" > "$OUTPUT_FILE"
done

echo "Finished"

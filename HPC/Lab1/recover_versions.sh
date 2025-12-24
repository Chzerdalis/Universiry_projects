#!/bin/bash

# Usage: ./extract_versions.sh <file_path> <output_folder>
FILE="$1"
OUT_DIR="History"

$(rm -r History)

if [[ -z "$FILE" ]]; then
    echo "Usage: $0 <file_path>"
    exit 1
fi

mkdir -p "$OUT_DIR"

# Get all commits for the file
commits=$(git rev-list HEAD -- "$FILE")

count=1
for commit in $commits; do
    message=$(git log -1 --pretty=%s "$commit")
    
    safe_msg=$(echo "$message" | tr ' /' '__' | tr -cd '[:alnum:]_-')
    filename="$OUT_DIR/${count}_${commit}_${safe_msg}"

    git show "${commit}:${FILE}" > "$filename"

    echo "Saved commit $safe_msg"
    count=$((count + 1))
done

echo "All versions saved in $OUT_DIR"

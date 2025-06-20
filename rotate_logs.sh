#!/bin/bash

# rotate_logs.sh - A lightweight script to rotate old JSON log files
# Usage: ./rotate_logs.sh [-d]
#   -d  Destructive mode: compress and delete old log files
echo "Starting log rotation script..."
set -e  # Exit immediately if a command exits with a non-zero status

LOG_DIR="/home/ochanya/Downloads"
DAYS_OLD=7
DELETE_MODE=false

# Check if we're in delete mode
if [[ "$1" == "-d" ]]; then
    DELETE_MODE=true
fi

# Find JSON files older than specified days
OLD_FILES=$(find "$LOG_DIR" -name "*.json" -type f -mtime +"$DAYS_OLD")

# If no files found, report and exit
if [[ -z "$OLD_FILES" ]]; then
    echo "No files older than $DAYS_OLD days found"
    exit 0
fi

# Count files and calculate total size
FILE_COUNT=$(echo "$OLD_FILES" | wc -l)
TOTAL_SIZE=$(du -ch $OLD_FILES | tail -1 | cut -f1)

# Report in dry run mode
if [[ "$DELETE_MODE" == "false" ]]; then
    echo "$FILE_COUNT files, $TOTAL_SIZE can be rotated"
    exit 0
fi

# Process files in delete mode
for file in $OLD_FILES; do
    filename=$(basename "$file")
    echo -n "Rotating $filename ... "
    
    # Compress the file
    gzip -f "$file" || { echo "Failed to compress $file"; exit 1; }
    
    echo "done"
done

echo "Successfully rotated $FILE_COUNT files, freed $TOTAL_SIZE"
exit 0
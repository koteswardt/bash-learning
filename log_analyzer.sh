#!/bin/bash
# Script Name: log_analyzer.sh
# Description: Counts the number of "Error" occurrences in log files.
# Author: Parallels (DevOps Engineer)
# Date: Feb 2026

# 1. Define the directory where logs are stored
LOG_DIR="/home/parallels/scripts/bash/app_logs"

# 2. Function to count errors in a specific file
# Usage: count_errors "filename"
count_errors(){
    # grep -ic: -i (ignore case), -c (count lines)
    errorCounter=$(grep -ic "Error" "$1")
    echo "Total no of errors in '$1' is: $errorCounter"
}

# 3. Main Loop: Iterate through all .log files in the directory
for errorloop in $LOG_DIR/*.log; do
    
    # Check if the file actually exists (handles empty directories)
    if [ -f "$errorloop" ]; then
        echo "Checking for error in the log files..."
        count_errors "$errorloop"
    else
        echo "No log files found or file is empty."
    fi
done

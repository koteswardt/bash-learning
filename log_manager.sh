#!/bin/bash
# Script Name: log_manager.sh
# Description: Checks log file sizes and compresses them if they exceed a limit.
# Author: Parallels

# 📂 Define the directory containing the application logs
LOG_DIR="/home/parallels/scripts/bash/app_logs"

# 🛠️ Function: rotate_log
# Purpose: Measures a file's size and compresses it using gzip if it's too large.
rotate_log(){
    # Calculate file size in Kilobytes using 'du' and extract the numeric value
    file_size=$(du -k "$1" | cut -f1)
    
    echo "size of the file is: $file_size KB"

    # Check if the file size is greater than 5KB
    if [ "$file_size" -gt "5" ]; then
        echo "File exceeds 5KB. Compressing..."
        gzip "$1"
    else
        echo "No need of compression (file is 5KB or smaller)"
    fi
}

# 🔄 Main Loop
# Iterate through every file ending in .log within the target directory
for zipper in $LOG_DIR/*.log; do
    
    # 🛡️ Safety Guard: Ensure the item found is a regular file before processing
    if [ -f "$zipper" ]; then
        echo "Starting the zipping Process for: $zipper"
        rotate_log "$zipper"
    else
        # This handles cases where no .log files are found
        echo "No valid log files detected in the directory."
    fi
done

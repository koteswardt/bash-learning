#!/bin/bash

# ==============================================================================
# Script Name: log_rotator.sh
# Description: Automates log rotation by moving .txt files to an archive folder.
#              Keeps the main directory clean and maintains an audit trail.
# Usage:       ./log_rotator.sh [directory_path]
# ==============================================================================

# ------------------------------------------------------------------------------
# Step 1: Input Validation
# ------------------------------------------------------------------------------
# Capture the directory from the first argument
target_dir=$1

# If the user forgot the argument (-z checks for empty string), ask for it interactively.
if [[ -z "$target_dir" ]]; then
    echo "Warning: You forgot to enter the directory name."
    read -p "Please enter the directory path: " target_dir
fi

# ------------------------------------------------------------------------------
# Step 2: Safety Check (The Gatekeeper)
# ------------------------------------------------------------------------------
# Verify the target directory actually exists before doing any work.
if [[ -d "$target_dir" ]]; then
    echo "✅ Target directory found: $target_dir"
else
    echo "❌ Error: Directory '$target_dir' does not exist."
    exit 1  # Exit with error code 1 to stop automation pipelines
fi

# ------------------------------------------------------------------------------
# Step 3: Archive Preparation
# ------------------------------------------------------------------------------
# Define the archive path inside the target directory
archive_path="$target_dir/archive"

# Check if the 'archive' sub-folder exists. If not (!), create it.
if [[ ! -d "$archive_path" ]]; then
    echo "Creating archive folder at: $archive_path"
    mkdir -p "$archive_path"
    echo "✅ Archive folder created."
fi

# ------------------------------------------------------------------------------
# Step 4: The Cleanup Loop (Execution)
# ------------------------------------------------------------------------------
echo "Starting cleanup..."

# Loop through all .txt files in the target directory
# We use "$target_dir"/*.txt to handle spaces in folder names correctly
for file in "$target_dir"/*.txt; do

    # Check if the file exists (handles cases where no .txt files are found)
    if [[ -f "$file" ]]; then
        # Move the file to the archive folder
        mv "$file" "$archive_path"

        # Log the specific action with a timestamp for auditing
        echo "Moved: $file -> $archive_path at $(date)" >> /home/parallels/scripts/bash/rotation_history.log
    else
        echo "No .txt files found to rotate."
    fi

done

# ------------------------------------------------------------------------------
# Step 5: Success
# ------------------------------------------------------------------------------
echo "Cleanup complete. Check rotation_history.log for details."
exit 0

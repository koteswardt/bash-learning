#!/bin/bash

# ==========================================
# Phase 2 - Week 2 - Day 1: The Cleaner
# ==========================================

# 1. Capture the input
target_dir=$1

# 2. INPUT CHECK: If variable is empty (-z), ask for it
if [[ -z "$target_dir" ]]; then
    echo "You forgot to enter the directory name!"
    read -p "Please enter it now: " target_dir
fi

# 3. SAFETY CHECK: Check if directory exists (-d)
# We use ! (NOT) to say "If directory does NOT exist..."
if [[ ! -d "$target_dir" ]]; then
    echo "Error: Directory '$target_dir' does not exist."
    exit 1   # <--- EXIT CODE 1 (Failure)
fi

# 4. THE LOOP (Creating Dummy Data)
echo "---------------------------------"
echo "Target confirmed: $target_dir"
echo "Creating 5 temporary files..."

# This loop runs 5 times. 
# $i becomes 1, then 2, then 3... up to 5.
for i in {1..5}
do
    filename="temp$i.txt"
    touch "$target_dir/$filename"
    echo "Created: $filename"
done

# 5. THE CLEANUP
echo "---------------------------------"
echo "Pausing for 2 seconds so you can see them..."
sleep 2

echo "Deleting temporary files..."
rm "$target_dir"/temp*.txt

# 6. VERIFICATION
if [[ $? -eq 0 ]]; then
    echo "Cleanup Complete!"
    exit 0  # <--- EXIT CODE 0 (Success)
else
    echo "Something went wrong during deletion."
    exit 1
fi

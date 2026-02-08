#! /bin/bash

# ==========================================
# Phase 2 - Week 2 - Day 1: The Cleaner
# ==========================================

# 1. Capture the input
userInput=$1

# 2. INPUT CHECK: If variable is empty (-z), ask for it
if [[ -z "$userInput" ]]; then
    echo "You forgot to enter the directory name!"
    read -p "Please enter it now: " userInput
fi

# 3. SAFETY CHECK: Check if directory exists (-d)
# We use ! (NOT) to say "If directory does NOT exist..."

if [[ ! -d "$userInput" ]]; then
    echo "Error: Directory '$userInput' does not exist."
    exit 1   # <--- EXIT CODE 1 (Failure)
fi

# 4. THE LOOP (Creating Dummy Data)
echo "---------------------------------"
echo "Target confirmed: $userInput"
echo "Creating 5 temporary files..."

# This loop runs 5 times.
# $i becomes 1, then 2, then 3... up to 5.
for i in {1..5}
do
    filename=test$i.txt
    touch "$userInput/$filename"
    echo "Created: $filename"
done

# 5. THE CLEANUP
echo "---------------------------------"
echo "Pausing for 2 seconds so you can see them..."
sleep 2

echo "Deleting temporary files..."
rm -r "$userInput/test*.txt"

# 6. VERIFICATION
if [[ $? -eq 0 ]]; then
    echo "Cleanup Complete!"
    exit 0  # <--- EXIT CODE 0 (Success)
else
    echo "Something went wrong during deletion."
    exit 1
fi

#! /bin/bash

# This script automatically onboard new user for instance if new user joins 
# automatically creates home dir and sub dir and files

# if block to check the username input
# =negate symbol check right side
#[a-zA-Z]: Ensures there is at least one letter.
#! [[ ... =~ ^[0-9]+$ ]]: Ensures the input isn't only digits.<S-Del>
if [[ "$1" =~ [a-zA-Z] ]] && [[ ! "$1" =~ ^[0-9]+$ ]]; then
    echo "Hi $1 welcome to the team"
    for folder in scripts config logs
    do 
        mkdir -p "$1/$folder"
        
    done
    echo "Welcome $1 your account was created on $(date)." > $1/welcome.txt
    exit 0
elif [[ -z "$1" ]]; then #-Z is used if the user inpute is empty this important in production bash scripting
    echo "Sorry Mate your forgot to enter the username"
    exit 1
else
    echo "UnserName not valid"
    exit 1
fi

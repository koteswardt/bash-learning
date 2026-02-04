#! /bin/bash

# We are going to write script which takes file name and check if the file exist are no using ifconditions
#
# -f: trure if its a file -d: true if its directory exist in the fs

#if [ "$1" == "check_file.sh" ]; then here the shell check text what user enters at complie time  
if [ -f "$1" ]; then # here the shell check the hard drive to see the file is exist
    echo "Good detective you found the $1"
else
    echo "NA need to improve your detective skills $1 no where to be found. Lets create the file for you!!!"
    touch "$1"
fi

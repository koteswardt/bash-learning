#! /bin/bash

# This script will create directories 

echo "The project Manager"
echo "How many directories do want me to create??"
directoryNumber=$1
#seq is keyword which gives sequence of numbersas below 
for creator in $(seq 1 $directoryNumber)
do 
    echo "Lets create the directory$creator"
    mkdir "directory$creator"
done

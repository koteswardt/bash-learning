#! /bin/bash

#this loop is used to backup the files
echo "Welcome to Backup timemachine!!!"

for backup in *.txt
do 
    echo "Enter the file name to save in backup time machine"
    echo "Here is the file$backup"
    cp -p "$backup" "$backup.bkp"
done
echo "backup completed"

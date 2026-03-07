#! /bin/bash 

if pgrep -x "sleep" >> /dev/null; then
    echo "Sucessfull"
    exit 0
else 
    echo "Failed the process is dead"
    #exit 1 # replacing with command sothat the process can start when we execute the script
    sleep 600 &
fi

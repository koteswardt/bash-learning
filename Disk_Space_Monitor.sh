#! /bin/bash 

THRESHOLD=10
CURRENT_USAGE=$(df -Th | awk '$NF == "/" {print $6}' | sed 's/%//')

if [ "$CURRENT_USAGE" -ge "$THRESHOLD" ]; then
    echo "My God the system is in dangeour zone need to clear the space, current root usage is $CURRENT_USAGE"
   logger -t "DISK_MONITOR" "My God the system is in dangeour zone need to clear the space, current root usage is $CURRENT_USAGE"
   exit 1
else
    echo "system is in chill mode the usage is $CURRENT_USAGE which  below $THRESHOLD"
    exit 0
fi

#! /bin/bash 

THRESHOLD=730 
CURRENT_USAGE=$(free -m | awk 'NR==2 {print $7}') 

if  [ "$CURRENT_USAGE" -lt "$THRESHOLD" ]; then
    echo "My God the Ram is in dangeour zone need to clear the space, current ram usage is $CURRENT_USAGE"
   logger -t "MEM_MONITOR" "My God the system is in dangeour zone need to clear the space, current ram usage is $CURRENT_USAGE"
   exit 1
else
    echo "system is in chill mode the usage is $CURRENT_USAGE which  below $THRESHOLD"
    exit 0
fi

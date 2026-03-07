#! /bin/bash

TARGET_IP="8.8.8.8"
LOG_FILE="/home/parallels/scripts/bash/network_stats.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "File not found... Creating a Network log file..."
    touch $LOG_FILE
else 
    echo "Network file Already exist... Proceed with Network Test..."
fi

echo "--- Ping Test: $(date '+%F %T') ---" >> $LOG_FILE
ping -c 5 $TARGET_IP >> ${LOG_FILE}

if [ $? != 0 ]; then
    logger -t "$TARGET_IP DOWN" "Call Pager or Network Team and raise P1..."
    exit 1
else 
    exit 0
fi 




    


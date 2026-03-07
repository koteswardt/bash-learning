#! /bin/bash

TARGET_IP="8.8.8.8"
LOG_FILE="/home/parallels/scripts/bash/network_stats.log"

if [ ! -f "$LOG_FILE" ]; then
    echo "File not found... Run Network Tracker script..."
    exit 1
else 
    echo "Network log file Already exist... Proceed with Network Test..."
    grep -Ei "^--- Ping Test|^rtt" $LOG_FILE | paste -d ";" - - | awk -F'[;/]' '{print $1 " | Average: " $6 " ms"}'

    exit 0
fi





    


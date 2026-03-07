#! /bin/bash

THRESHOLD=0
STRIKES=0

# The Observation Loop (Runs 5 times, pausing 2 seconds between)
for cpuChecker in {1..5}; do
    CURRENT_LOAD=$(cat /proc/loadavg | awk '{print $1}' | cut -d. -f1)
    
    if [ "$CURRENT_LOAD" -ge "$THRESHOLD" ]; then
        ((STRIKES++))
    fi
    sleep 2
done

# The Decision Logic
if [ "$STRIKES" -ge 3 ]; then
    logger -t "CPU_MONITOR" "CRITICAL: CPU is in critical state, engage System Admin team and create a P1 ticket"
    echo "CRITICAL: CPU is in critical state, engage System Admin team and create a P1 ticket"
    exit 1
else
    echo "OK: Ignore the Alert. CPU is under threshold."
    exit 0
fi

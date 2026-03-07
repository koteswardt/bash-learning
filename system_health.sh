#! /bin/bash 
#
#This script will check systems cpu root and memory by running the check_disk() check_memory() check_cpu()
#Capstone project 1
# --- Global Variables ---
THRESHOLD_DISK=80
THRESHOLD_MEM=500
THRESHOLD_CPU_STRIKES=3
THRESHOLD_CPU_LOAD=0

# --- Function Definitions ---
check_disk() {
    root_Usage=$(df -Th | awk '$NF=="/" {print $6}' | sed 's/%//')
    if [ "$root_Usage" -ge "$THRESHOLD_DISK" ]; then
        echo "CRITICAL: Root space is over the threshold ($root_Usage%)"
    fi
    echo "Disk check complete."
}

check_memory() {
    systemMemory=$(free -m | awk 'NR==2 {print $7}')
    if  [ "$systemMemory" -lt "$THRESHOLD_MEM" ]; then
        echo "CRITICAL: Scream and raise a P1 and call pager"
    fi
}

check_cpu() {
    STRIKES=0
    for cpuChecker in {1..5}; do
        CURRENT_LOAD=$(cat /proc/loadavg | awk '{print $1}' | cut -d. -f1)
        if [ "$CURRENT_LOAD" -ge "$THRESHOLD_CPU_LOAD" ]; then
            ((STRIKES++))
        fi
        sleep 2
    done

    # The Decision Logic
    if [ "$STRIKES" -ge "$THRESHOLD_CPU_STRIKES" ]; then
        logger -t "CPU_MONITOR" "CRITICAL: CPU is in critical state, engage System Admin team and create a P1 ticket"
        echo "CRITICAL: CPU is in critical state, engage System Admin team and create a P1 ticket"
    else
        echo "OK: Ignore the Alert. CPU is under threshold."
    fi
}

# --- Execution ---
check_disk
check_memory
check_cpu
exit 0

#!/bin/bash

# --- Global Variables ---
# Define the target service so the script can be easily reused
TARGET_SERVICE="nginx"

# --- Function Definitions ---
watchdog_check() {
    # Capture the exact state of the service
    CURRENT_STATUS=$(systemctl is-active "$TARGET_SERVICE")
    
    # Decision logic: If the status is anything other than "active"
    if [ "$CURRENT_STATUS" != "active" ]; then
        logger -t "WATCHDOG" "Alert: $TARGET_SERVICE stopped. Raising ticket to sysadmin team." 
        echo "CRITICAL: The $TARGET_SERVICE service is not running. Attempting restart..."
        systemctl start "$TARGET_SERVICE"
    else
        echo "OK: $TARGET_SERVICE service is up and running."
    fi
}

# --- Execution ---
watchdog_check

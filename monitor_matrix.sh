#!/bin/bash

# --- Configuration: Absolute Paths ---
# We use variables so if paths change, we only update them here.
PGREP="/usr/bin/pgrep"
SYSTEMCTL="/usr/bin/systemctl"
ECHO="/usr/bin/echo"

# Target Services to Monitor
target_services=("crond" "sshd" "rsyslogd")

# --- Main Loop ---
for processes_inspector in ${target_services[@]}; do

    # Check if process is running (using absolute path)
    if $PGREP -x "$processes_inspector" > /dev/null; then
        # Optional: You can comment this out to keep logs quiet
        $ECHO "✅ Service is running: $processes_inspector"
    else
        $ECHO "⚠️  $processes_inspector: Not running"
        $ECHO "🔄 Restarting service: $processes_inspector"
        
        # RESTART COMMAND (No sudo needed for Root Crontab)
        $SYSTEMCTL start "$processes_inspector"
    fi
done

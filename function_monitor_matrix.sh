#! /bin/bash

PGREP="/usr/bin/pgrep"
SYSTEMCTL="/usr/bin/systemctl"
ECHO="/usr/bin/echo"
target_services=("crond" "sshd" "rsyslog")
manage_service(){

# --- Main Loop ---

    # Check if process is running (using absolute path)
    if $SYSTEMCTL is-active --quiet "$1" > /dev/null; then
        # Optional: You can comment this out to keep logs quiet
        $ECHO "✅ Service is running: $1"
    else
        $ECHO "⚠️  $1: Not running"
        $ECHO "🔄 Restarting service: $1"

        # RESTART COMMAND (No sudo needed for Root Crontab)
        $SYSTEMCTL start "$1"
        fi
}

for processes_inspector in ${target_services[@]}; do
    manage_service $processes_inspector
done

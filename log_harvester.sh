#! /bin/bash

SEARCH_TERM="password check failed"
LOG_FILE="/var/log/secure"
FAILED_COUNT=$(sudo grep "$SEARCH_TERM" "$LOG_FILE" | grep -v "sudo"| wc -l)

if [ "$FAILED_COUNT" -gt 0 ]; then
    echo "Alert Alert there are issue found in the auth log file and no of issues are $FAILED_COUNT"
    exit 1
else
    echo "Chill system is OK..."
    exit 0
fi

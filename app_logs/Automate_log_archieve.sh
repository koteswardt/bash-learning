#! /bin/bash

# --- Global Variables ---
LOG_DIR="/var/log"
#BACKUP_DIR="/var/app_logs/backups"
BACKUP_DIR="/home/parallels/scripts/bash/app_logs"
DAYS=7
TIMESTAMP=$(date +%F)
ARCHIVE_NAME="log_backup_$TIMESTAMP.tar.gz"

# --- Setup ---
if [ ! -d "$BACKUP_DIR" ]; then
    mkdir -p "$BACKUP_DIR"
else
    echo "Directory exists"
fi

# --- Execution ---
sudo find $LOG_DIR -type f -mtime +$DAYS | xargs tar -zcvf $BACKUP_DIR/$ARCHIVE_NAME --remove-files

# --- Safety Catch ---
if [ "$?" -eq 0 ]; then
    echo "Backup successful!"
    exit 0
else
    echo "Backup failed!"
    exit 1
fi

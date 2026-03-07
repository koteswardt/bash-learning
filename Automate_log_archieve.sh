#! /bin/bash

# --- Global Variables ---
LOG_DIR="/home/parallels/scripts/bash/app_logs"
BACKUP_DIR="/var/app_logs/backups"
DAYS=7
TIMESTAMP=$(date +%F)
ARCHIVE_NAME="log_backup_$TIMESTAMP.tar.gz"

# --- Setup ---
if [ ! -d "$BACKUP_DIR" ]; then
    sudo mkdir -p "$BACKUP_DIR"
else
    echo "Directory exists"
fi

# --- Execution ---
sudo sh -c "find $LOG_DIR -type f -mtime +$DAYS | xargs tar -zcvf $BACKUP_DIR/$ARCHIVE_NAME --remove-files"

# --- Safety Catch ---
if [ "$?" -eq 0 ]; then
    echo "Backup successful!"
    exit 0
    # What exit code should we use for success?
else
    echo "Backup failed!"
    exit 1
    # What exit code should we use for failure?
fi

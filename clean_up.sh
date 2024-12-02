#!/bin/bash

# Comprehensive Disk Cleanup Script for DevBox
# Author: mahrous-deriv
# Usage: Run as root or with sudo

# Enable debugging and exit on errors
set -euo pipefail
trap 'echo "An error occurred on line $LINENO. Exiting."; exit 1' ERR

# Variables
LOGFILE="/var/log/disk_cleanup.log"
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

# Function to log messages
log_message() {
    echo "[$TIMESTAMP] $1" | tee -a $LOGFILE
}

# Start cleanup process
log_message "Starting comprehensive disk cleanup..."

log_message "Cleaning up APT cache..."
sudo apt-get clean >> $LOGFILE 2>&1
sudo apt-get autoclean >> $LOGFILE 2>&1

log_message "Removing unused packages..."
sudo apt-get autoremove -y >> $LOGFILE 2>&1

log_message "Clearing old systemd journal logs..."
sudo journalctl --vacuum-time=2weeks >> $LOGFILE 2>&1
sudo journalctl --vacuum-size=100M >> $LOGFILE 2>&1

log_message "Removing old log files..."
sudo find /var/log -type f -name "*.log.*" -delete >> $LOGFILE 2>&1

# Docker cleanup if installed
if [ -x "$(command -v docker)" ]; then
    log_message "Cleaning up Docker system..."
    sudo docker system prune -af >> $LOGFILE 2>&1
    sudo docker volume prune -f >> $LOGFILE 2>&1
fi

log_message "Removing orphaned cache files..."
sudo find /var/cache -type f -atime +30 -delete >> $LOGFILE 2>&1

log_message "Clearing user caches..."
for user in /home/*; do
    username=$(basename "$user")
    if [ -d "$user/.cache" ]; then
        log_message "Cleaning cache for user $username..."
        sudo find "$user/.cache" -type f -delete >> $LOGFILE 2>&1
    else
        log_message "No cache directory found for user $username."
    fi
done

log_message "Cleaning /tmp directory..."
sudo find /tmp -type f -atime +7 -delete >> $LOGFILE 2>&1

log_message "Finding large files over 500MB..."
find / \( -path /proc -o -path /sys -o -path /dev -o -path /run -o -path /snap -o -path /tmp -o -path /var/lib/docker \) -prune -o -type f -size +500M -exec ls -lh {} \; 2>/dev/null | awk '{ print $NF ": " $5 }' | tee -a $LOGFILE >> large_files.txt
log_message "Review 'large_files.txt' and delete files manually if needed."

log_message "Disk usage after cleanup:"
df -h | tee -a $LOGFILE

log_message "Comprehensive disk cleanup complete!"

#!/bin/bash

# Comprehensive Disk Cleanup Script for DevBox
# Author: mahrous-deriv
# Usage: Run as root or with sudo

# Enable debugging and exit on errors
set -euo pipefail
trap 'echo "An error occurred on line $LINENO. Exiting." >&2; exit 1' ERR

# Variables
LOGFILE="/var/log/disk_cleanup.log"

# Open log file for appending
exec {LG}>>"$LOGFILE"

# Function to log messages
log_message() {
    echo "[$(date '+%F %T.%3N')] $*" | tee >(cat >&$LG) >&2
}

# Split script into chapters with headlines
run_with_headline() {
    local -a sh=("$SHELL")
    # -s is for root
    if [[ $1 == -s ]]; then sh=(sudo -s); shift; fi
    log_message "$@"
    "${sh[@]}" >&$LG 2>&1
}

# Start cleanup process
log_message "Starting comprehensive disk cleanup..."

run_with_headline "Cleaning up APT cache" <<EOF
sudo apt-get clean
sudo apt-get autoclean
EOF

run_with_headline "Removing unused packages" <<EOF
sudo apt-get autoremove -y
EOF

run_with_headline "Clearing old systemd journal logs" <<EOF
sudo journalctl --vacuum-time=2weeks
sudo journalctl --vacuum-size=100M
EOF

run_with_headline "Removing old log files" <<EOF
sudo find /var/log -type f -name "*.log.*" -delete
EOF

run_with_headline "Truncating large log files" <<EOF
sudo find /var/log -type f -name "*.log" -exec truncate -s 0 {} \;
EOF

run_with_headline "Cleaning /tmp directory" <<EOF
sudo find /tmp -type f -atime +7 -delete
EOF

run_with_headline "Cleaning /var/tmp directory" <<EOF
sudo find /var/tmp -type f -atime +7 -delete
EOF

run_with_headline "Clearing swap memory" <<EOF
sudo swapoff -a && sudo swapon -a
EOF

run_with_headline "Removing old system logs" <<EOF
sudo find /var/log -type f -name "*.log" -mtime +30 -delete
EOF

run_with_headline "Removing orphaned cache files" <<EOF
sudo find /var/cache -type f -atime +30 -delete
EOF

# Docker cleanup if installed
if [ -x "$(command -v docker)" ]; then
    run_with_headline "Cleaning up Docker system" <<EOF
    sudo docker system prune -af
    sudo docker volume prune -f
EOF
fi

# Clear user caches
for user in /home/*; do
    username=$(basename "$user")
    if [ -d "$user/.cache" ]; then
        log_message "Cleaning cache for user $username..."
        sudo find "$user/.cache" -type f -delete >&$LG 2>&1
    else
        log_message "No cache directory found for user $username."
    fi
done

# regular users 1000–65534
run_with_headline "Finding unused system accounts" <<EOF
sudo awk -F':' '{ if (\$3 >= 1000 && \$3 < 65534) print \$1 }' /etc/passwd > users.txt
EOF

log_message "Review 'users.txt' for unused accounts to remove manually."

log_message "Finding large files over 500MB..."
find / \( -path /proc -o -path /sys -o -path /dev -o -path /run -o -path /snap -o -path /tmp -o -path /var/lib/docker \) -prune -o -type f -size +500M -exec ls -lh {} \; 2>/dev/null | \
awk '{ print $NF ": " $5 }' | tee >(cat >&$LG) >> large_files.txt
log_message "Review 'large_files.txt' and delete files manually if needed."

log_message "Disk usage after cleanup:"
df -h | tee >(cat >&$LG)

log_message "Comprehensive disk cleanup complete!"


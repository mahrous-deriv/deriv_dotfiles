#!/bin/bash

# Comprehensive Disk Cleanup Script for DevBox
# Author: mahrous-deriv
# Usage: Run as root or with sudo

echo "Starting comprehensive disk cleanup..."

echo "Cleaning up APT cache..."
sudo apt-get clean
sudo apt-get autoclean

echo "Removing unused packages..."
sudo apt-get autoremove -y

echo "Clearing old systemd journal logs..."
sudo journalctl --vacuum-time=2weeks
sudo journalctl --vacuum-size=100M

echo "Removing old log files..."
sudo find /var/log -type f -name "*.log.*" -delete

if [ -x "$(command -v docker)" ]; then
    echo "Cleaning up Docker system..."
    sudo docker system prune -af
    sudo docker volume prune -f
fi

echo "Removing orphaned cache files..."
sudo find /var/cache -type f -atime +30 -delete

echo "Clearing thumbnails cache..."
sudo rm -rf ~/.cache/thumbnails/*

echo "Clearing user caches..."
for user in /home/*; do
    echo "Cleaning cache for user $(basename $user)..."
    sudo find $user/.cache -type f -delete
done

echo "Cleaning /tmp directory..."
sudo find /tmp -type f -atime +7 -delete

echo "Finding large files over 500MB..."
find / -type f -size +500M -exec ls -lh {} \; | awk '{ print $NF ": " $5 }' | tee large_files.txt
echo "Review 'large_files.txt' and delete files manually if needed."

echo "Optimizing file system..."
sudo e4defrag /

echo "Disk usage after cleanup:"
df -h

echo "Comprehensive disk cleanup complete!"

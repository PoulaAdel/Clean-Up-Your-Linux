#!/bin/bash

# Get rid of packages that are no longer required
sudo apt-get autoremove

# Clean up APT cache in Ubuntu
sudo apt-get clean

# Show systemd journal logs
sudo journalctl --disk-usage
# Clear systemd journal logs
sudo journalctl --vacuum-time=3d

# View the thumbnail cache
sudo du -sh ~/.cache/thumbnails
# Clean the thumbnail cache
sudo rm -rf ~/.cache/thumbnails/*

# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu
snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        snap remove "$snapname" --revision="$revision"
    done

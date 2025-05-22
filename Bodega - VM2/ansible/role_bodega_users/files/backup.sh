#!/bin/bash

BACKUP_DIR="/home/martin/backup/"

if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <file1> [file2] ..."
    exit 1
fi

mkdir -p "$BACKUP_DIR"

for file in "$@"; do
    if [ -f "$file" ]; then
        echo "[*] Backing up $file..."
        cp "$file" "$BACKUP_DIR"
    else
        echo "[!] Skipping: $file is not a regular file."
    fi
done

echo "[*] Backup completed. Files saved in $BACKUP_DIR."
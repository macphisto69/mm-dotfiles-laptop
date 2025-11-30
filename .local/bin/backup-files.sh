#!/usr/bin/env bash

EXCLUDE_FILE="$HOME/.config/rsync/rsync_excludes.txt"

if [[ ! -d "$HOME/NAS/Backups/" ]]; then
  sudo mount -t cifs //192.168.0.125/Backups "$HOME"/NAS/Backups -o username=michael,password=droMana7~~aaa
fi

if [[ $? -eq 0 ]]; then
  rsync -avzL --progress --exclude-from="$EXCLUDE_FILE" "${HOME}/" "$HOME/NAS/Backups/Laptop/" 2>"$HOME/Desktop/errors.txt"
fi

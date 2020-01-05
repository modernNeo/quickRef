#!/bin/bash

DATE=$(date +"%Y_%m_%d-%H_%M_%S")

while read line; do
  mkdir -p "/home/jace/Backups/Nexus5Backup/${DATE}/$line"
  adb pull "$line" "/home/jace/Backups/Nexus5Backup/${DATE}/$line"
done < /home/jace/Backups/Nexus5Backup/backupList.txt

zip -r "/home/jace/Backups/Nexus5Backup/${DATE}.zip" "/home/jace/Backups/Nexus5Backup/${DATE}"
rm -r "/home/jace/Backups/Nexus5Backup/${DATE}"

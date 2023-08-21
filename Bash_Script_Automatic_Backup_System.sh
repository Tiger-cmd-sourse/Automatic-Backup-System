#!/bin/bash

#Source directory and destination directory
SOURCE="/home/kali/Documents/file.txt" # this is an example, mention yout path of the file you want to backup
DESTINATION="/home/redhat/Desktop/"  # this is the destination file where you want to store the backuped file

#SSH settings for the Kali Linux VM
KALI_USER="<username>"
KALI_HOST="<IP address>"

#Password for SSH authentication (set to your Kali Linux password)
KALI_PASSWORD="<password>"

#Calculate the MD5 checksum of the source file on the Kali Linux VM
CURRENT_MD5=$(sshpass -p "$KALI_PASSWORD" ssh "$KALI_USER@$KALI_HOST" "md5sum '$SOURCE'" | awk '{print $1}')

#Define a file to store the previous MD5 checksum
PREVIOUS_MD5_FILE="$HOME/previous_md5.txt"

# If the previous MD5 file exists, read the previous checksum
if [ -f "$PREVIOUS_MD5_FILE" ]; then
	PREVIOUS_MD5=$(cat "$PREVIOUS_MD5_FILE")
else

	PREVIOUS_MD5=""
fi

# Compare the current MD5 checksum with the previous checksum
if [ "$CURRENT_MD5" != "$PREVIOUS_MD5" ]; then
	sshpass -p "$KALI_PASSWORD" scp "$KALI_USER@$KALI_HOST:$SOURCE" "$DESTINATION"

	echo "$CURRENT_MD5" > "$PREVIOUS_MD5_FILE"

  #whenever backup ist done it will be logged in the backup.log file with date
	echo "Backup of '$SOURCE' completed on $(date)" >> /var/log/backup.log
else
	echo "No changes detected in '$SOURCE'. Skipping backup."
fi

# Automatic-Backup-System
This project is based on the development of an Automated Backup System for Linux servers. Using Bash scripting, SSH(SCP) for secure data transfer, this system provides an efficient solution for routine data backups.
In today’s digital world, data is incredibly valuable, and ensuring its security is paramount. The ultimate goal is to build a robust system that can automate the backup of the critical server data with built-in change detection. The system securely copies the file from the source machine (in this case, the Kali Linux VM) to the destination machine (a Red Hat Linux system) only when it detects changes to the source file This ensures that you always have up to date backup without redundant data.

Define the Source path and Destination path in the bash script

Add username and password of the server you want to backup

Copy the script and save it in as .sh file

Use chmod +x to give executable privileges

Use crontab -e command to edit the cron table

0 2 1 * * /bin/bash /path to you script file

In above code 2 represents 2am and 1 represents first day of month. THe scriptwill be executed at 2am every first day of every month.

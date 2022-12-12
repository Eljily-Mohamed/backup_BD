#!/bin/bash
##############################
#
#    Backup to database 
#
#
##############################


# what to backup 
backup_files = "/oracle"
#destination on va stocke notre fichies 
des = "/home/oracle/backup"
#create archive filename
day=$ (date + %A)
hostname=$(hostname -s)
archive_file ="$hostname-$day.tgz"

#print start status message.

echo "Backing up database to $dest/$archive_file"
date
echo 

#backup this file using tar

tar czf $dest/$archive_file $backup_files

#print end status message 
echo 
echo "Backup termine "
date

#verification des fichiers 

ls -lh $dest
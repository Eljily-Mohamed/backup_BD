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

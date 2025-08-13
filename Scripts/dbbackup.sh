#!/bin/bash
##This is a simple script to take MySQL DB Backup
#
#
# DB Credentials

DB_USER="WpUser"
DB_PASSWORD="WpPassWord"
DB_NAME="WpDBNAME"

#BackUp DIR

BACKUP_DIR="/home/ec2-user/dbbackups"

#Time Format
TIMEFORMAT=$(date +"%Y%m%d%H%M%S")

#IF Backup DIR doesnt exists
mkdir -p $BACKUP_DIR

#BACKUP MYSQL DB
mysqldump -u$DB_USER -p$DB_PASSWORD $DB_NAME > $BACKUP_DIR/$DB_NAME-$TIMEFORMAT.sql

#Compress Backup
tar -cvzf $BACKUP_DIR/$DB_NAME-$TIMEFORMAT.sql



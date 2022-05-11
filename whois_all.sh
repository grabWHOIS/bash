#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./whois_all.sh

# CONFIG

CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
./data_create.sh
#WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"
DOMAIN_LIST_FOLDER="input"
DOMAIN_FILE_PATTERN="$DOMAIN_LIST_FOLDER/*.txt"
#
WHOIS_EXPIRE_FOLDER="$WHOIS_TODAY_FOLDER/expire"
#
WHOIS_FREE_FOLDER="$WHOIS_TODAY_FOLDER/free"
#
WHOIS_BLOCKED_FOLDER="$WHOIS_TODAY_FOLDER/blocked"
#
WHOIS_ERROR_FOLDER="$WHOIS_TODAY_FOLDER/error"
#
# START
echo "GET LATEST deleted domains"
./import_deleted_pl.sh
./import_blocked_pl.sh
echo "Show all domain list in QUEUE"
DOMAIN_FILE_LIST=$(ls $DOMAIN_FILE_PATTERN)
echo "$DOMAIN_FILE_LIST"
# Check WHOIS and save to OUTPUT folder
for DOMAIN_FILE in $DOMAIN_FILE_LIST
do
  DOMAIN_LIST=$(cat $DOMAIN_FILE)
  #echo $DOMAIN_LIST
  for domain in $DOMAIN_LIST
  do
     echo $domain
     WHOIS_FILE="$WHOIS_TODAY_FOLDER/$domain.txt"
     COUNT_LINES=0;
     [ -f $WHOIS_FILE ] && COUNT_LINES=$(cat $WHOIS_FILE | wc -l)
     # IF FILE NOT EXIST OR IS EMPTY
     if [ ! -f $WHOIS_FILE ] || [ ! -s $WHOIS_FILE ] || [ $COUNT_LINES -le 16 ]; then
        WHOIS_EXPIRE="$WHOIS_EXPIRE_FOLDER/$domain.txt"
        WHOIS_FREE="$WHOIS_FREE_FOLDER/$domain.txt"
        WHOIS_BLOCKED="$WHOIS_BLOCKED_FOLDER/$domain.txt"
        WHOIS_ERROR="$WHOIS_ERROR_FOLDER/$domain.txt"

        if [ ! -f "$WHOIS_EXPIRE" ] && [ ! -f "$WHOIS_FREE" ] && [ ! -f "$WHOIS_BLOCKED" ] && [ ! -f "$WHOIS_ERROR" ]; then
          ./whois.sh $domain
          # > $WHOIS_FILE
          #sleep 1
        fi
     fi
  done
done

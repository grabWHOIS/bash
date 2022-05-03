#!/bin/bash
# EXAMPLE
# ./whois_file_count.sh
# sh whois_file_count.sh

# CONFIG
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"

# START
DOMAIN_LIST=$(ls $WHOIS_TODAY_FOLDER)
for domain in $DOMAIN_LIST
do
   WHOIS_FILE="$WHOIS_TODAY_FOLDER/$domain"
   #echo $WHOIS_FILE
   # IF FILE EXIST OR IS NOT EMPTY
   if [ -f $WHOIS_FILE ] || [ -s $WHOIS_FILE ];
   then
      COUNT_LINES=$(cat $WHOIS_FILE | wc -l)
      echo "$COUNT_LINES $domain"
   fi
done

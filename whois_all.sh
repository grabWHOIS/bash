#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./whois_all.sh

# CONFIG
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
./data_create.sh
#WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"
DOMAIN_LIST_FOLDER="input"
DOMAIN_FILE_PATTERN="$DOMAIN_LIST_FOLDER/*.txt"
#
WHOIS_EXPIRE_FOLDER="$WHOIS_TODAY_FOLDER/expire"
WHOIS_EXPIRE="$WHOIS_EXPIRE_FOLDER/$domain.txt"
#
WHOIS_FREE_FOLDER="$WHOIS_TODAY_FOLDER/free"
WHOIS_FREE="$WHOIS_FREE_FOLDER/$domain.txt"

# START
DOMAIN_FILE_LIST=$(ls $DOMAIN_FILE_PATTERN)
echo "$DOMAIN_FILE_LIST"
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

       if [ ! -f $WHOIS_EXPIRE ] && [ ! -f $WHOIS_FREE ]; then
        ./whois.sh $domain
        # > $WHOIS_FILE
        sleep 1
      fi
     #else
        #./split.sh $domain
        #./move.sh $domain
         #&> /dev/null
         #&> /dev/null
     fi
  done
done

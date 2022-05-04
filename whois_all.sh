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
WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"
DOMAIN_LIST_FOLDER="input"

# START
DOMAIN_LIST=$(ls $DOMAIN_LIST_FOLDER)
echo "$DOMAIN_LIST"
for REGISTRAR_FILE in $DOMAIN_LIST
do
  DOMAIN_LIST_FILE="$DOMAIN_LIST_FOLDER/$REGISTRAR_FILE"
  DOMAIN_LIST=$(cat $DOMAIN_LIST_FILE)
  #echo $DOMAIN_LIST
  for domain in $DOMAIN_LIST
  do
     WHOIS_NAMESERVER="$WHOIS_FOLDER/nameserver/$domain.txt"
     WHOIS_REGISTRAR="$WHOIS_FOLDER/registrar/$domain.txt"
     WHOIS_FILE="$WHOIS_TODAY_FOLDER/$domain.txt"
     COUNT_LINES=0;
     [ -f $WHOIS_FILE ] && COUNT_LINES=$(cat $WHOIS_FILE | wc -l)
     # IF FILE NOT EXIST OR IS EMPTY
     if [ ! -f $WHOIS_FILE ] || [ ! -s $WHOIS_FILE ] || [ $COUNT_LINES -le 16 ];
     then
        echo $domain
        sh whois.sh $domain > $WHOIS_FILE
        sleep 2
     else
        ./split.sh $domain
        ./move.sh $domain
         #&> /dev/null
         #&> /dev/null
     fi
  done
done

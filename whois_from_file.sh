#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./whois_from_file.sh
# sh whois_from_file.sh premium.pl
# sh whois_from_file.sh aftermarket.pl

# CONFIG
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"
#DOMAIN_LIST_FILE=".registrar.txt"
DOMAIN_LIST_FOLDER="input"
#DOMAIN_LIST=$(ls $DOMAIN_LIST_FOLDER)
DOMAIN_LIST_FILE="$DOMAIN_LIST_FOLDER/$1.txt"
# START
echo "$DOMAIN_LIST"
./data_create.sh
DOMAIN_LIST=$(cat $DOMAIN_LIST_FILE)

for domain in $DOMAIN_LIST
do
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
      ./split.sh $domain &> /dev/null
      ./clean.sh $domain &> /dev/null
   fi
done

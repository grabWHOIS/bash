#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./whois.sh freedom.com

# CONFIG
domain=$1
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
#
WHOIS_NAMESERVER="$WHOIS_FOLDER/nameserver/$domain.txt"
WHOIS_REGISTRAR="$WHOIS_FOLDER/registrar/$domain.txt"
#
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
mkdir -p $WHOIS_TODAY_FOLDER
WHOIS_FILE="$WHOIS_TODAY_FOLDER/$domain.txt"
#
WHOIS_EXPIRE_FOLDER="$WHOIS_FOLDER/expire"
mkdir -p $WHOIS_EXPIRE_FOLDER
WHOIS_EXPIRE="$WHOIS_EXPIRE_FOLDER/$domain.txt"
#
WHOIS_FREE_FOLDER="$WHOIS_FOLDER/free"
mkdir -p $WHOIS_FREE_FOLDER
WHOIS_FREE="$WHOIS_FREE_FOLDER/$domain.txt"

# START
COUNT_LINES=0;
# IF FILE EXIST, COUNT THE LINES
[ -f $WHOIS_FILE ] && COUNT_LINES=$(cat $WHOIS_FILE | wc -l)
# IF FILE NOT EXIST OR IS EMPTY
if [ ! -f $WHOIS_FILE ] || [ ! -s $WHOIS_FILE ] || [ $COUNT_LINES -le 16 ]; then
  echo $domain
  WHOISINFO=$(whois $domain)
  echo $WHOISINFO
  COUNT_LINES=$(echo "$WHOISINFO" | wc -l)
  #echo $COUNT_LINES
  ## SPLIT  ""
  [ $COUNT_LINES -ge 16 ] && echo "$WHOISINFO" > $WHOIS_FILE
  sleep 2
  [ $COUNT_LINES -ge 30 ] && ./split.sh $domain &> /dev/null
  ./clean.sh $domain &> /dev/null
fi
sleep 2
#cat $WHOIS_FILE
#cat $WHOIS_EXPIRE
#ls $WHOIS_FREE_FOLDER
#cat $WHOIS_FREE

#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
#./whois_domain.sh web com
#./whois_domain.sh web de
#./whois_domain.sh Name
#./whois_domain.sh premium.pl
#./whois_domain.sh

# CONFIG
DOMAIN=$1
TLD=$2
[[ -z "$TLD" ]] && TLD=""
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
WHOIS_TODAY_EXPIRE_FOLDER="$WHOIS_TODAY_FOLDER/expire"
WHOIS_TODAY_FREE_FOLDER="$WHOIS_TODAY_FOLDER/free"

WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"
WHOIS_ARCHIVE_EXPIRE_FOLDER="$WHOIS_ARCHIVE_FOLDER/expire"
WHOIS_ARCHIVE_FREE_FOLDER="$WHOIS_ARCHIVE_FOLDER/free"

# START
#DOMAIN_FILE_LIST=$(find $WHOIS_TODAY_FOLDER -name "$DOMAIN*" -type f)
#echo $WHOIS_TODAY_FOLDER
#echo $DOMAIN_FILE_LIST
#DOMAIN_FILE_LIST=$(find $WHOIS_ARCHIVE_FOLDER -name "$DOMAIN*" -type f)
echo "YESTERDAY:"
find $WHOIS_ARCHIVE_FOLDER -name "$DOMAIN*" -type f | grep ".$TLD"
echo "TODAY EXIST:"
find $WHOIS_TODAY_FOLDER -name "$DOMAIN*" -type f | grep ".$TLD"
echo "TODAY FREE:"
find $WHOIS_TODAY_FREE_FOLDER -name "$DOMAIN*" -type f | grep ".$TLD"
echo "TODAY EXPIRE:"
find $WHOIS_TODAY_EXPIRE_FOLDER -name "$DOMAIN*" -type f | grep ".$TLD"

#echo -e $WHOIS_ARCHIVE_FOLDER
#echo -e $DOMAIN_FILE_LIST

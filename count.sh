#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./count.sh pl
# ./count.sh net

# CONFIG
TLD=$1
[ -z "$TLD" ] && TLD="com"
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"
WHOIS_TODAY_EXPIRE_FOLDER="$WHOIS_TODAY_FOLDER/expire"
WHOIS_TODAY_FREE_FOLDER="$WHOIS_TODAY_FOLDER/free"
# START
echo "TODAY:"
COUNT_FILES=$(find $WHOIS_TODAY_FOLDER -iname "*.$TLD.txt" -type f | wc -l)
echo "$TLD: $COUNT_FILES"
COUNT_FILES=$(ls "$WHOIS_TODAY_FOLDER" | wc -l)
echo "ALL: $COUNT_FILES"
echo ""

echo "YESTERDAY:"
COUNT_FILES=$(find $WHOIS_ARCHIVE_FOLDER -iname "*.$TLD.txt" -type f | wc -l)
echo "$TLD: $COUNT_FILES"
COUNT_FILES=$(ls "$WHOIS_ARCHIVE_FOLDER" | wc -l)
echo "ALL: $COUNT_FILES"
echo ""

echo "FREE:"

COUNT_FILES=$(find $WHOIS_TODAY_FREE_FOLDER -iname "*.$TLD.txt" -type f | wc -l)
echo "$TLD: $COUNT_FILES"
COUNT_FILES=$(ls "$WHOIS_TODAY_FREE_FOLDER" | wc -l)
echo "ALL: $COUNT_FILES"
echo ""

echo "EXPIRE:"

COUNT_FILES=$(find $WHOIS_TODAY_EXPIRE_FOLDER -iname "*.$TLD.txt" -type f | wc -l)
echo "$TLD: $COUNT_FILES"
COUNT_FILES=$(ls "$WHOIS_TODAY_EXPIRE_FOLDER" | wc -l)
echo "ALL: $COUNT_FILES"
echo ""
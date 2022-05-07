#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 06.05.2022

## EXAMPLE
## ./find_output_dns.sh "cloudflare"

# CONFIG
FIND=$1
TLD=$2
[[ -z "$TLD" ]] && TLD=""
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"


# START
#ls $WHOIS_TODAY_FREE_FOLDER
# -i option  You have the option to instruct grep to ignore word case, i.e., match abc, Abc, ABC,
# -r option  Recursive use of grep
# -L option  make grep display name of files that do not contain search pattern
# FILE_LIST=`grep -ri "$FIND" $WHOIS_TODAY_FOLDER`
# echo -e "$FILE_LIST" > find_output_dns.txt
grep -ri "$FIND" "$WHOIS_TODAY_FOLDER"
exit
DOMAIN_LIST=$(ls "$WHOIS_TODAY_FOLDER/")
for domain in $DOMAIN_LIST
do
   WHOIS_FILE="$WHOIS_TODAY_FOLDER/$domain"
   #echo $WHOIS_FILE
   FINDED=$(cat "$WHOIS_FILE" | grep "$FIND")
   [ ! -z "$FINDED" ] && echo $WHOIS_FILE
   # IF FILE EXIST OR IS NOT EMPTY
#      COUNT_LINES=$(cat $WHOIS_FILE | wc -l)
done
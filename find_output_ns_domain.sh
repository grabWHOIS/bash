#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 06.05.2022

## EXAMPLE
## ./find_output_ns_domain.sh "softreck.com"

# CONFIG
DOMAIN=$1
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
WHOIS_FILE="$WHOIS_TODAY_FOLDER/$DOMAIN.txt"
FIND="Name Server: "

# START
#ls $WHOIS_TODAY_FREE_FOLDER
# -i option  You have the option to instruct grep to ignore word case, i.e., match abc, Abc, ABC,
# -r option  Recursive use of grep
# -L option  make grep display name of files that do not contain search pattern
# FILE_LIST=`grep -ri "$FIND" $WHOIS_TODAY_FOLDER`
# echo -e "$FILE_LIST" > find_output_dns.txt
./whois.sh "$DOMAIN"
grep -ri "$FIND" "$WHOIS_FILE"
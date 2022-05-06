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
WHOIS_TODAY_EXPIRE_FOLDER="$WHOIS_TODAY_FOLDER/expire"
WHOIS_TODAY_FREE_FOLDER="$WHOIS_TODAY_FOLDER/free"

WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"
WHOIS_ARCHIVE_EXPIRE_FOLDER="$WHOIS_ARCHIVE_FOLDER/expire"
WHOIS_ARCHIVE_FREE_FOLDER="$WHOIS_ARCHIVE_FOLDER/free"

# START
ls $WHOIS_TODAY_FREE_FOLDER
# -i option  You have the option to instruct grep to ignore word case, i.e., match abc, Abc, ABC,
# -r option  Recursive use of grep
# -L option  make grep display name of files that do not contain search pattern
#grep -riL "$FIND" "$WHOIS_FOLDER"
grep -ri "$FIND" "$WHOIS_TODAY_FOLDER"

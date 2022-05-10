#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./find.sh "No Data Found"

# CONFIG
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
WHOIS_TODAY_EXPIRE_FOLDER="$WHOIS_TODAY_FOLDER/expire"
WHOIS_TODAY_FREE_FOLDER="$WHOIS_TODAY_FOLDER/free"
WHOIS_TODAY_BLOCKED_FOLDER="$WHOIS_TODAY_FOLDER/blocked"
#
WHOIS_ARCHIVE_FOLDER="$WHOIS_FOLDER/$YESTERDAY"
WHOIS_ARCHIVE_EXPIRE_FOLDER="$WHOIS_ARCHIVE_FOLDER/expire"
WHOIS_ARCHIVE_FREE_FOLDER="$WHOIS_ARCHIVE_FOLDER/free"
WHOIS_ARCHIVE_BLOCKED_FOLDER="$WHOIS_ARCHIVE_FOLDER/blocked"

# START
echo "EXPIRE ############################################################"
diff -qr $WHOIS_ARCHIVE_EXPIRE_FOLDER $WHOIS_TODAY_EXPIRE_FOLDER | sort
#diff -ur $WHOIS_ARCHIVE_FREE_FOLDER $WHOIS_TODAY_FREE_FOLDER
echo ""
echo "FREE ############################################################"
diff -qr $WHOIS_ARCHIVE_FREE_FOLDER $WHOIS_TODAY_FREE_FOLDER | sort
echo ""
echo "BLOCKED ############################################################"
diff -qr $WHOIS_ARCHIVE_BLOCKED_FOLDER $WHOIS_TODAY_BLOCKED_FOLDER | sort

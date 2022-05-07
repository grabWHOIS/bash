#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./whois.sh freedom.com

# CONFIG
INPUT_FOLDER="input"
CACHE_FOLDER="cache"
URL="https://www.dns.pl/deleted_domains.txt"
CURRENTDATE=`date +"%Y-%m-%d"`
FILE_NAME="deleted_domains.txt"
CACHE_FILE="${CACHE_FOLDER}/${CURRENTDATE}_${FILE_NAME}"
INPUT_FILE="${INPUT_FOLDER}/${CURRENTDATE}_${FILE_NAME}"
curl $URL -o $CACHE_FILE
tail -n +3 "$CACHE_FILE" > "$INPUT_FILE"
echo $INPUT_FILE
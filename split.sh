#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./split.sh example.com
domain=$1
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
mkdir -p "$WHOIS_FOLDER/cache"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
#WHOIS_NAMESERVER="$WHOIS_FOLDER/nameserver/$domain.txt"
#WHOIS_REGISTRAR="$WHOIS_FOLDER/registrar/$domain.txt"
WHOIS_CACHE="$WHOIS_FOLDER/cache/$domain.txt"
cat > $WHOIS_CACHE
WHOIS_FILE="$WHOIS_TODAY_FOLDER/$domain.txt"

# START
FIND="For more information on Whois status codes, please visit"
while read -r line; do
    #echo -e "$line\n"
    echo $line >> $WHOIS_CACHE
    if grep -q "$FIND" <<< "$line"; then
      echo "splitted: $WHOIS_FILE"
      cat $WHOIS_CACHE > $WHOIS_FILE
      rm -f $WHOIS_CACHE
      break
    fi
done < $WHOIS_FILE
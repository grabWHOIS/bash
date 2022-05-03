#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./whois_free.sh freedoman
# Name: Check for domain name availability

# CONFIG
NAME=$1

# START
if [ "$#" = "0" ]; then
    echo "You need tu supply at least one argument!"
    exit 1
fi

DOMAINS=$(cat whois_free.txt)
DOMAIN_LIST=$DOMAINS
#ELEMENTS=${#DOMAINS[@]}

#while (( "$@" )); do
echo "available:"

  for TLD in $DOMAIN_LIST
  do
      DOMAIN=$NAME$TLD
      whois $DOMAIN | egrep -q \
      '^No match|^NOT FOUND|^Not fo|AVAILABLE|^No Data Fou|has not been regi|No entri'

      if [ $? -eq 0 ]; then
          echo $DOMAIN
      else
          sh whois.sh $DOMAIN
      fi
  done

shift

#done
#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./split.sh domain.com
# TODO: replace with find_move.sh

# CONFIG
domain=$1
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
#
./data_create.sh
#
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
WHOIS_FILE="$WHOIS_TODAY_FOLDER/$domain.txt"
#
WHOIS_TODAY_EXPIRE_FOLDER="$WHOIS_TODAY_FOLDER/expire"
WHOIS_EXPIRE="$WHOIS_TODAY_EXPIRE_FOLDER/$domain.txt"
#
WHOIS_TODAY_FREE_FOLDER="$WHOIS_TODAY_FOLDER/free"
WHOIS_FREE="$WHOIS_TODAY_FREE_FOLDER/$domain.txt"
# START
FINDLIMIT="request limit exceeded"
FINDEXP="billing period had finished"
FINDPL="No information available"
FIND="Domain not found"
FINDFREE="Status: free"
FINDFREEBY="Object does not exist"
FINDFREEORG="No Data Found"
FINDFREEOVH="NOT FOUND"
FINDFREENET="No match for domain"

#echo -e "$WHOIS_FILE\n"
# grep -q "Status: free" <<< "Domain: 100eur.de Status: free";
#cat $WHOIS_FILE
while read -r line; do

  #echo -e "$line\n"
  if grep -q "$FINDFREEORG" <<< "$line"; then
    #rm -f $WHOIS_FILE
    echo "FINDFREEORG $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREEBY" <<< "$line"; then
    #rm -f $WHOIS_FILE
    echo "FINDFREEBY $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREE" <<< "$line"; then
    #rm -f $WHOIS_FILE
    echo "FINDFREE $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FIND" <<< "$line"; then
    #rm -f $WHOIS_FILE
    echo "FIND $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDEXP" <<< "$line"; then
    echo "FINDEXP $WHOIS_FILE $WHOIS_EXPIRE"
    mv $WHOIS_FILE $WHOIS_TODAY_EXPIRE_FOLDER
    break
  fi
  if grep -q "$FINDPL" <<< "$line"; then
    echo "FINDPL $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREEOVH" <<< "$line"; then
    echo "FINDFREEOVH $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREENET" <<< "$line"; then
    echo "FINDFREENET $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDLIMIT" <<< "$line"; then
    echo "FINDLIMIT $WHOIS_FILE"
    rm -f $WHOIS_FILE
    ./restart.sh &> /dev/null
    sleep 30
    break
  fi

done < $WHOIS_FILE
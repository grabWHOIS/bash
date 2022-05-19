#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./split.sh domain.com
# TODO: replace with find_move.sh

# CONFIG
domain=$1
CURRENTDATE=$(date +"%Y-%m-%d")
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
#
WHOIS_TODAY_BLOCKED_FOLDER="$WHOIS_TODAY_FOLDER/blocked"
WHOIS_BLOCKED="$WHOIS_TODAY_BLOCKED_FOLDER/$domain.txt"
#
WHOIS_TODAY_ERROR_FOLDER="$WHOIS_TODAY_FOLDER/error"
WHOIS_ERROR="$WHOIS_TODAY_ERROR_FOLDER/$domain.txt"

# START
## LIMIT
FINDLIMIT="request limit exceeded"
## EXPIRING
FINDEXP="billing period had finished"
## ERROR
FINDERROR="Malformed request."
FINDERRORTLD="This TLD has no whois server"
FINDERRORINVALID="Status.: INVALID"
## BLOCKED
FINDBLOCKED="undergoing proceeding"
FINDNOTFORREG="This name is not available for registration"
## FREE
FINDPL="No information available"
FIND="Domain not found"
FINDFREE="Status: free"
FINDFREEBY="Object does not exist"
FINDFREEORG="No Data Found"
FINDFREEOVH="NOT FOUND"
FINDFREENET="No match for "
FINDFREERU="No entries found"
FINDFREETOP="The queried object does not exist"

#echo -e "$WHOIS_FILE\n"
# grep -q "Status: free" <<< "Domain: 100eur.de Status: free";
#cat $WHOIS_FILE
while read -r line; do

  #echo -e "$line\n"

  ## LIMIT
  if grep -q "$FINDLIMIT" <<<"$line"; then
    echo "FINDLIMIT $WHOIS_FILE"
    rm -f $WHOIS_FILE
    ./restart.sh &>/dev/null
    printf '\a'
    sleep 60
    printf '\a'
    sleep 0.3
    printf '\a'
    break
  fi

  ## EXP
  if grep -q "$FINDEXP" <<<"$line"; then
    echo "FINDEXP $WHOIS_FILE $WHOIS_EXPIRE"
    mv $WHOIS_FILE $WHOIS_TODAY_EXPIRE_FOLDER
    break
  fi

  ## ERROR
  if grep -q "$FINDERROR" <<<"$line"; then
    echo "FINDERROR $WHOIS_FILE $WHOIS_ERROR"
    mv $WHOIS_FILE $WHOIS_TODAY_ERROR_FOLDER
    break
  fi
  if grep -q "$FINDERRORTLD" <<<"$line"; then
    echo "FINDERRORTLD $WHOIS_FILE $WHOIS_ERROR"
    mv $WHOIS_FILE $WHOIS_TODAY_ERROR_FOLDER
    break
  fi
  if grep -q "$FINDERRORINVALID" <<<"$line"; then
    echo "FINDERRORINVALID $WHOIS_FILE $WHOIS_ERROR"
    mv $WHOIS_FILE $WHOIS_TODAY_ERROR_FOLDER
    break
  fi

  ## BLOCKED
  if grep -q "$FINDBLOCKED" <<<"$line"; then
    echo "FINDBLOCKED $WHOIS_FILE $WHOIS_BLOCKED"
    mv $WHOIS_FILE $WHOIS_TODAY_BLOCKED_FOLDER
    break
  fi
  if grep -q "$FINDNOTFORREG" <<<"$line"; then
    echo "FINDNOTFORREG $WHOIS_FILE $WHOIS_BLOCKED"
    mv $WHOIS_FILE $WHOIS_TODAY_BLOCKED_FOLDER
    break
  fi

  ## FREE
  if grep -q "$FINDFREEORG" <<<"$line"; then
    #rm -f $WHOIS_FILE
    echo "FINDFREEORG $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREEBY" <<<"$line"; then
    #rm -f $WHOIS_FILE
    echo "FINDFREEBY $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREE" <<<"$line"; then
    #rm -f $WHOIS_FILE
    echo "FINDFREE $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FIND" <<<"$line"; then
    #rm -f $WHOIS_FILE
    echo "FIND $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDPL" <<<"$line"; then
    echo "FINDPL $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREEOVH" <<<"$line"; then
    echo "FINDFREEOVH $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREENET" <<<"$line"; then
    echo "FINDFREENET $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREERU" <<<"$line"; then
    echo "FINDFREERU $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi
  if grep -q "$FINDFREETOP" <<<"$line"; then
    echo "FINDFREETOP $WHOIS_FILE $WHOIS_FREE"
    mv $WHOIS_FILE $WHOIS_TODAY_FREE_FOLDER
    break
  fi

done <"$WHOIS_FILE"

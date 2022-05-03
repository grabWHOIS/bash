#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
#./registrar.sh Cron
#./registrar.sh Name
#./registrar.sh premium.pl
#./registrar.sh

# CONFIG
REGISTRAR=$1
YESTERDAY=$(date -d "yesterday" '+%Y-%m-%d')
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
DOMAIN_FILE_LIST=$(ls $WHOIS_TODAY_FOLDER)
# START
#echo $DOMAIN_FILE_LIST
for domain_file in $DOMAIN_FILE_LIST
do
   WHOIS_FILE="$WHOIS_TODAY_FOLDER/$domain_file"
   #echo $WHOIS_FILE
   # IF FILE EXIST AND IS NOT EMPTY
   if [ -f $WHOIS_FILE ] && [ -s $WHOIS_FILE ]
   then
      #echo "" > $WHOIS_NAMESERVER
      #echo "" > $WHOIS_REGISTRAR
      FOUND=$(cat $WHOIS_FILE | grep 'Registrar: ' | awk '{printf $2}' | grep $REGISTRAR)
      if [ "$FOUND" = "" ]; then
        REGISTRAR_LINE=$(cat $WHOIS_FILE | grep $REGISTRAR)
        REGISTRAR_LINE="$(echo -e "${REGISTRAR_LINE}" | tr -d '\n' | tr -d '\t')"

        if [ "$FOUND" = "" ]; then
          echo -e "$domain_file $REGISTRAR_LINE"
        fi
      else
        REGISTRAR_LINE=$(cat $WHOIS_FILE | grep 'Name Server: ' | awk '{printf $3}')
        #REGISTRAR_LINE="$(echo -e "${REGISTRAR_LINE}" | sed -e 's/^[[:space:]]*//')"
                REGISTRAR_LINE="$(echo -e "${REGISTRAR_LINE}" | tr -d '\n' | tr -d '\t')"

        echo -e "$domain_file $REGISTRAR_LINE"
      fi
   fi
done

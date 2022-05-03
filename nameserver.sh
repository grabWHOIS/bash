#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./whois_nameserver.sh NS1045

# CONFIG
NS=$1
WHOIS_LIST_FOLDER="output"
DOMAIN_FILE_LIST=$(ls $WHOIS_LIST_FOLDER)
#echo $DOMAIN_FILE_LIST

# START
for domain_file in $DOMAIN_FILE_LIST
do
   WHOIS_FILE="$WHOIS_LIST_FOLDER/$domain_file"
   # IF FILE EXIST AND IS NOT EMPTY
   if [ -f $WHOIS_FILE ] && [ -s $WHOIS_FILE ]
   then
      #echo "" > $WHOIS_NAMESERVER
      #echo "" > $WHOIS_REGISTRAR
      FOUND=$(cat $WHOIS_FILE | grep 'Name Server: ' | awk '{printf $3}' | grep $NS)
      if [ "$FOUND" = "" ]; then
        NS_LINE=$(cat $WHOIS_FILE | grep $NS)
        if [ "$FOUND" = "" ]; then
          echo -e "$domain_file $NS_LINE"
        fi
      else
        REGISTRAR_LINE=$(cat $WHOIS_FILE | grep 'Registrar: ' | awk '{printf $2}')
        echo -e "$domain_file $FOUND $REGISTRAR_LINE"
      fi

   fi
done
# cat output/26ghz.net.txt | grep 'Name Server: ' | awk '{printf $3}'
# cat output/26ghz.net.txt | grep 'Registrar: ' | awk '{printf $2$3}'
#sed -n 's/^Name Server:\(.*\)/\1/p' < output/26ghz.net.txt
#echo VAR2=`sed -n 's/^Name Server:\(.*\)/\1/p' < output/26ghz.net.txt`
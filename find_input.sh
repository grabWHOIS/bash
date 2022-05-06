#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 06.05.2022

# EXAMPLE
#./find_input.sh web com
#./find_input.sh web de
#./find_input.sh Name
#./find_input.sh premium.pl
#./find_input.sh

# CONFIG
DOMAIN=$1
TLD=$2
[[ -z "$TLD" ]] && TLD=""
WHOIS_INPUT_FOLDER="input"

# START
echo "INPUT:"
grep "$DOMAIN*" -r "$WHOIS_INPUT_FOLDER/"
 #| grep ".$TLD"
#find $WHOIS_TODAY_FOLDER -name "$DOMAIN*" -type f
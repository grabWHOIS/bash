#!/bin/bash
#
mkdir -p "input"
mkdir -p "output"
mkdir -p "cache"
#
CURRENTDATE=`date +"%Y-%m-%d"`
WHOIS_FOLDER="output"
#
WHOIS_TODAY_FOLDER="$WHOIS_FOLDER/$CURRENTDATE"
mkdir -p $WHOIS_TODAY_FOLDER
#
WHOIS_TODAY_EXPIRE_FOLDER="$WHOIS_TODAY_FOLDER/expire"
mkdir -p $WHOIS_TODAY_EXPIRE_FOLDER
#
WHOIS_TODAY_FREE_FOLDER="$WHOIS_TODAY_FOLDER/free"
mkdir -p $WHOIS_TODAY_FREE_FOLDER
#
WHOIS_TODAY_BLOCKED_FOLDER="$WHOIS_TODAY_FOLDER/blocked"
mkdir -p $WHOIS_TODAY_BLOCKED_FOLDER
#
WHOIS_TODAY_ERROR_FOLDER="$WHOIS_TODAY_FOLDER/error"
mkdir -p $WHOIS_TODAY_ERROR_FOLDER
#

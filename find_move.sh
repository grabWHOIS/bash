#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 03.05.2022

# EXAMPLE
# ./split.sh "No Data Found"

# CONFIG
SOURCE_FILE_PATH=$1
TARGET_FILE_PATH=$2
SEARCH_TEXT=$3

# START
while read -r line; do
  #echo -e "$line\n"
  if grep -q "$SEARCH_TEXT" <<< "$line"; then
    echo "FOUND: $SEARCH_TEXT IN FILE: $SOURCE_FILE_PATH MOVED TO: $TARGET_FILE_PATH"
    mv $SOURCE_FILE_PATH $TARGET_FILE_PATH
    break
  fi
done < $SOURCE_FILE_PATH
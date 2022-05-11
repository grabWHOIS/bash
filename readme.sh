#!/bin/bash
# CONTRIBUTION
## Author: Tom Sapletta
## Created Date: 11.05.2022


# EXAMPLE
# ./readme.sh

# TODO: github actions to merge the all files in the fly
# CONFIG
LOGS="readme.logs.txt"
PROJECTS=readme.txt
PROJECT_LIST=$(cat $PROJECTS)
LOCAL_PATH=$(pwd)
SUBFOLDER="DOCS"
MENU_URL="$SUBFOLDER/PROJECTS.md"
MENU_PATH="$SUBFOLDER/PROJECTS_LOCAL.md"
OUTPUT="README.md"

# START
echo "`date +"%T.%3N"` START" > $LOGS
echo "$(date +"%T.%3N") CREATE_MENU" >> $LOGS
#
DOMAIN=$(cat CNAME)
echo "+ [$DOMAIN](http://$DOMAIN)" > $MENU_URL
echo "+ [$LOCAL_PATH](file://$LOCAL_PATH/)" > $MENU_PATH
#
for FILE in */in.md; do
  line=$(head -n 1 $FILE)
  NAME=${FILE%%/*}
  URL=$DOMAIN/$NAME
  echo "+ [$NAME $line](http://$URL)" >> $MENU_URL
  echo "+ [$NAME $line](file://$LOCAL_PATH/$NAME/index.html)" >> $MENU_PATH
done

## combine from another sites
echo "$(date +"%T.%3N") COMBINE_FILES" >> $LOGS

echo "" > $OUTPUT
for project in $PROJECT_LIST; do
  echo "$(date +"%T.%3N") COMBINE_FILE $project" >> $LOGS
  cat $project >> $OUTPUT
  echo "" >> $OUTPUT
done

echo "`date +"%T.%3N"` STOP" >> $LOGS
cat $LOGS
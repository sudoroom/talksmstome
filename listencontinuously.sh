#!/bin/bash
LOGFILE=~/listenon28386.log
while true; do
  (~/bin/listenon28386.sh | tee -a $LOGFILE)
  echo espeak -g5 -s90 "incoming SMS message: $(tail -n1 $LOGFILE | jq '.data.payload.text')"
  espeak -g5 -s90 "incoming SMS message: $(tail -n1 $LOGFILE | jq '.data.payload.text')"
  echo -e '\r\n'listen finished at $(date) | tee -a $LOGFILE
done

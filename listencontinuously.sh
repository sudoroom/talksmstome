#!/bin/bash
LOGFILE=~/listenon28386.log
while true; do
  (~/bin/listenon28386.sh | tee -a $LOGFILE)
  echo espeak -g5 -s90 "incoming SMS message: $(tail -n1 $LOGFILE | jq '.data.payload.text')"
  espeak -g5 -s90 "incoming SMS message: $(tail -n1 $LOGFILE | jq '.data.payload.text')" -w /tmp/espeak.wav
  aplay -D plughw:3,0 /tmp/espeak.wav # use aplay -l to list soundcards, need to specify for systemd to work
  echo -e '\r\n'listen finished at $(date) | tee -a $LOGFILE
done

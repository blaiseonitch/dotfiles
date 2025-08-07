#!/bin/bash

MAXLEN=25
song=$(mpc current)

if [[ -z "$song" ]]; then
  echo '{"text": " No music", "class": "off"}'
  exit
fi

# truncate song name
if [ ${#song} -gt $MAXLEN ]; then
  song="${song:0:$MAXLEN}..."
fi

state=$(mpc status | awk 'NR==2 {print $1}')

icon_play=""
icon_pause=""
icon_prev=""
icon_next=""

if [[ "$state" == "[playing]" ]]; then
    icon="$icon_pause"
elif [[ "$state" == "[paused]" ]]; then
    icon="$icon_play"
else
    echo '{"text": " No music", "class": "off"}'
    exit
fi

echo "{\"text\": \"$icon_prev  $icon  $icon_next  $song\", \"tooltip\": \"$song\", \"class\": \"$state\"}"


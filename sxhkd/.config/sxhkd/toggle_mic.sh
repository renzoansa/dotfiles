#!/bin/bash

# Get the default source device
DEFAULT_SOURCE=$(pactl info | grep 'Default Source' | cut -d' ' -f3)

# Get the source device state
STATE=$(pactl list sources | grep -A 10 "$DEFAULT_SOURCE" | grep 'Mute' | awk '{print $2}')

if [ "$STATE" = "yes" ]; then
  pactl set-source-mute "$DEFAULT_SOURCE" 0
  notify-send -i microphone-sensitivity-high "Microphone" "Unmuted"
else
  pactl set-source-mute "$DEFAULT_SOURCE" 1
  notify-send -i microphone-sensitivity-muted "Microphone" "Muted"
fi

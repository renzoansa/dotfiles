#!/bin/bash
#
CUSTOM_COLOR="$1" 

# Get the default source device
DEFAULT_SOURCE=$(pactl info | grep 'Default Source' | cut -d' ' -f3)

# Get the source device state
STATE=$(pactl list sources | grep -A 10 "$DEFAULT_SOURCE" | grep 'Mute' | awk '{print $2}')

if [ "$STATE" = "yes" ]; then
    echo "" # You can replace this with any text or icon representing a muted microphone
else
    echo "%{F$CUSTOM_COLOR} %{B-}"
fi

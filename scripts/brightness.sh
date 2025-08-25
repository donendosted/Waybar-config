#!/bin/sh

STATE_FILE="/tmp/waybar_brightness"

# detect backlight device (first one)
DEVICE=$(ls /sys/class/backlight | head -n1)
CUR_FILE="/sys/class/backlight/$DEVICE/brightness"
MAX_FILE="/sys/class/backlight/$DEVICE/max_brightness"

CURRENT=$(cat "$CUR_FILE")
MAX=$(cat "$MAX_FILE")

if [ "$CURRENT" -eq 0 ]; then
    if [ -f "$STATE_FILE" ]; then
        VALUE=$(cat "$STATE_FILE")
    else
        VALUE=$((MAX / 2))   # fallback to 50%
    fi
else
    echo "$CURRENT" > "$STATE_FILE"
    VALUE=0
fi

echo "$VALUE" | sudo tee "$CUR_FILE" > /dev/null
echo "$VALUE"

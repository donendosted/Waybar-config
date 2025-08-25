#!/bin/sh

status=$(playerctl --player=spotify status 2>/dev/null)

if [ "$status" = "Playing" ] || [ "$status" = "Paused" ]; then
    echo "▶";
else
    echo "";
fi

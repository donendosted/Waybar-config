#!/bin/sh

status=$(playerctl --player=spotify status 2>/dev/null)

case $1 in
    play-pause) playerctl play-pause;;
    next) playerctl next;;
    prev) playerctl previous;;
    *)
        if [[ "$status" == "Playing" ]] || [[ "$status" == "Paused" ]]; then
            artist=$(playerctl --player=spotify metadata artist)
            title=$(playerctl --player=spotify metadata title)
            echo "$artist - $title"
        else
            spotify-launcher
        fi
    ;;
esac

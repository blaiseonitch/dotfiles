#!/bin/bash

while true; do
    # Get currently playing player
    active_player=$(playerctl --list-all | while read p; do
        if [ "$(playerctl -p "$p" status 2>/dev/null)" = "Playing" ]; then
            echo "$p"
            break
        fi
    done)

    # If there is an active player, pause all others
    if [ -n "$active_player" ]; then
        for p in $(playerctl --list-all); do
            if [ "$p" != "$active_player" ]; then
                playerctl -p "$p" pause 2>/dev/null
            fi
        done
    fi

    sleep 1
done


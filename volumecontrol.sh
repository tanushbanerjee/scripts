#!/bin/sh

case "$1" in 
    u) pulsemixer --change-volume +5;;
    d) pulsemixer --change-volume -5;;
    t) pulsemixer --toggle-mute;;
    m) pulsemixer --mute;;
esac >/dev/null


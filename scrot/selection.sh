#!/usr/bin/env bash
#scrot -s '%Y-%m-%d_%H:%M:%S.png' -e 'mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/$f && exec notify-send "Screenshot taken"'
VECTORS=$(slop -r crosshair -f '%x,%y,%w,%h' -q)

if [ -z "${VECTORS}" ]; then
    notify-send "Selection cancelled"
else
    scrot -a "${VECTORS}" '%Y-%m-%d_%H:%M:%S.png' -e 'mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/$f && exec notify-send "Screenshot taken"'
fi

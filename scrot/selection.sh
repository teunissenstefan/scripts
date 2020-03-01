#!/usr/bin/env bash
scrot -s '%Y-%m-%d_%H:%M:%S.png' -e 'mv $f ~/Pictures/screenshots && xclip -selection clipboard -t image/png -i ~/Pictures/screenshots/$f && exec notify-send "Screenshot taken"'

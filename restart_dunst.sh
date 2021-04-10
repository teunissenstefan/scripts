#!/usr/bin/env bash
killall dunst
dunst &
notify-send 'restart dunst'

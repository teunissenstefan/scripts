#!/usr/bin/env bash

output="$(xdotool search --name 'ncspot')"

if [[ -n $output ]]; then
	echo "ncspot already exists"
else
	echo "starting ncspot"
	alacritty -t 'ncspot' -e env TERM=screen-256color ncspot &
fi

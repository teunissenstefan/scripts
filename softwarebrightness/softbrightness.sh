#!/usr/bin/env bash

xrandr -q | grep " connected" |
while IFS= read -r line; do
	stringarray=($line)
	xrandr --output ${stringarray[0]} --brightness $1
done
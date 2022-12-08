#!/usr/bin/env bash

feh --title pizzaimg ~/repos/scripts/pizza/pizza.png &
PIZZAX=0
PIZZAY=0
MAXY=1440
while [ "$PIZZAY" -lt "$MAXY" ]
do
	i3-msg [title="pizzaimg"] move position $PIZZAX $PIZZAY > /dev/null
	PIZZAY=$((PIZZAY+5))
	PIZZAX=$((PIZZAX+5))
	sleep 0.01
done
i3-msg [title="pizzaimg"] kill > /dev/null

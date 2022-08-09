#!/usr/bin/env bash

feh --title pizzaimg ~/repos/scripts/pizza/pizza.png &
PIZZAX=0
PIZZAY=0
MAXY=1440
while [ "$PIZZAY" -lt "$MAXY" ]
do
	echo $PIZZAX
	i3-msg [title="pizzaimg"] move position $PIZZAX $PIZZAY
	PIZZAY=$((PIZZAY+5))
	PIZZAX=$((PIZZAX+5))
done
i3-msg [title="pizzaimg"] kill

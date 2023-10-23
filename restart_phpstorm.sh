#!/usr/bin/env bash

pkill -9 -f /snap/phpstorm/ && notify-send "Restarting PhpStorm"; sleep 2; phpstorm

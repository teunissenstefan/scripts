#!/usr/bin/env bash
killall steam
notify-send 'closing steam'
sleep 5
notify-send 'starting steam'
steam &

#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
#[ -f "/run/user/$(id -u)/polybar/traybar-pid" ] && rm "/run/user/$(id -u)/polybar/traybar-pid"

polybar top & disown
#polybar tray & disown && echo $! > "/run/user/$(id -u)/polybar/traybar-pid"
polybar top2 & disown

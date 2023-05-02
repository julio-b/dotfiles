#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

polybar --reload top & disown
polybar --reload top2 & disown

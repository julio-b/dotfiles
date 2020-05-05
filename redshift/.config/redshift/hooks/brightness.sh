#!/bin/sh
# https://wiki.archlinux.org/index.php/redshift#Use_real_screen_brightness
# Set brightness via xbrightness when redshift status changes

# Set brightness values for each status.
# Range from 1 to 100 is valid
brightness_day="80"
brightness_transition="50"
brightness_night="2"
fade_time=250

case $1 in
	period-changed)
		case $3 in
			night)
				xbacklight -set $brightness_night -time $fade_time
				;;
			transition)
				xbacklight -set $brightness_transition -time $fade_time
				;;
			daytime)
				xbacklight -set $brightness_day -time $fade_time
				;;
		esac
		;;
esac

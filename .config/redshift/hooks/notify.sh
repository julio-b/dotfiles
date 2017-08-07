#!/bin/sh
case $1 in
	period-changed)
		exec notify-send --app-name="redshift" --expire-time=3000 --urgency=low "Redshift" "Period changed to $3"
esac

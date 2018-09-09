#!/bin/sh
case $1 in
	period-changed)
		exec notify-send --app-name="redshift" --icon="/usr/share/icons/hicolor/scalable/apps/redshift.svg" --expire-time=2000 --urgency=low "Redshift" "Period changed to $3"
esac

#!/bin/bash
if [ -x $HOME/.config/i3/scripts/update_color_theme.sh ]; then
	$HOME/.config/i3/scripts/update_color_theme.sh
	if [ $? -eq 0 ]; then
		(echo "`date`: Base16 theme reload " && i3-msg reload) >> $HOME/.config/i3/stdout
	else
		notify-send --urgency=critical --icon="/usr/share/icons/Arc/emblems/64/emblem-important.png" --expire-time=3500 "Theme base16-$BASE16_THEME does not exist for i3wm"
	fi
fi

#!/bin/sh

if [ -f ~/.base16_theme ]; then
	base16_theme=$(basename -s .sh `readlink ~/.base16_theme`)
fi

if [ -n "$base16_theme" ]; then
	base16_i3_url="https://raw.githubusercontent.com/khamer/base16-i3/master/themes/"$base16_theme".config"
	config_colors=$(curl -f $base16_i3_url 2>/dev/null)
fi

if [ -n "$config_colors" ]; then
	(echo "$config_colors" | sed "/^##\ Base16/,/^$/d; /^#\ Basic\ bar/,/^}/d; /^#\ Basic\ color/d") > ~/.config/i3/theme.conf
	i3-msg restart
	exit 0
fi
exit 1

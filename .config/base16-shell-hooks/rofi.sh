#!/bin/bash

#Update rofi theme
( [ -f $HOME/.config/rofi/base16-rofi/themes/base16-$BASE16_THEME.rasi ] \
 && ln -sf base16-rofi/themes/base16-$BASE16_THEME.rasi $HOME/.config/rofi/base16.rasi \
) || notify-send --urgency=critical --icon="/usr/share/icons/Arc/emblems/64/emblem-important.png" --expire-time=3500 "Theme base16-$BASE16_THEME does not exist for rofi"

#!/bin/bash

#Update xresources
( [ -f $HOME/.config/base16-xresources/xresources/base16-$BASE16_THEME-256.Xresources ] \
 && ln -sf xresources/base16-$BASE16_THEME-256.Xresources $HOME/.config/base16-xresources/base16.Xresources \
 && xrdb $HOME/.Xresources \
) || notify-send --urgency=critical --icon="/usr/share/icons/Arc/emblems/64/emblem-important.png" --expire-time=3500 "Theme base16-$BASE16_THEME does not exist for Xresources"

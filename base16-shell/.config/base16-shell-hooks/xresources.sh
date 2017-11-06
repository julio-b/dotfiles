#!/bin/bash

#Update xresources
TMPFILE=`mktemp -q /tmp/Xresources.XXXXXXXXXX` \
 && ( [ -f $HOME/.config/base16-xresources/xresources/base16-$BASE16_THEME-256.Xresources ] \
 && (head -n -2 $HOME/.Xresources && echo -e "#include \".config/base16-xresources/xresources/base16-$BASE16_THEME-256.Xresources\"\n! vim:ft=xdefaults" ) > $TMPFILE \
 && cp $TMPFILE $HOME/.Xresources && xrdb $HOME/.Xresources ) \
  || notify-send "Theme base16-$BASE16_THEME does not exist for Xresources"

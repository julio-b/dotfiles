#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

setxkbmap -layout us,gr -option grp:shifts_toggle
xset s 240 60
xset dpms 900 900 900
xset b 6 760 100

mkdir -p ~/.config/i3
echo "---- STARTUP $(date +"%Y-%m-%d %H:%M:%S") ----" > ~/.config/i3/stdout
echo "---- STARTUP $(date +"%Y-%m-%d %H:%M:%S") ----" > ~/.config/i3/stderr
exec /usr/bin/i3 >> ~/.config/i3/stdout 2>> ~/.config/i3/stderr

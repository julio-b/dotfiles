#!/bin/bash
DOTSDIR="$( dirname "$(realpath $0)" )"
BASE16SHELL_DIR=$DOTSDIR/base16-shell/.config/base16-shell/

# Update submodules to latest commit
git -C "$DOTSDIR" submodule update --init --recursive --remote
if [ $? -ne 0 ];
then
	echo "Error: Submodule update failed" >>/dev/stderr
	exit 2
fi

git -C "$DOTSDIR" add "$DOTSDIR/base16-shell/.config/base16-shell"

# Patch base16shell
if [ ! -f $DOTSDIR/0001-Update-i3-xresources-themes-with-profile_helper.patch ];
then
	echo "Error: No patch file!" >>/dev/stderr
	exit 1
fi
git -C "$BASE16SHELL_DIR" am -3 < $DOTSDIR/0001-Update-i3-xresources-themes-with-profile_helper.patch
if [ $? -ne 0 ];
then
	git -C "$BASE16SHELL_DIR" mergetool
	git -C "$BASE16SHELL_DIR" am --continue
fi

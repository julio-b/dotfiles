#
# ~/.bash_profile
#

# dm will load profile by itself, not needed inside bashrc
# load env only when launching a login shell from tty.
[[ -f ~/.profile ]] && . ~/.profile
[[ -f ~/.bashrc ]] && . ~/.bashrc

if [[ -z $DISPLAY ]] && [[ $(tty) = /dev/tty1 ]]; then
	exec startx
fi

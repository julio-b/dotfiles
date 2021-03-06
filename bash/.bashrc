# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash
[ -r /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash

for file in ~/.{bash_prompt,aliases,functions,path,extra,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file

shopt -s checkwinsize
shopt -s histappend
shopt -s nocaseglob
shopt -s cdspell

if [ -f $HOME/.dircolors ]
then
    eval "$(dircolors -b $HOME/.dircolors)"
else
    eval "$(dircolors -b)"
fi

BASE16_SHELL=$HOME/.config/base16-shell/
BASE16_SHELL_HOOKS=$HOME/.config/base16-shell-hooks/
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"

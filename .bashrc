# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion
[ -r /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash
[ -r /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --no-sort"
#
# __fzf_readline ()
# {
#     builtin eval "
#         builtin bind ' \
#             \"\C-x3\": $(
#                 builtin bind -l | command fzf +s +m --toggle-sort=ctrl-r
#             ) \
#         '
#     "
# }
#
# builtin bind -x '"\C-x2": __fzf_readline';
# builtin bind '"\C-x1": "\C-x2\C-x3"'
#
# _fzf_complete_ssh_notrigger() {
#     FZF_COMPLETION_TRIGGER='' _fzf_host_completion
# }
#
# complete -o bashdefault -o default -F _fzf_complete_ssh_notrigger ssh
#

for file in ~/.{bash_prompt,aliases,functions,path,extra,exports}; do
	if [[ -r "$file" ]] && [[ -f "$file" ]]; then
		source "$file"
	fi
done
unset file

run-help() { help -m "$READLINE_LINE" 2>/dev/null || man "$READLINE_LINE"; }
bind -m vi-insert -x '"\eh": run-help'

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


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

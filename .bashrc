# If not running interactively, don't do anything
[[ $- != *i* ]] && return
PS1='[\u@\h \W]\$ '

[ -r /usr/share/doc/pkgfile/command-not-found.bash ] && . /usr/share/doc/pkgfile/command-not-found.bash
[ -r /usr/share/bash-completion/bash_completion ] && . /usr/share/bash-completion/bash_completion

[ -r /usr/share/fzf/completion.bash ] && . /usr/share/fzf/completion.bash
[ -r /usr/share/fzf/key-bindings.bash ] && . /usr/share/fzf/key-bindings.bash
export FZF_CTRL_T_OPTS="--select-1 --exit-0"
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --no-sort"

run-help() {
    local TRIMED_LINE
    TRIMED_LINE=${READLINE_LINE#"${READLINE_LINE%%[![:space:]]*}"}
    TRIMED_LINE=${TRIMED_LINE%"${TRIMED_LINE##*[![:space:]]}"}
    TRIMED_LINE=${TRIMED_LINE%% -*}
    # shellcheck disable=SC2086         #not quoted ↓↓:  should be man git add #not man 'git add'
    help -m  "$TRIMED_LINE" 2>/dev/null || man $TRIMED_LINE
}
bind -m vi-insert -x '"\eh": run-help'

for file in {aliases,bash_prompt,functions}; do
	if [[ -r ~/.config/bashrc/"${file}" ]]; then
		source ~/.config/bashrc/"${file}"
	fi
done
unset file

HISTFILE=~/.bash_history
HISTCONTROL="ignoreboth:erasedups"
HISTTIMEFORMAT="[%F %T] "
HISTSIZE=-1
HISTIGNORE="ls:l:la:ll:cd:cd -:-:cd /tmp*:tmpd*:pwd:exit:\:q:date:history:history :h:vim:vi:v:nvim:git s:git log:git logs:git tree:git diff:myip:dmesg*"

shopt -s histappend
shopt -s histreedit histverify
# save multiline history
shopt -s cmdhist lithist

shopt -s checkwinsize
shopt -s nocaseglob
shopt -s cdspell
shopt -s extglob
shopt -s checkjobs

if hash vivid 2>/dev/null; then
	export LS_COLORS="$(vivid generate ayu)"
fi

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

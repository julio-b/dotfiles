#!/bin/bash
export TERMINAL='kitty'
export VISUAL='nvim'
export EDITOR='nvim'

if [ -n "$DISPLAY" ]; then
	export BROWSER='firefox --private'
else
	export BROWSER='links'
fi

export LESS='-RFiJWXM --incsearch --use-color -Dd+g$-Du+m'

export MANPAGER="less -R --use-color -Dd+r -Du+b"

export PATH=$HOME/.bin:$HOME/.riscv/bin:$PATH

export LIBVA_DRIVER_NAME=nvidia

unset SSH_AGENT_PID
export SSH_AUTH_SOCK=${XDG_RUNTIME_DIR}/gnupg/S.gpg-agent.ssh
#export GPG_TTY=$(tty)
#gpg-connect-agent updatestartuptty /bye >/dev/null

# vim: ft=sh

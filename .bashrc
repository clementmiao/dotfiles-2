# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Shell-independant code: everything we set here must be exported before we run
## our favorite shell.

## Terminal
## WARNING: This is often a bad idea!
## FreeBSD urxvt $TERM variable is not set properly for some reasons.
# if [ ! "$(uname -o)" = "GNU/Linux" ]; then
# 	case "$TERM" in
# 	*rxvt*) export TERM="rxvt-unicode-256color";;
# 	esac
# fi
## Most xterm-based terminals support 256 colors, so let's turn this on.
# if [ "$TERM" = "xterm" ]; then
# 	export TERM="xterm-256color"
# fi
## Title: If this is an xterm set the title to user@host:dir
#case "$TERM" in
#xterm*|rxvt*)
#    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
#    ;;
#*)
#    ;;
#esac

## Enable color support of ls.
if [ "$TERM" != "dumb" ]; then
	if [ "$OSTYPE" = "linux-gnu" ]; then
		eval "$(dircolors "$HOME/.dircolorsdb")"
	else
		export LSCOLORS="Ex"
		# export LSCOLORS="ExfxcxDxCxdxdxCxCxECEh"
	fi
fi

for shell in fish zsh; do
	command -v $shell >/dev/null 2>&1 && exec $shell
done

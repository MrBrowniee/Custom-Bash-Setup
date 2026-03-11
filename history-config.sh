export HISTFILE="$HOME/.config/bash/history"
shopt -s histappend
export HISTSIZE=50000
export HISTFILESIZE=50000

#Avoid duplicate entries and leading spaces
export HISTCONTROL=ignoredups:ignorespace

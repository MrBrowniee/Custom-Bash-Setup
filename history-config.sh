# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#Your history file
export HISTFILE="$HOME/.config/bash/history"
shopt -s histappend
#Amount of history lines allowed in memory
export HISTSIZE=5000
#Amount of history lines allowed in history file
export HISTFILESIZE=50000

#Avoid duplicate entries and leading spaces
export HISTCONTROL=ignoredups:ignorespace

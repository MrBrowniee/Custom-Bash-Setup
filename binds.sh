#Stop sourcing if shell is non-interactive
[[ $- == *i* ]] || return

#Case insensitive auto complete
bind 'set completion-ignore-case on'

#
bind -x '"\C-l":__custom_clear'

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#Case insensitive auto complete
bind 'set completion-ignore-case on'

#Custom clear command bound to CTRL + L
bind -x '"\C-l":__custom_clear'

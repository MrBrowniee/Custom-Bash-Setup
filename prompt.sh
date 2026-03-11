#Unset Linux mint default prompt behavior
unset color_prompt
unset force_color_prompt

#Original .bashrc prompt value
#PS1='${debian_chroot:+($debian_chroot)}\[\e[1;35m\][\t] \[\e[1;4;32m\]${USER^}\[\e[0;35m\] @ \[\e[1;36m\]\w \[\e[1;31m\]\$ \[\e[0;37m\]'

#Load git prompt scripts
if [ -f /usr/share/git/git-prompt.sh ]; then
    . /usr/share/git/git-prompt.sh
fi

#Normal prompt
normal_prompt="\[\e[1;35m\][\t] \[\e[1;4;32m\]${USER^}\[\e[0;35m\] @ \[\e[1;36m\]\w \[\e[1;31m\]\$ \[\e[0;37m\]"

#Git prompt
git_prompt="\[\e[1;35m\][\t] \[\e[1;4;32m\]${USER^}\[\e[0;35m\] @ \[\e[1;36m\]\w$(__git_ps1 " (%s)") \[\e[1;31m\]\$ \[\e[0;37m\]"



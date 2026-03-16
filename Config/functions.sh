# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

#Aliasing brave launch from command line for multiple profiles
unalias brave 2>/dev/null

brave() {
    #Help flag for for checking the options
    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        cat <<EOF
Improved command to launch brave browser with desired profile.
Usage: brave [options]

Options:
    -m, --main  Open main profile
    -w, --work  Open work profile
EOF
        return
    fi


    #Function logic section

    #Initialize profile flags
    local profile_flag=()
    case "$1" in 
        --main | -m)
            profile_flag=(--profile-directory="Profile 3")
            shift
            ;;
        --work | -w)
            profile_flag=(--profile-directory="Profile 4")
            shift
            ;;
    esac

    command nohup brave-browser "${profile_flag[@]}" "$@" >/dev/null 2>&1 & disown
    #printf "Opening Brave with $profile_flag"
}

#Recursively change file permissions inside current directory
fileperm() {
    #Help flag for for checking the options
    if [[ "$1" == "--help" || "$1" == "-h" ]]; then
        cat <<EOF
Recursively change permissions for only files inside target directory and its subdirectories. 
Usage: fileperm [options]

Options:
    -a-x, --all-x   Remove execution bit from everyone
    -u_rw, user_rw  Only owner can read and write files
EOF
        return
    fi

    #Function logic section
    local exec_flag=()
    case "$1" in
    #Remove execution bit from everyone
    --all-x | -a-x)
        exec_flag=(-exec chmod a-x)
        shift
        ;;
    #Only owner can read and write files
    --user_rw | -u_rw)
        exec_flag=(-exec chmod 600)
        shift
        ;;
    esac
    command find . -type f "${exec_flag[@]}" -- {} +
}

#Print current date when opening terminal
print_date() {
    printf "$(date '+\e[1;31m%A \e[1;36m%-d.%-m.\e[0;36m%Y') \n\e[0m"
}

#Reprint the date on top of terminal when clearing terminal with hotkey
__custom_clear() {
    command clear
    print_date
}

#Switch to git prompt automatically
set_prompt() {
    if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        #Set git prompt inside git directories
        PS1="$git_prompt"
    else
        PS1="$normal_prompt"
    fi
}

#Make new dir > cd into new dir
mkcd() {
    mkdir "$1" && cd "$1"
}
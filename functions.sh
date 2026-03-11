#Create scripts for Github repo (backup)
#mkscript() {
    #dir=$1
    #mkdir -p "$dir" &&
    #: > "$dir/$dir.sh" &&
    #: > "$dir/readme.md"
#}

#mkscript2() {
    #dir=$1
    #mkdir -p $dir 
    #{
        #printf "#!/usr/bin/env bash \n"
        #printf "set -euo pipefail \n"
    #} > $dir/$dir

    #if [[ ! -e "$readme_file" ]];then
        #cat > "$readme_file" << 
#}

#Aliasing brave launch from command line for multiple profiles
unalias brave 2>/dev/null

brave() {
    #Initialize profile flags
    local profile_flag=()
    case "$1" in 
        main)
            profile_flag=(--profile-directory="Profile 3")
            shift
            ;;
        work)
            profile_flag=(--profile-directory="Profile 4")
            shift
            ;;
    esac

    command nohup brave-browser "${profile_flag[@]}" "$@" >/dev/null 2>&1 & disown
    #printf "Opening Brave with $profile_flag"
}

#Recursively change file permissions inside current directory
fileperm() {
    #Remove execution bit from everyone
    find . -type f -exec chmod a-x -- {} +
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
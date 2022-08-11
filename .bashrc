#
# ~/.bashrc
#

#set -o vi
export EDITOR=vim

## Aliases
alias ls='ls --color=auto'
alias ncdu='ncdu --exclude .snapshots'
#alias ssh='kitty +kitten ssh'

## Task & Time warrior aliases
alias tsum='timew summary :id :anno'

## Dotfile Management
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

#alias ddbash='docker exec -it $( docker container ls --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}' | fzf | awk '{print $1}' ) bash'

## Package Management Functions
pkgbrowse() {
  pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'
}

pkginstall() {
  yay -Slq | fzf -q "$1" -m --preview 'yay -Si {1}'| xargs -ro yay -S
}

pkgremove() {
  yay -Qeq | fzf -q "$1" -m --preview 'yay -Qi {1}' | xargs -ro yay -Rns
}

scan() {
  ls -a | fzf --preview 'ls -A {}' | xargs realpath
}

## Create a popup timer
pom() {
  time_msg() {  
    #sleep "${1}" && notify-send --urgency=critical --expire-time=6000 --app-name=TaskWarrior "Time's Up!" "Review your tasks..."
    sleep "${1}" && zenity --warning --width=400 --height=200 --text="\n\n\nTimes's Up! Review your tasks...  " --ok-label="Ok" 
    #zenity --notification --text="Time's Up!"
  }
  #kill $(cat /tmp/pom.pid)
  time_msg "${1:-30m}"
  #echo "$!" > /tmp/pom.pid
}

# Set Custom Colour Scheme for each new Terminal
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

## Bash Prompt Configuration
PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs

__prompt_command() {
    local EXIT="$?"                # This needs to be first
    PS1=""

    local RCol='\[\e[0m\]'

    local Red='\[\e[0;31m\]'
    local Gre='\[\e[0;32m\]'
    local BYel='\[\e[1;33m\]'
    local BBlu='\[\e[1;34m\]'
    local Pur='\[\e[0;35m\]'

    if [ $EXIT != 0 ]; then
        PS1+="${Red}[ ${EXIT} ]${RCol}"        # Add red if exit code non 0
    else
	PS1+="${RCol}"	
    fi

    PS1+="[${BBlu}\u${RCol}@${BBlu}\h ${RCol}\$(date +%R) ${BBlu}\W${RCol}]$ "
}
export PATH="${PATH}:/home/grey/.local/bin"

## Create a landing page for Bash
pfetch

## Export Variables
export XLSX_FILE=TRUE

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

export TERM=xterm-256color

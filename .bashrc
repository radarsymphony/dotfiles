## BASHRC
## -------------------------------------------

## IMPORT BASHRC FILES
## -------------------------------------------

source ~/.bashrc.d/*

## ALIASES
## -------------------------------------------

alias ls='ls --color=auto'
alias ncdu='ncdu --exclude .snapshots --exclude /proc'
alias top='htop'
#alias ssh='kitty +kitten ssh'

## Dotfile Management
alias dotfile='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

## Task & Time warrior
alias tsum='timew summary :id :anno'
alias tl='task priority.any: or +MONTH or +next'

## Docker
#alias ddbash='docker exec -it $( docker container ls --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}' | fzf | awk '{print $1}' ) bash'

## FUNCTIONS
## -------------------------------------------

## Package Management 
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
    sleep "${1}" && zenity --warning --width=400 --height=200 --text="\n\n\nTimes's Up! Review your tasks...  " --ok-label="Ok" 
  }
  time_msg "${1:-30m}"
}

## EXPORT VARIABLES
## -------------------------------------------

## Taskwarrior & Timewarrior
export XLSX_FILE=TRUE

# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION

## Exported Variables
export PATH="${PATH}:/home/grey/.local/bin"
export EDITOR=vim
export TERM=xterm-256color

## CUSTOMIZE TERMINAL
## -------------------------------------------

## Enable Vi-style shell navigation
#set -o vi

## Set Custom Colour Scheme 
(cat ~/.cache/wal/sequences &)
source ~/.cache/wal/colors-tty.sh

## Bash Prompt Configuration
PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs

__prompt_command() {
    local EXIT="$?"                # This needs to be first

    local RCol='\[\e[0m\]'
    local Red='\[\e[1;31m\]'
    local Gre='\[\e[2;32m\]'
    local BYel='\[\e[0;33m\]'
    local BBlu='\[\e[0;34m\]'
    local Pur='\[\e[0;35m\]'

    PS1="${Gre}\$([ \j -gt 0 ] && echo '\jz ')${RCol}[${BBlu}\u${RCol}@${BBlu}\h ${RCol}\$(date +%R) ${BBlu}\W${RCol}]"


    if [ $EXIT != 0 ] && [ $EXIT -le 128 ] ; then
        PS1+="${Red} ${EXIT} ${RCol}"        # Add red if exit code non 0
    else
		PS1+="${RCol}"	
    fi

    PS1+="$ "
}

## Create a landing page for Bash
pfetch


## BASHRC
## -------------------------------------------

## IMPORT BASHRC FILES
## -------------------------------------------

BASHRCDIR=~/.bashrc.d/
if [ -d $BASHRCDIR ]
then
    for bashrc in $BASHRCDIR/*
    do
       test -f $bashrc && source $bashrc
    done
fi

## EXPORT VARIABLES
## -------------------------------------------

## Exported Variables
export PATH="${PATH}:${HOME}/.local/bin"
export VISUAL=vim
export EDITOR="$VISUAL"
#export TERM=xterm-256color
export TERM=xterm-kitty

## Taskwarrior & Timewarrior
export XLSX_FILE=TRUE

# BEGIN_KITTY_SHELL_INTEGRATION
#if test -n "$KITTY_INSTALLATION_DIR"; then
#    export KITTY_SHELL_INTEGRATION="no-cursor"
#    source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"
#fi
# END_KITTY_SHELL_INTEGRATION


## ALIASES
## -------------------------------------------

alias df='df -h'
alias diff='diff --color'
alias free='free -h'
alias ls='ls -h --color=auto'
alias ncdu='ncdu --exclude="/.snapshots" --exclude="/var/.snapshots" --exclude="/home/.snapshots" --exclude /proc'
alias ssh='kitty +kitten ssh'
alias top='htop'
alias tree='tree -a'

## Dotfile Management
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

## Task & Time warrior
alias tsum='timew summary :id :anno'
alias tcsv='timew report csv.sh'
alias tl='task +PRIORITY or +MONTH or +next or +ACTIVE'
alias tt='taskwarrior-tui'

## Docker
#alias dbash='docker exec -it $( docker container ls --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}' | fzf | awk '{print $1}' ) bash'

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
    sleep "${1:-30m}" && zenity --warning --width=400 --height=200 --text="\n\n\n${2:-Times Up! Review your tasks...}" --ok-label="Ok" 
}

## CUSTOMIZE TERMINAL
## -------------------------------------------

## Enable Vi-style shell navigation
#set -o vi

## Set Custom Colour Scheme 
if command -v wal &>/dev/null; then
    #sequences seems to break the cursor so text under it does not show. Sourcing colors.sh works better for me.
	#(cat ~/.cache/wal/sequences &)
	source ~/.cache/wal/colors.sh
	source ~/.cache/wal/colors-tty.sh
fi

## Bash Prompt Configuration
#PROMPT_COMMAND=__prompt_command    # Function to generate PS1 after CMDs
#
#__prompt_command() {
#    local EXIT="$?"                # This needs to be first
#
#    local RCol='\[\e[0m\]'
#    local Red='\[\e[1;31m\]'
#    local Gre='\[\e[2;32m\]'
#    local BYel='\[\e[0;33m\]'
#    local BBlu='\[\e[0;34m\]'
#    local Pur='\[\e[1;35m\]'
#
#    PS1="${Gre}\$([ \j -gt 0 ] && echo '\jz ')${RCol}[${Pur}\u${RCol}@${Pur}\h ${RCol}\$(date +%R) ${BBlu}\W${RCol}]"
#
#
#    if [ $EXIT != 0 ] && [ $EXIT -le 128 ] ; then
#        PS1+="${Red} ${EXIT} ${RCol}"        # Add red if exit code non 0
#    else
#		PS1+="${RCol}"	
#    fi
#
#    PS1+="$ "
#}

## Create a landing page for Bash
[[ -x $(command -v pfetch) ]] && pfetch


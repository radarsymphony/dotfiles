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
export GRAVEYARD="${HOME}/.local/share/Trash"
#export TERM=xterm-256color
export HOSTNAME="$(hostname -s || echo "nohostname" )"

export HISTTIMEFORMAT="%F %T "

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

alias bashly='docker run --rm -it --user $(id -u):$(id -g) --volume "$PWD:/app" dannyben/bashly'
alias blog='cd $GITHUB_PATH/$GITHUB_USER/$GITHUB_SITE && /usr/bin/i3-msg -q layout tabbed && /usr/bin/kitty --detach /usr/bin/hugo server --environment staging --buildDrafts --navigateToChanged && /usr/bin/firefox --new-window localhost:1313 && nvim ./content'
#alias cat='/usr/bin/bat'
alias code='/usr/bin/neovide'
alias kitty-clone='clone-in-kitty --type=os-window'
alias df='df -h'
alias diff='diff --color'
alias free='free -h'
alias ghsrc='cd $GITHUB_PATH/$GITHUB_USER'
alias ls='ls -h --color=auto'
alias ncdu='sudo ncdu --exclude="/.snapshots" --exclude="/var/.snapshots" --exclude="/home/.snapshots" --exclude /proc'
[ "$TERM" == "xterm-kitty" ] && \
    alias ssh='kitty +kitten ssh'
alias router='\ssh -i ~/.ssh/id_rsa root@192.168.1.1'
alias ssh-vpn-etude='\ssh -i ~/.ssh/id_rsa -J root@etude.vpn.knightsdata.com grey@192.168.1.111'
alias rsync='rsync -avXx'
alias structurizr='docker run -it --rm -p 8081:8080 -v "$PWD:/usr/local/structurizr" -v "$PWD/../_common:/usr/local/_common" structurizr/lite'
alias temp='${EDITOR} $(mktemp)'
alias tree='tree -a'
alias vld='cd /var/local/data/'
alias vlds='cd /var/local/data/_system/'
alias vldb='cd /var/local/db/'
alias wttr='curl wttr.in/Victoria+Canada?format=+%c+%f+%w+%p+%h && echo""'

vi() {
    #if command -v /usr/bin/neovide > /dev/null; then
    #    /usr/bin/neovide "${@}"
    if command -v /usr/bin/nvim > /dev/null; then
       /usr/bin/nvim "${@}"
    elif command -v /usr/bin/vim > /dev/null; then
        /usr/bin/vim "${@}"
    elif command -v /usr/bin/vi > /dev/null; then
        /usr/bin/vi "${@}"
    else
        /bin/vi "${@}"
    fi
}

## Dotfile Management
alias dot='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

## Task & Time warrior
alias tsum='timew summary :id :anno'
alias tcsv='timew report csv.sh'
alias tl='task +PRIORITY or +MONTH or +next or +ACTIVE'
alias tt='taskwarrior-tui'

## Docker
#alias dbash='docker exec -it $( docker container ls --format 'table {{.Names}}\t{{.Image}}\t{{.Status}}' | fzf | awk '{print $1}' ) bash'
alias dpss='docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Status}}"'

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

dcshas() {
    docker inspect --format '{{.RepoDigests}}' $( docker compose images --quiet | xargs ) | sed -E 's/(\[|\])//g'
}

dstats() {
    docker stats $( docker container ls --format '{{.Names}}' | grep "${1}" | xargs )
}

revdns() {
    while read -r file; do echo $file | tr '.' '\n' | tac | xargs | tr ' ' '.' ; done < <(ls "${1:-.}") | sort
}

blue() {
    local usage="${FUNCNAME[0]} [ on | off | connect | disconnect | status ]"

    [[ -z "${1}" ]] && echo "${usage}" && return
    [[ "${1}" != on && "${1}" != off && "${1}" != connect && "${1}" != disconnect && "${1}" != status ]] && echo "${usage}" && return

    case "${1}" in
        on | connect )
            bluetoothctl power on
            device=$(bluetoothctl devices | fzf | cut -d" " -f2 | xargs)
            bluetoothctl info "${device}" | grep -q "Connected: no" && bluetoothctl connect "${device}"
            #bluetoothctl devices Connected | cut -d" " -f3-
            ;;
        off | disconnect )
            bluetoothctl disconnect
            bluetoothctl power off
            ;;
        status )
            bluetoothctl info || bluetoothctl show
            ;;
        *)
            echo "${usage}" && return
        ;;
    esac
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

[[ $- = *i* ]] && [[ -e /usr/bin/liquidprompt ]] && source /usr/bin/liquidprompt

## Create a landing page for Bash
[[ -x $(command -v pfetch) ]] && pfetch


#
# ~/.bashrc
#

#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias grep='grep --color=auto'
alias cat='bat --style=plain --paging=never'
alias ls='exa --group-directories-first'
alias ll='ls -la'
alias tree='exa -T'
alias dotfiles="git --git-dir $HOME/.dotfiles/ --work-tree $HOME"
alias ssha='eval $(ssh-agent) && ssh-add ~/.ssh/id_ed25519_graphenX'
alias rdsrv='rdesktop 192.168.0.100 -u Administrator -p "$1" -k es 2>/dev/null &'

function mkt(){
  mkdir {nmap,scripts,exploits,content}
}

function extractPorts(){
  echo -e "\n${yellowColour}[*] Extracting information...${endColour}\n"
  ip_address=$(cat allPorts | grep -oP '\d{1,3}\.\d{1,3}\.\d{1,3}\.\d{1,3}' | sort -u)
  open_ports=$(cat allPorts | grep -oP '\d{1,5}/open' | awk '{print $1}' FS='/' | xargs | tr ' ' ',')
  echo -e "\t${blueColour}[*] IP Address: ${endColour}${grayColour}$ip_address${endColour}"
  echo -e "\t${blueColour}[*] Open ports: ${endColour}${grayColour}$open_ports${endColour}"

  echo $open_ports | tr -d '\n' | xclip -sel clip
  echo -e "\n${yellowColour}[*] Ports has been copied to clipboard!${endColour}\n"
}

# https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
. ~/.git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[33m\]$(__git_ps1 "(%s)")\[\033[37m\]\$\[\033[00m\] '

[ -f ~/.fzf.bash ] && source ~/.fzf.bash


# neofetch --disable GPU

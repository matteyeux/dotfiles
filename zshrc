export ZSH="/home/mathieu/.oh-my-zsh"

ZSH_THEME="matteyeux"

plugins=(
  git
  sudo
  zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# core dumps
ulimit -c unlimited

alias dmesg="sudo dmesg -T"
alias df='df -h'
alias ipa='ip --brief --color a'
alias df='df -h'

# https://github.com/NoxInmortus/ultimate-bashrc
# get my public ip
alias myip='curl ipinfo.io/ip'

alias svi='sudo vi'

# pass generation
alias newpass="openssl rand -base64 20"

alias netstat="netstat -lntp"

alias ts="tmux new-session -s default_$(whoami)"

### autocompletion
# Highlight the current autocomplete option
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

# ssh/rsync/scp autocomplete
zstyle ':completion:*:(scp|rsync):*' tag-order ' hosts:-ipaddr:ip\ address hosts:-host:host files'
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-host' ignored-patterns '*(.|:)*' loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ':completion:*:(ssh|scp|rsync):*:hosts-ipaddr' ignored-patterns '^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))' '127.0.0.<->' '255.255.255.255' '::1' 'fe80::*'

# allow for autocomplete to be case insensitive
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' \
  '+l:|?=** r:|?=**'

# initialize the autocompletion
autoload -Uz compinit && compinit -i

# Extract everything
extract () {
	if [ -f $1 ] ; then
		case $1 in
			*.tar.bz2)	tar xjf $1	;;
			*.tar.gz)	tar xzf $1	;;
			*.bz2)		bunzip2 $1	;;
			*.rar)		rar x $1	;;
			*.gz)		gunzip $1	;;
			*.tar)		tar xf $1	;;
			*.tbz2)		tar xjf $1	;;
			*.tgz)		tar xzf $1	;;
			*.zip)		unzip $1	;;
			*.Z)		uncompress $1 ;;
			*)			echo "'$1' cannot be extracted via extract()" ;;
		esac
	else
		echo "'$1' is not a valid file"
	fi
}

ssh_tmux() {
	ssh -t "$1" tmux a || ssh -t "$1" tmux
}


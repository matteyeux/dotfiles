export ZSH="/home/mathieu/.oh-my-zsh"

ZSH_THEME="robbyrussell"

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


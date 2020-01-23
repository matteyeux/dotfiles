export ZSH="/home/mathieu/.oh-my-zsh"

ZSH_THEME="matteyeux"

plugins=(
  git
  sudo
  zsh-syntax-highlighting
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh

# fix perl crap
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

export THEOS=~/theos
export PATH=$PATH:~/.local/bin

# workaround for the PYTHONPATH error
python3_real_vers=$(python3 --version | cut -f 2 -d' ')
python3_vers=${python3_real_vers:0:3}
export PYTHONPATH="/home/mathieu/.local/lib/python$python3_vers/site-packages/"

# core dumps
ulimit -c unlimited

alias dmesg="sudo dmesg -T"
alias df='df -h'
alias ipa='ip --brief --color a'
alias df='df -h'
alias tailf='tail -f'
alias :q='exit'
alias myip='curl ipinfo.io/ip'
alias svi='sudo vi'
alias keygen='ssh-keygen -t rsa -b 4096 -C "$(hostname)"'
alias sl='ls --color=tty'
alias ida='wine64-development ~/.wine/drive_c/Program\ Files/IDA\ 7.0/ida.exe'
alias ida64='wine64-development ~/.wine/drive_c/Program\ Files/IDA\ 7.0/ida64.exe'
alias pipenv='virtualenv -p python3 env'
alias freeze='pip3 freeze | grep -v "pkg-resources" > requirements.txt'
alias newpass="openssl rand -base64 20 | cut -d '=' -f 1"
alias netstat="netstat -lntp"
alias ts="tmux new-session -s default_$(whoami)"
alias code="codium"
alias diff="diff --color"
alias run_jekyll='bundle exec jekyll server --host=0.0.0.0'

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
			*.tar.bz2)	tar jxvf $1	;;
			*.tar.gz)	tar zxvf $1	;;
			*.bz2)		bunzip2 $1	;;
			*.rar)		rar x $1	;;
			*.gz)		gunzip $1	;;
			*.tar)		tar xf $1	;;
			*.tbz2)		tar xjf $1	;;
			*.tgz)		tar zxvf $1	;;
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

# docker
alias dstop-all='docker stop $(docker ps -a -q)'
alias drm-all='docker rm $(docker ps -a -q)'
alias dls='docker image ls'

dockerip() {
        docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' $1
}

# Open a bash terminal in the container passed through argument 1 (id or name)
dbash() {
  docker exec -it $1 bash
}

drun() {
  docker exec -it $1 $2
}

sshportal() {
  ssh ${1}@sshportal $2
}

_remotepy() {
  local cachedir="${XDG_CACHE_HOME:-$HOME/.cache}/remotepy"
  local hostnames="${cachedir}"/remotepy.txt
  mkdir -p "${cachedir}"
  if ! test "$(find "${hostnames}" -mmin -15 2>/dev/null)"; then
    echo "select device from devices;" | sqlite3 ~/.remotepy.db > "${hostnames}".new
    if test -s "${hostnames}".new; then
      mv "${hostnames}"{.new,}
    else
      touch "${hostnames}"
    fi
  fi
  compadd $(cat "${hostnames}")
}
compdef _remotepy remotepy


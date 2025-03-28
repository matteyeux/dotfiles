export ZSH=$HOME/.oh-my-zsh

# This is the default theme.
# This repo comes with a custom one I made : matteyeux
ZSH_THEME="robbyrussell"

plugins=(
  git
  sudo
  zsh-syntax-highlighting
  colored-man-pages
)

source $ZSH/oh-my-zsh.sh


export VAGRANT_DEFAULT_PROVIDER=libvirt

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

export PYTHONSTARTUP=~/.pythonrc

# used by kubectl for multiple
# kube contexts (eg minukube and k8s cluster)
export KUBECONFIG=$HOME/.kube/config:$HOME/.kube/minikube

# core dumps
ulimit -c unlimited

alias dmesg="sudo dmesg -T"
alias df='df -h'
alias ipa='ip --brief --color a'
alias tailf='tail -f'
alias :q='exit'
alias myip='curl ipinfo.io/ip'
alias svi='sudo vi'
alias keygen='ssh-keygen -t rsa -b 4096 -C "$(hostname)"'
alias sl='ls --color=tty'
alias pipenv='virtualenv -p python3 env'
alias venv='source env/bin/activate'
alias freeze='pip3 freeze | grep -v "pkg-resources" > requirements.txt'
alias newpass="openssl rand -base64 20 | cut -d '=' -f 1"
alias ts="tmux new-session -s default_$(whoami)"
alias diff="diff --color"
alias run_jekyll='bundle exec jekyll server --host=0.0.0.0'
alias k=kubectl
alias gfun="git log --graph --pretty=format:'\''%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)%Cblue - %cn %Creset'\'' --abbrev-commit --date=relative'"
alias python="python3"
alias wtf='yes "$(seq 231 -1 16)" | while read i; do printf "\x1b[48;5;${i}m\n"; sleep .02; done'
alias ida='open -a "/Applications/IDA Professional 9.1.app"'
alias binja='open -a "/Applications/Binary Ninja.app"'
if [[ !$(which python) ]]; then
        alias python="python3"
fi

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


dockerip() {
        docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}} {{end}}' $1
}

# Open a bash terminal in the container passed through argument 1 (id or name)

sshportal() {
  ssh ${1}@sshportal $2
}

export_iboot_symbols() {
	iBoot64Finder -f $1 |  grep locate | sed  's/\[locate_func]: /dict_f[\"/g' | sed 's/ =/"] =/g'
}

bindiff () {
	xxd $1 > ${1}.xxd
	xxd $2 > ${2}.xxd
	
	vimdiff ${1}.xxd ${2}.xxd
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


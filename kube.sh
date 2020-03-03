#!/bin/bash
# kubernetes client related stuff

sudo apt update && apt install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt update
sudo apt install -y kubectl
sudo apt-mark kubectl

# setup a way to switch between
# clusters and namespaces in kubectl
git clone https://github.com/ahmetb/kubectx ~/.kubectx
sudo ln -s ~/.kubectx/kubectx /usr/local/bin/kubectx
sudo ln -s ~/.kubectx/kubens /usr/local/bin/kubens

mkdir -p ~/.oh-my-zsh/completions
chmod -R 755 ~/.oh-my-zsh/completions

ln -s ~/.kubectx/completion/kubectx.zsh ~/.oh-my-zsh/completions/_kubectx.zsh

source ~/.zshrc
ln -s ~/.kubectx/completion/kubens.zsh ~/.oh-my-zsh/completions/_kubens.zsh

#!/bin/bash
# script to install
# and setup my dotfiles
# ~matteyeux

# install my config files
cp zshrc ~/.zshrc
cp vimrc ~/.vimrc
cp nanorc ~/.nanorc
cp tmux.conf ~/.tmux.conf
cp muttrc ~/.muttrc
cp taskrc ~/.taskrc

mkdir -p ~/.config/terminator
cp terminator ~/.config/terminator/config

# install oh-my-zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install zsh highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# copy my ZSH custom theme 
# cp matteyeux.zsh-theme ~/.oh-my-zsh/themes/matteyeux.zsh-theme

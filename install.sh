#!/bin/bash
# script to install
# and setup my dotfiles
# ~matteyeux

# install my configs
cp zshrc ~/.zshrc
cp terminator ~/.config/terminator/config
cp vimrc ~/.vimrc
cp nanorc ~/.nanorc
cp tmux.conf ~/.tmux.conf

sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
#zsh -c "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# copy my custom theme
cp matteyeux.zsh-theme ~/.oh-my-zsh/themes/matteyeux.zsh-theme

#!/bin/bash
# script to install
# and setup my dotfiles
# ~matteyeux

# install and setup OH-MY-ZSH
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
cp zshrc ~/.zshrc
zsh -c git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# copy my custom theme
cp matteyeux.zsh-theme ~/.oh-my-zsh/themes/matteyeux.zsh-theme

# install my configs
cp terminator ~/.config/terminator/config
cp vimrc ~/.vimrc
cp nanorc ~/.nanorc

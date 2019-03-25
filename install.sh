#!/bin/bash

cp vimrc ~/.vimrc

# install and setup OH-MY-ZSH
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

cp zshrc ~/.zshrc
#git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

cp terminator ~/.config/terminator/config

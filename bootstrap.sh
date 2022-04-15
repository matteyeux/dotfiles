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
cp gdbinit ~/.gdbinit
cp gitconfig ~/.gitconfig
cp pythonrc ~/.pythonrc

read -p "Install Gruvbox theme for Vim ? " confirm

# if yes uncomment line 2 and 3
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
    mkdir -p ~/.vim/pack/themes/start
    git clone https://github.com/morhetz/gruvbox.git ~/.vim/pack/default/start/gruvbox
    sed -i -e "2,3s/^\" //" ~/.vimrc
fi

# set i3 config
mkdir -p ~/.config/i3
cp i3/* ~/.config/i3/

# set polybar config
mkdir -p ~/.config/polybar
cp polybar.conf ~/.config/polybar/config

# copy rofi config to its directory
mkdir -p ~/.config/rofi/
cp config.rasi ~/.config/rofi/

# set polybar with multiscreen
mkdir -p ~/.local/bin/
cp launch_polybar.sh ~/.local/bin/launch_polybar.sh

cp Xresources ~/.Xresources
xrdb ~/.Xresources

# install oh-my-zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install zsh highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# copy my ZSH custom theme 
# cp matteyeux.zsh-theme ~/.oh-my-zsh/themes/matteyeux.zsh-theme

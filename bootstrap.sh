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

read -p "Install Dracula theme for Vim ?" confirm

# if yes uncomment line 2 and 3
if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
	mkdir -p ~/.vim/pack/themes/start
	git clone https://github.com/dracula/vim.git  ~/.vim/pack/themes/start/dracula
	sed -i -e "3,4s/^\" //" ~/.vimrc
fi

# add terminator configuration
mkdir -p ~/.config/terminator
cp terminator ~/.config/terminator/config

# add sublime-text3 configuration
mkdir -p ~/.config/sublime-text-3
cp -r sublime-text-3/* ~/.config/



# install oh-my-zsh
# sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# install zsh highlighting
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# copy my ZSH custom theme 
# cp matteyeux.zsh-theme ~/.oh-my-zsh/themes/matteyeux.zsh-theme

#!/bin/bash

function link {
    ln -s "`pwd`/$1" ~/
}


#Directories
mkdir ~/.config/

ln -s "`pwd`/awesome/" ~/.config/
ln -s "`pwd`/fish/" ~/.config/

link '.oh-my-zsh/'
link '.vim/'
link '.i3/'

#Files
link '.vimrc'
link '.xinitrc'
link '.xsession'
link '.zshrc'
link '.conkyrc'
link '.Xresources'
link '.tmux.conf'

echo "==============="
echo "Dotfiles linked"
echo "==============="

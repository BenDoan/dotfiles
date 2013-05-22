#!/bin/bash

function link {
    if [[ ! -h ~/.${1%/} ]]; then # removes trailing slashes
        ln -s "`pwd`/$1" ~/.$1
        echo "Linking ${1}"
    fi

    if [[ -f ~/.$1 && ! -h ~/.$1 ]]; then
        echo "Error: regular file exists for $1"
    fi
}

function link_config {
    if [[ ! -h ~/.config/${1%/} ]]; then # removes trailing slashes
        ln -s "`pwd`/$1" ~/.config/
        echo "Linking ${1}"
    fi

    if [[ -f ~/.config/$1 && ! -h ~/.config/$1 ]]; then
        echo "Error: regular file exists for $1"
    fi
}


if [[ ! -d ~/.config ]]; then
    mkdir ~/.config/
fi

#Directories
link_config 'awesome/'
link_config 'fish/'

link 'vim'
link 'i3'
link 'fonts'

#Files
link 'vimrc'
link 'xsession'
link 'zshrc'
link 'conkyrc'
link 'tmux.conf'
link 'i3status.conf'

echo "==============="
echo "Dotfiles linked"
echo "==============="

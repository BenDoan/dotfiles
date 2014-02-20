#!/bin/bash

dotfiles=(vim i3 fonts vimrc xsession zshrc conkyrc tmux.conf i3status.conf profile)
dotfiles_config=(awesome fish)

function set_distro {
    if grep -q "Fedora" /etc/issue; then
        echo fedora > ~/.distro
    fi

    if grep -q "Debian" /etc/issue; then
        echo debian > ~/.distro
    fi

    if grep -q "Mint" /etc/issue; then
        echo debian > ~/.distro
    fi

    if grep -q "Ubuntu" /etc/issue; then
        echo debian > ~/.distro
    fi

    if grep -q "Arch" /etc/issue; then
        echo arch > ~/.distro
    fi
}

function link {
    #if link does not exist
    if [[ ! -h ~/.${1%/} ]]; then # removes trailing slashes
        ln -s "`pwd`/$1" ~/.$1
        echo "Linking $1"
    fi

    #if file exists and is not a link
    if [[ -f ~/.$1 && ! -h ~/.$1 ]]; then
        echo "Error: regular file exists for $1"
    fi
}

function unlink {
    if [[ -h ~/.${1} ]]; then
        rm ~/.$1
    fi
}

function link_config {
    #if link does not exist
    if [[ ! -h ~/.config/${1%/} ]]; then # removes trailing slashes
        ln -s "`pwd`/$1" ~/.config/
        echo "Linking $1"
    fi

    #if file exists and is not a link
    if [[ -f ~/.config/$1 && ! -h ~/.config/$1 ]]; then
        echo "Error: regular file exists for $1"
    fi
}

function unlink_config {
    if [[ -h ~/.$1 ]]; then
        rm ~/config/.$1
    fi
}


function link_files {
    #if dir does not exist
    if [[ ! -d ~/.config ]]; then
        mkdir ~/.config/
    fi

    #if dir does not exist
    if [[ ! -d ~/dotfiles/vimundo ]]; then
        mkdir ~/dotfiles/vimundo
    fi

    for item in ${dotfiles_config[*]}; do
        link_config $item
    done

    for item in ${dotfiles[*]}; do
        link $item
    done

    if [[ ! -h ~/.xinitrc ]]; then
        ln -s ~/.xsession ~/.xinitrc
    fi
}

function unlink_files {
    for item in ${dotfiles_config[*]}; do
        echo "Unlinking $item"
        unlink_config $item
    done

    for item in ${dotfiles[*]}; do
        echo "Unlinking $item"
        unlink $item
    done
}


case $1 in
    "install" )
        set_distro
        link_files
        ;;
    "remove" )
        unlink_files
        ;;
esac

#!/bin/bash

# add new dotfiles here
dotfiles=(vim i3 fonts vimrc xsession zshrc conkyrc tmux.conf i3status.conf profile gitignore_global gitconfig)
dotfiles_config=(awesome fish)

#colors
red='\e[0;31m'
green='\e[0;32m'
NC='\e[0m'

usage="Usage: `basename $0` [install | remove | status]"

if [ "$1" == "-h" ] ||
    [ "$1" == "--help" ]  ||
    [ "$1" == "help" ] ||
    [ "$1" == "" ]; then
  echo "$usage"
  exit 1
fi

function set_distro {
    if grep -q "Fedora" /etc/issue; then
        echo fedora > ~/.distro
    elif grep -q "CentOS" /etc/issue; then
        echo fedora > ~/.distro
    elif grep -q "Debian" /etc/issue; then
        echo debian > ~/.distro
    elif grep -q "Mint" /etc/issue; then
        echo debian > ~/.distro
    elif grep -q "Ubuntu" /etc/issue; then
        echo debian > ~/.distro
    elif grep -q "Arch" /etc/issue; then
        echo arch > ~/.distro
    else
        echo none > ~/.distro
        echo "Error: Could not identify distro"
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

function print_status {
    printf %b "${green}Linked: "
    for item in ${dotfiles[*]}; do
        if [[ -h ~/.$item ]]; then
            printf %b "$item "
        fi
    done
    printf %b "${NC}\n"

    printf %b "${red}Unlinked: "
    for item in ${dotfiles[*]}; do
        if [[ ! -h ~/.$item ]]; then
            printf %b "$item "
        fi
    done
    printf %b "${NC}\n"
}


case $1 in
    "install" )
        set_distro
        link_files
        ./_setup.sh
        ;;
    "uninstall" )
        unlink_files
        ;;
    "status" )
        print_status
        ;;
    * )
        echo "$usage"
        ;;
esac

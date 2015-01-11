#!/bin/bash
programs="zsh vim vim-X11 atool gimp meld gitk firefox python-pip python3 python3-pip libreoffice vlc curl tmux dmenu acpi emacs ImageMagick java-1.8.0-openjdk mosh wine git"

~/dotfiles/manage.sh install
git clone https://github.com/BenDoan/scripts ~/scripts

rmdir ~/Desktop ~/Downloads ~/Music ~/Public ~/Videos ~/Pictures ~/Templates >& /dev/null
mkdir ~/downloads ~/documents ~/music ~/pictures ~/bin >& /dev/null

echo ==============================
echo = Updating programs
echo ==============================
sudo yum update

echo ==============================
echo = Installing programs
echo ==============================
sudo yum install $programs -y

echo ==============================
echo = Installing Dev Tools
echo ==============================
sudo yum groupinstall "Development Tools" -y

echo ==============================
echo = Updating shell
echo ==============================
chsh -s /bin/zsh

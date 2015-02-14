programs="conky roxterm htop ntp emacs libreoffice rsync virtualbox virtualbox-host-modules zenity zsh gvim meld firefox chromium python2 python2-pip vlc curl tmux dmenu i3 acpi ImageMagick mosh git"
aur_programs="rofi" #not used currently

~/dotfiles/manage.sh install
git clone https://github.com/BenDoan/scripts ~/scripts

rmdir ~/Desktop ~/Downloads ~/Music ~/Public ~/Videos ~/Pictures ~/Templates >& /dev/null
mkdir ~/downloads ~/documents ~/music ~/pictures ~/bin >& /dev/null

echo ==============================
echo = Updating programs
echo ==============================
sudo pacman -Syu

echo ==============================
echo = Installing programs
echo ==============================
sudo pacman -S $programs

echo ==============================
echo = Updating shell
echo ==============================
chsh -s /bin/zsh

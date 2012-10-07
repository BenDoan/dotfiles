function link {
    ln -s "`pwd`/$1" ~/
}


#Directories
mkdir ~/.config/
ln -s "`pwd`/awesome/" ~/.config/

link '.oh-my-zsh/'
link '.vim/'

#Files
link '.vimrc'
link '.xinitrc'
link '.zshrc'
link '.conkyrc'
link '.Xresources'

echo "==============="
echo "Dotfiles linked"
echo "==============="

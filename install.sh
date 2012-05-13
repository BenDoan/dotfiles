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

echo "==============="
echo "Dotfiles linked"
echo "==============="

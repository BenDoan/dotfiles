rmdir ~/Desktop ~/Downloads ~/Music ~/Public ~/Videos ~/Pictures ~/Templates >& /dev/null
mkdir ~/downloads ~/documents ~/music ~/pictures ~/bin >& /dev/null

if [[ ! -d ~/bin/z ]]; then
    git clone https://github.com/rupa/z.git ~/bin/z
fi

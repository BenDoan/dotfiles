ZSH=$HOME/.oh-my-zsh
ZSH_THEME="steeef"
DISABLE_AUTO_UPDATE="true"
plugins=(battery)
source $ZSH/oh-my-zsh.sh
export PATH=/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/ben/.local/bin:/home/ben/bin:/usr/local/go/bin

export EDITOR="vim"
export XDG_CURRENT_DESKTOP=GNOME

setopt RM_STAR_WAIT
setopt NO_BEEP


# general aliases
alias ls='ls -hF --color=auto --group-directories-first'
alias lampp='sudo /opt/lampp/lampp'
alias ducks='du -cksh * | sort -rn|head -11' #lists files and file sizes

alias pi="sudo pip-python install"
alias pg='ps -Af | grep $1'

# yum aliases
alias ys="yum search"
alias yu="sudo yum update"
alias yi="sudo yum install"
alias yr="sudo yum remove"

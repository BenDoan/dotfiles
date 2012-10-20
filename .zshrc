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
alias windows='sh ~/scripts/start_xp.sh'
alias sd="sudo shutdown now"

alias pi="sudo pip-python install"
alias pg='ps -Af | grep $1'

# yum aliases
alias ys="yum search"
alias yu="sudo yum update"
alias yi="sudo yum install"
alias yr="sudo yum remove"

# aptitude aliases
alias api="sudo aptitude install"
alias aps="aptitude search"
alias apr="sudo aptitude remove"
alias app="sudo aptitude purge"
alias apu="sudo aptitude update"

alias acs="apt-cache search"

# git aliases
alias gpm="git push origin master"
alias gpd="git push origin dev"
alias gc="git commit -am"
alias ga="git add ."

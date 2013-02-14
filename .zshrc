#ZSH=$HOME/.oh-my-zsh
#ZSH_THEME="steeef"
#DISABLE_AUTO_UPDATE="true"
#plugins=(battery)
#source $ZSH/oh-my-zsh.sh


alias ..="cd .."
alias ...="cd ../.."

export PATH=/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/ben/.local/bin:/home/ben/bin:/usr/local/go/bin

# completion
setopt auto_menu # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end
unset CASE_SENSITIVE

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export EDITOR="vim"
export XDG_CURRENT_DESKTOP=GNOME

alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'

setopt RM_STAR_WAIT
setopt NO_BEEP


# general aliases
alias ls='ls -hF --color=auto --group-directories-first'
alias ll='ls -l'
alias lampp='sudo /opt/lampp/lampp'
alias ducks='du -cksh * | sort -rn|head -11' #lists files and file sizes
alias e=$EDITOR

# Computer Science
alias cs_screens="xrandr --output VGA1 --mode 1680x1050 --above LVDS1 && awsetbg /home/ben/Pictures/bg.jpg"
alias home_connect="ssh -D 1337 -X ben@simcaster.dyndns.org"

alias pi="sudo pip install"
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

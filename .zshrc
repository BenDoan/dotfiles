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
alias gpum="git push origin master"
alias gpud="git push origin dev"
alias gc="git checkout"
alias ga="git add ."

say() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

PS1="%n@%m:%~%# "

source $HOME/dotfiles/steeef.zsh-theme #theme

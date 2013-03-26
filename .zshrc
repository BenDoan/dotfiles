export PATH=/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/ben/.local/bin:/home/ben/bin:/usr/local/go/bin:/home/ben/bin/sbt/bin/
source dotfiles/steeef.zsh-theme

# completion
setopt auto_menu # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end
unset CASE_SENSITIVE

setopt SHARE_HISTORY

## Completions
autoload -U compinit
compinit -C

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"

for c in cp rm chmod chown rename;do
    alias $c="$c -v"
done

export GREP_OPTIONS='--color=auto'
export GREP_COLOR='1;32'

export EDITOR="vim"
export XDG_CURRENT_DESKTOP=GNOME

alias man='nocorrect man'
alias mkdir='nocorrect mkdir'
alias mv='nocorrect mv'

# 10 second wait for delete everythings
setopt RM_STAR_WAIT
setopt NO_BEEP

setopt NO_CASE_GLOB


# general aliases
alias ls='ls -hF --color=auto --group-directories-first'
alias ll='ls -l'
alias lampp='sudo /opt/lampp/lampp'
alias ducks='du -cksh * | sort -rn|head -11' #lists files and file sizes
alias e=$EDITOR
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias un="dtrx -v"

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
alias gpum="git push origin master"
alias gpud="git push origin dev"
alias gc="git checkout"
alias ga="git add ."

alias un='dtrx'

alias ack="ack-grep"

say() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

PS1="%n@%m:%~%# "

source $HOME/dotfiles/steeef.zsh-theme #theme

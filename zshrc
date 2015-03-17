export GOPATH=$HOME/code/playground/golang
export DISTRO=$(<~/.distro)

# completion
setopt auto_menu # show completion menu on succesive tab press
setopt complete_in_word
setopt always_to_end
unset CASE_SENSITIVE

setopt auto_remove_slash
setopt auto_cd

autoload -U compinit
compinit -C

bindkey -e

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ":completion:*" verbose yes
#zstyle ":completion:*" list-dirs-first true

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches'

#history
HISTSIZE=20000
SAVEHIST=20000
HISTFILE=~/.history

export EDITOR="vim"
export XDG_CURRENT_DESKTOP=GNOME

# 10 second wait for delete everythings
#setopt RM_STAR_WAIT
setopt NO_BEEP
setopt NO_CASE_GLOB


# general aliases
alias ls='ls -hF --color=auto --group-directories-first'
alias ll='ls -l'
alias tmux="tmux -2"

alias e=$EDITOR
alias o="xdg-open"

# bash one liners
alias cpv="rsync -poghb --backup-dir=/tmp/rsync -e /dev/null --progress --"
alias home_screens="xrandr --output eDP1 --mode 1920x1080 && xrandr --output VGA1 --mode 1440x900 --right-of eDP1"

alias pi="sudo pip install"
alias pg='ps -Af | grep -v grep | grep $1'

st(){sudo strace -e open $(ps -o lwp= -LC $1 | sed 's/^/-p/')}
backlight(){ echo "$1" | sudo tee /sys/class/backlight/intel_backlight/brightness }
say() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

# yum aliases
alias ys="yum search"
alias yu="sudo yum update"
alias yi="sudo yum install -y"
alias yr="sudo yum remove"

# aptitude aliases
alias api="sudo aptitude install"
alias aps="aptitude search"
alias apr="sudo aptitude remove"
alias app="sudo aptitude purge"
alias apu="sudo aptitude update"

alias acs="apt-cache search"

#arch
alias y="yaourt"
alias update="yaourt -Syua"
alias i="sudo pacman -S"
#list_packages(){"expac -HM "%011m\t%-20n\t%10d" $( comm -23 <(pacman -Qqen|sort) <(pacman -Qqg base base-devel|sort) ) | sort -n";}

# git aliases
alias gpm="git push origin master"
alias gpd="git push origin dev"
alias gpum="git push origin master"
alias gpud="git push origin dev"
alias ga="git add -A ."

alias -g ...='../../' #cd ...
alias -g ....='../../../' #cd ....
alias -g .....='../../../../' #cd .....

alias alert_helper='history|tail -n1|sed -e "s/^\s*[0-9]\+\s*//" -e "s/;\s*alert$//"'
alias alert='notify-send -i /usr/share/icons/gnome/32x32/apps/gnome-terminal.png "[$?] $(alert_helper)"'

for c in tar mv cp rm chmod chown rename link;do
    alias $c="$c -v"
done

source $HOME/dotfiles/liquidprompt/liquidprompt
if [ -d "~/bin/z" ]; then
    source $HOME/bin/z.sh > /dev/null
fi


PATH="$HOME/perl5/bin${PATH+:}${PATH}"; export PATH;
PERL5LIB="$HOME/perl5/lib/perl5${PERL5LIB+:}${PERL5LIB}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="$HOME/perl5${PERL_LOCAL_LIB_ROOT+:}${PERL_LOCAL_LIB_ROOT}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"$HOME/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=$HOME/perl5"; export PERL_MM_OPT;

source $HOME/.profile
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

# OPAM configuration
. $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

source ~/.zshrc.local >& /dev/null
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

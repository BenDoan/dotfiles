export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export DISTRO=$(<~/.distro)

# completion
setopt always_to_end
setopt append_history
setopt auto_cd
setopt auto_menu
setopt auto_remove_slash
setopt complete_in_word

unset CASE_SENSITIVE

autoload -U compinit
compinit -C

export PROMPT='%B%(?..[%?] )%b> '
export RPROMPT="%F{${1:-green}}%~%f"


autoload predict-on
autoload predict-off

bindkey -e

## case-insensitive (all),partial-word and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' list-colors "=(#b) #([0-9]#)*=36=31"
zstyle ":completion:*" verbose yes
zstyle ":completion:*" list-dirs-first true

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches'

#history
HISTSIZE=50000
SAVEHIST=50000
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

st(){sudo strace -e open $(ps -o lwp= -LC $1 | sed 's/^/-p/')}
say() { if [[ "${1}" =~ -[a-z]{2} ]]; then local lang=${1#-}; local text="${*#$1}"; else local lang=${LANG%_*}; local text="$*";fi; mplayer "http://translate.google.com/translate_tts?ie=UTF-8&tl=${lang}&q=${text}" &> /dev/null ; }

#arch
alias y="yaourt"
alias update="yaourt -Syua"
list_packages(){expac -s "%-30n %m" | sort -hk 2 | awk '{printf "%s %.0f MiB\n", $1, $2/1024/1024}' | column -t }

# git aliases
alias gpm="git push origin master"

alias -g ...='../../' #cd ...
alias -g ....='../../../' #cd ....
alias -g .....='../../../../' #cd .....

for c in tar mv cp rm chmod chown rename link rmdir; do
    alias $c="$c -v"
done

source $HOME/.profile
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib

[ -d ~/bin/z ] && source $HOME/bin/z/z.sh > /dev/null
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

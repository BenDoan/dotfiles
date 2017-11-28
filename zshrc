export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# completion
setopt always_to_end
setopt append_history
setopt auto_cd
setopt auto_menu
setopt auto_remove_slash
setopt complete_in_word
setopt histignorespace

unset CASE_SENSITIVE

autoload -U compinit
compinit -C

export PROMPT='%B%(?..[%?] )%b→ '
export RPROMPT="%F{${1:-green}}%~%f"

if [ -n "$SSH_CLIENT" ]; then
    export PROMPT="%F{${1:-yellow}}<%M>%f $PROMPT"
fi

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
export SUDO_EDITOR="$EDITOR"
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

alias home_screens="xrandr --output eDP1 --mode 1920x1080 && xrandr --output VGA1 --mode 1440x900 --right-of eDP1"

st(){sudo strace -e open $(ps -o lwp= -LC $1 | sed 's/^/-p/')}

list_packages(){expac -s "%-30n %m" | sort -hk 2 | awk '{printf "%s %.0f MiB\n", $1, $2/1024/1024}' | column -t }

get_random_file(){find . -type f | shuf -n 1}

function diffchars(){git diff --color-words=. --no-index $1 $2}
function diffwords(){git diff --color-words='[^[:space:]]|([[:alnum:]]|UTF_8_GUARD)+' --no-index $1 $2}

# Turn virtualenvs on/off
function von(){
    dirname=$(basename $(pwd))
    if [[ -n $dirname && -d $HOME/envs/$dirname ]]; then
        source $HOME/envs/$dirname/bin/activate
    fi
}
function voff(){deactivate}

alias resetres="xrandr --output eDP1 --mode 1920x1080"
alias clip="xclip -selection clipboard"

alias gpm="git push origin master"

if hash nvim 2> /dev/null; then
    alias vim="nvim"
fi

alias -g ...='../../' #cd ...
alias -g ....='../../../' #cd ....
alias -g .....='../../../../' #cd .....

for c in tar mv cp rm chmod chown rename link rmdir; do
    alias $c="$c -v"
done

eval $(dircolors ~/.dircolors)

source $HOME/.profile
export LD_LIBRARY_PATH=${LD_LIBRARY_PATH}:/usr/local/lib
export FZF_DEFAULT_COMMAND='ag -g ""'
export SYSTEMD_EDITOR="vim"

[ -d ~/bin/z ] && source $HOME/bin/z/z.sh > /dev/null
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

[ -f ~/.zshrc.local ] && source ~/.zshrc.local

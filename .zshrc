ZSH=$HOME/.oh-my-zsh
ZSH_THEME="steeef"
DISABLE_AUTO_UPDATE="true"
plugins=(git yum)
source $ZSH/oh-my-zsh.sh
export PATH=/usr/lib/ccache:/usr/local/bin:/usr/bin:/bin:/usr/local/sbin:/usr/sbin:/sbin:/home/ben/.local/bin:/home/ben/bin:/usr/local/go/bin

export editor=vim
export XDG_CURRENT_DESKTOP=GNOME

setopt RM_STAR_WAIT
setopt NO_BEEP


alias ls='ls -F --color'
alias lampp='sudo /opt/lampp/lampp'
alias reboot-win='sudo grub2-set-default 1 && reboot' #reboots into windows
alias ducks='du -cksh * | sort -rn|head -11' #lists files and file sizes
alias pi="sudo pip-python install"

command -v volnoti && volnoti &
command -v dunst && dunst &
command -v picom && picom --backend xrender --experimental-backends &
test -f ~/dotfiles/bin/battery-notify-daemon && ~/dotfiles/bin/battery-notify-daemon &
test -f ~/dotfiles/bin/uptime-notify-daemon && ~/dotfiles/bin/uptime-notify-daemon &

xrdb -merge ~/.Xresources
setxkbmap -option ctrl:nocaps
setxkbmap -option compose:caps
# disable XF86Favorites key
xmodmap -e 'keycode 164 = 0x0000'
xsetroot -solid '#335234'

exec i3

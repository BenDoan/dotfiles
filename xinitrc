command -v volnoti && volnoti &
command -v dunst && dunst &
command -v picom && picom --backend glx &

xrdb -merge ~/.Xresources
setxkbmap -option ctrl:nocaps
xsetroot -solid '#335234'

exec i3

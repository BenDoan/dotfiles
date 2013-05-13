conky &
xsetroot -solid '#335234' &
pactl set-sink-volume 0 '70%' &
xset -b &
xset dpms &
xset s off &
volumeicon &
dunst &
gnome-sound-applet &
nm-applet &
sh /home/ben/scripts/startup.sh &
eval `gnome-keyring-daemon`
exec i3 -V >> ~/.i3/i3log 2>&1

#programs
conky &

#applets
volumeicon || gnome-sound-applet &
nm-applet &

#daemons
dunst &
eval `gnome-keyring-daemon`
udisks-glue &

#settings
xsetroot -solid '#335234' &
pactl set-sink-volume 0 '70%' &
xset -b &
xset dpms &
xset s off &

sh /home/ben/scripts/startup.sh &
DEFAULT_SESSION=i3
exec i3 -V >> ~/.i3/i3log 2>&1

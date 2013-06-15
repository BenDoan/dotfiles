#applets
volumeicon &

#daemons
dunst &
eval `gnome-keyring-daemon`
udisks-glue -c ~/dotfiles/udisks-glue.conf &

#settings
xsetroot -solid '#335234' &
pactl set-sink-volume 0 '70%' &
xset -b &
xset dpms &
xset s off &

sh /home/ben/scripts/startup.sh &
DEFAULT_SESSION=i3
exec i3

#applets
volumeicon &

#daemons
dunst &
eval `gnome-keyring-daemon`
udisks-glue -c ~/dotfiles/udisks-glue.conf &
redshift -l 41.478747:-96.402283 -t 6500:3500 &

#settings
xsetroot -solid '#335234' &
pactl set-sink-volume 0 '70%' &
xset -b &
xset dpms &
xset s off &
setxkbmap -option ctrl:nocaps

sh /home/ben/scripts/startup.sh &
DEFAULT_SESSION=i3
exec i3

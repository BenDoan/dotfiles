#applets
volumeicon &

#daemons
dunst &
eval `gnome-keyring-daemon`
udisks-glue -c ~/dotfiles/udisks-glue.conf &
bash /home/ben/scripts/external_monitor.sh &
wicd-client --tray &

#settings
xsetroot -solid '#335234' &
amixer set 'Master' 20 &
xset -b &
xset dpms &
xset s 100000 100000 &
setxkbmap -option ctrl:nocaps &
asus-kbd-backlight max &

sh /home/ben/scripts/startup.sh &
DEFAULT_SESSION=i3
exec i3

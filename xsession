#daemons
dunst &
#udisks-glue -c ~/dotfiles/udisks-glue.conf &
#bash /home/ben/scripts/external_monitor.sh &
#~/bin/govis >> ~/.govislog &
#NetworkManager &

#notification bar
#volumeicon &
#clipit -d &
#nm-applet &

#settings
xsetroot -solid '#335234' &
#xset -b &
#xset dpms &
#xset s 100000 100000 &
setxkbmap -option ctrl:nocaps &

#sh /home/ben/scripts/startup.sh &
DEFAULT_SESSION=i3
#compton -b --backend glx --vsync opengl

#sleep 1

exec i3

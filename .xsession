xrandr --auto --output DVI-I-1 --mode 1440x900 --left-of VGA-1 &
conky &
awsetbg /home/ben/dotfiles/awesome/bg.png &
gnome-sound-applet &
nm-applet &
sh /home/ben/scripts/startup.sh &
eval `gnome-keyring-daemon`
udisks-glue &
exec i3

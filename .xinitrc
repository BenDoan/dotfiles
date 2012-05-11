#!/bin/sh

gnome-power-manager &
gnome-volume-manager &
eval `gnome-keyring-daemon` &
exec awesome

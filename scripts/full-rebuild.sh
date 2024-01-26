#!/bin/sh

/home/tilman/nixos-config/scripts/rebuild.sh
dconf reset -f /org/gnome/desktop
dconf reset -f /org/gnome/shell
dconf reset -f /org/gnome/mutter
dconf reset -f /org/gnome/settings-daemon/plugins/media-keys/

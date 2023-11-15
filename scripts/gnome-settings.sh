dconf dump /org/gnome/desktop/ | dconf2nix --root org/gnome/desktop/ > /home/tilman/nixos-config/gnome/dconf/desktop.nix
dconf dump /org/gnome/shell/ | dconf2nix --root org/gnome/shell/ > /home/tilman/nixos-config/gnome/dconf/shell.nix
dconf dump /org/gnome/mutter/ | dconf2nix --root org/gnome/mutter/ > /home/tilman/nixos-config/gnome/dconf/mutter.nix
dconf dump /org/gnome/settings-daemon/plugins/media-keys/ | dconf2nix --root org/gnome/settings-daemon/plugins/media-keys/ > /home/tilman/nixos-config/gnome/dconf/media-keys.nix


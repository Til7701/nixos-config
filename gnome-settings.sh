dconf dump /org/gnome/desktop/ | dconf2nix --root org/gnome/desktop/ > gnome/desktop.nix
dconf dump /org/gnome/shell/ | dconf2nix --root org/gnome/shell/ > gnome/shell.nix
dconf dump /org/gnome/mutter/ | dconf2nix --root org/gnome/mutter/ > gnome/mutter.nix


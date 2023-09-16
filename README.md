# My NixOS Configuration
This an extreme case of work in progress!
- There are a lot of absolute and relative paths mixed up.
- My name is not in some kind of variable. So it is hardcoded everywehere
- some other things...

## First installation
run `install.sh` before first rebuild

## GNOME
### Settings
To save the settings in nix:
1. change settings like you normally would
2. run `gnome-settings.sh`
3. run `full-rebuild.sh`
4. log out and back in again to apply permanently

Currently `/org/gnome/desktop` and `/org/gnome/shell` are being saved. To add more:
0. you might want to run `dconf dump / > dconf.settings` to find out where the settings are
1. add in `gnome-settings.sh`
2. add the new file to the imports in `home-manager.users.tilman.imports`


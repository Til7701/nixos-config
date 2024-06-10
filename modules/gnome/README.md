## GNOME
Gnome is the default desktop environment for this configuration.

### Settings
To save the settings in nix:
1. change settings like you normally would
2. run `gnome-settings.sh`
3. run `full-rebuild.sh`
4. log out and back in again to apply permanently

To add more settings:
1. you might want to run `dconf dump / > dconf.settings` to find out where the settings are
2. add in `gnome-settings.sh`
3. add the new file to the imports in `home-manager.users.${config.til7701.user}.imports`

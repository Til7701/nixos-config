# My NixOS Configuration
This is work in progress!

## First installation
run `install.sh` before first rebuild

## Username
The username module makes it easier to change the username for the system.
It also allows others to adapt this configuration for their own system.
However, there are still some absolute paths, that are relying on the username `tilman`. 
So be careful if you want to copy this configuration.

## GNOME
Gnome is the default desktop environment for this configuration.

### Settings
To save the settings in nix:
1. change settings like you normally would
2. run `gnome-settings.sh`
3. run `full-rebuild.sh`
4. log out and back in again to apply permanently

Currently `/org/gnome/desktop`, `/org/gnome/shell`, `/org/gnome/mutter` and 
`/org/gnome/settings-daemon/plugins/media-keys/` are being saved. To add more:
1. you might want to run `dconf dump / > dconf.settings` to find out where the settings are
2. add in `gnome-settings.sh`
3. add the new file to the imports in `home-manager.users.${config.til7701.user}.imports`

## Java
Install multiple JDKs with different priorities.
```nix
til7701 = {
    java = {
      enable = true;
      jdks = {
        jdk21 = {
          package = pkgs.jdk21;
          priority = 1;
        };
        jdk17 = {
          package = pkgs.jdk17;
          priority = 2;
        };
        jdk-latest-lts = {
          package = pkgs.jdk21;
          priority = 3;
        };
        jdk-stable = {
          package = pkgs.jdk;
          priority = 4;
        };
      };
    };
};
```

## Python
There is one global python installation. You can add python packages to the my-python package to install them globally.

{ config, pkgs, ... }:

let
  thisUser = "tilman";
in {
  imports =[
    ./common.nix
    ./T07LY9i/hardware-configuration.nix
    ./T07LY9i/configuration.nix
    ./modules
  ];

  tilman.common = {
    enable = true;
    user = thisUser;
  };

  tilman.gnome = {
    enable = true;
    user = thisUser;
  };

  tilman.zsh = {
    enable = true;
    user = thisUser;
  };

  tilman.java.enable = true;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system = {
    stateVersion = "23.05";
    copySystemConfiguration = true;
  };
}

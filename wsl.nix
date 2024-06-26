{ config, pkgs, ... }:

let
in
{
  imports = [
    ./hosts/wsl/configuration.nix
    ./modules/_top-level/default-headless.nix
  ];

  til7701 = {
    user = "tilman";
    common.enable = true;

    zsh.enable = true;
    cli-tools.enable = true;

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
        jdk8 = {
          package = pkgs.jdk8;
          priority = 10;
        };
      };
    };
  };

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system = {
    stateVersion = "23.11";
    copySystemConfiguration = true;
  };
}

{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  #tilpkgs = import <til7701/packages> {};
in {
  imports = [
    ./common.nix
    ./T07LY9i/hardware-configuration.nix
    ./T07LY9i/configuration.nix
    ./til7701-modules
    <til7701/modules>
  ];

  til7701 = {
    user = "tilman";

    common.enable = true;
    gnome.enable = true;
    zsh.enable = true;
    java = {
      enable = true;
      jdks = {
        jdk21 = {
          default = true;
          package = pkgs.jdk21;
          priority = 1;
        };
        jdk17 = {
          package = pkgs.jdk17;
          priority = 2;
        };
        latest-lts = {
          package = pkgs.jdk21;
          priority = 3;
        };
        jdk-stable = {
          package = pkgs.jdk;
          priority = 4;
        };
        jdk-unstable = {
          package = unstable.jdk;
          priority = 5;
        };
        test = {
          package = pkgs.jdk11;
          priority = 6;
        };
      };
    };
    firefox.enable = true;
    python.enable = true;
    latex.enable = true;
    rust.enable = true;
    fx-demo.enable = true;
  };

  #environment.systemPackages = [
  #  tilpkgs.fx-demo
  #];

  nix.extraOptions = ''
    tarball-ttl = 0
  '';

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

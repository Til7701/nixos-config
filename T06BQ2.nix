{ config, pkgs, ... }:

let
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
  tilpkgs = import <til7701> { };
  #schlunzpkgs = import <schlunzis> { };
in
{
  imports = [
    ./hosts/T06BQ2/hardware-configuration.nix
    ./hosts/T06BQ2/configuration.nix
    ./til7701-modules/_top-level
  ];

  til7701 = {
    user = "tilman";
    common.enable = true;
    common-desktop.enable = true;
    local.enable = true;

    zsh.enable = true;
    cli-tools.enable = true;

    gnome.enable = true;
    shortcuts.enable = true;
    desktop-core.enable = true;
    firefox.enable = true;
    matlab-overlay.enable = true;
    gaming.enable = true;

    printing.enable = true;
    sound.enable = true;

    develop.enable = true;
    android.enable = true;
    java = {
      enable = true;
      jdks = {
        jdk22 = {
          package = unstable.jdk22;
          priority = 5;
        };
        jdk21 = {
          package = pkgs.jdk21;
          priority = 1;
        };
        jdk17 = {
          package = pkgs.jdk17;
          priority = 2;
        };
        jdk-stable = {
          package = pkgs.jdk;
          priority = 3;
        };
        jdk-unstable = {
          package = unstable.jdk;
          priority = 4;
        };
        jdk8 = {
          package = pkgs.jdk8;
          priority = 10;
        };
      };
    };
    javafx-libs.enable = true;
    python.enable = true;
    rust.enable = false;

    latex.enable = true;
  };

  environment.systemPackages = [
    #tilpkgs.fx-demo
    tilpkgs.noel
    #schlunzpkgs.kurtama-client
  ];

  nix.extraOptions = ''
    tarball-ttl = 0
  '';
  virtualisation.docker.enable = true;

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

{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.gaming;
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  options.til7701.gaming = {
    enable = lib.mkEnableOption "gaming";
  };

  config = lib.mkIf cfg.enable {
    programs.steam = {
      enable = true;
      remotePlay.openFirewall = false; # Open ports in the firewall for Steam Remote Play
      dedicatedServer.openFirewall = false; # Open ports in the firewall for Source Dedicated Server
    };
  };
}

{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.shortcuts;

  shortPackage = pkgs.callPackage ./package.nix { };
in
{

  options.til7701.shortcuts = {
    enable = lib.mkEnableOption "shortcuts";
  };

  config = lib.mkIf cfg.enable
    {
      environment.systemPackages = [
        shortPackage
      ];
    };

}

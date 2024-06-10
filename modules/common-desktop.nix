{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.common-desktop;
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  options.til7701.common-desktop = {
    enable = lib.mkEnableOption "common-desktop";
  };

  config = lib.mkIf cfg.enable {
    # Enable networking
    networking.networkmanager.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {
      ${config.til7701.user} = {
        isNormalUser = true;
        description = "Tilman";
        extraGroups = [ "networkmanager" "wheel" "adbusers" ];
      };
    };
  };

}

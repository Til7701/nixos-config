{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.desktop-core;
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  options.til7701.desktop-core = {
    enable = lib.mkEnableOption "desktop-core";
  };

  config = lib.mkIf cfg.enable {
    users.users = {
      ${config.til7701.user} = {
        packages = with pkgs; [
          thunderbird
          keepassxc
          nextcloud-client
          owncloud-client
          #unstable.obsidian
          obsidian
          spotify
          discord
          libreoffice
          xournalpp
          gimp
          inkscape
          chromium
          stellarium
          signal-desktop
          pdfarranger
        ];
      };
    };
  };

}

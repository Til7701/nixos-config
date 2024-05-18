{ lib, config, pkgs, ... }:

let
  tilpkgs = import <til7701> { };
  cfg = config.til7701.cli-tools;
in
{

  options.til7701.cli-tools = {
    enable = lib.mkEnableOption "cli-tools";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      gh
      act
      wget
      htop
      btop
      bat
      jq
      tldr
      tilpkgs.hyfetch
      pinentry
    ];

    programs.gnupg.agent.enable = true;
  };

}

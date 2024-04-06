{ lib, config, pkgs, ... }:

let
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
      neofetch
    ];
  };

}

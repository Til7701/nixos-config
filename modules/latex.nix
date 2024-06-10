{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.latex;
in {

  options.til7701.latex = {
    enable = lib.mkEnableOption "latex";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.texliveFull
    ];
  };
}

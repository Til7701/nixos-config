{ lib, config, pkgs, ... }:

let
  cfg = config.tilman.latex;
in {

  options.tilman.latex = {
    enable = lib.mkEnableOption "latex";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.texliveFull
    ];
  };
}

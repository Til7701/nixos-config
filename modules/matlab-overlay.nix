{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.matlab-overlay;
in
{

  options.til7701.matlab-overlay = {
    enable = lib.mkEnableOption "matlab-overlay";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.overlays =
      let
        nix-matlab = import (builtins.fetchTarball "https://gitlab.com/doronbehar/nix-matlab/-/archive/master/nix-matlab-master.tar.gz");
      in
      [
        nix-matlab.overlay
        (
          final: prev: {
            # Your own overlays...
          }
        )
      ];
  };

}

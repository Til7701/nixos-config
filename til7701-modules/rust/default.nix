{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.rust;
in {
  options.til7701.rust = {
    enable = lib.mkEnableOption "rust";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [
      pkgs.jetbrains.rust-rover
      pkgs.rustc
      pkgs.cargo
    ];
  };
}

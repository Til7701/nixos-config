{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.opengl;
in
{

  options.til7701.opengl = {
    enable = lib.mkEnableOption "opengl";
  };

  config = lib.mkIf cfg.enable {
    hardware.opengl = {
      enable = true;
      driSupport = true;
    };
  };

}

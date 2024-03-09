{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.android;
in {

  options.til7701.android = {
    enable = lib.mkEnableOption "android";
  };

  config = lib.mkIf cfg.enable {
    programs.adb.enable = true;

    environment.systemPackages = [
      pkgs.android-studio
    ];
  };
}

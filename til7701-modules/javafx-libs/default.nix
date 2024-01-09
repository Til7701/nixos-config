{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.javafx-libs;
in {

  options.til7701.javafx-libs = {
    enable = lib.mkEnableOption "javafx-libs";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = with pkgs; [
      xorg.libX11
      xorg.libXtst
      xorg.libXxf86vm
      libGL
      mesa
      alsa-lib
    ];

    environment.variables = {
      LD_LIBRARY_PATH = "${pkgs.xorg.libX11}/lib:${pkgs.xorg.libXtst}/lib:${pkgs.xorg.libXxf86vm}/lib:${pkgs.libGL}/lib:${pkgs.mesa}/lib:${pkgs.alsa-lib}/lib:$LD_LIBRARY_PATH";
    };
  };
}

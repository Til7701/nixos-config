{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.javafx-libs;

  lib-pkgs = with pkgs; [
    glib
    xorg.libX11
    xorg.libXtst
    xorg.libXxf86vm
    libGL
    mesa
    alsa-lib
    gtk2.out
    cairo
    atk
    pango
  ];
  paths = (lib.foldr (a: b: a + b) "$LD_LIBRARY_PATH") (lib.lists.map (a: a + "/lib:") lib-pkgs);
in
{

  options.til7701.javafx-libs = {
    enable = lib.mkEnableOption "javafx-libs";
  };

  config = lib.mkIf cfg.enable {
    environment.systemPackages = lib-pkgs;

    environment.variables.LD_LIBRARY_PATH = paths;
  };
}

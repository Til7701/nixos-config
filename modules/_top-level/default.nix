{ config, pkgs, ... }:

{

  imports = [
    ../firefox
    ../gnome
    ../java
    ../shortcuts
    ../zsh
    ../android.nix
    ../cli-tools.nix
    ../common-desktop.nix
    ../common.nix
    ../desktop-core.nix
    ../develop.nix
    ../gaming.nix
    ../javafx-libs.nix
    ../latex.nix
    ../local.nix
    ../matlab-overlay.nix
    ../opengl.nix
    ../printing.nix
    ../python.nix
    ../rust.nix
    ../sound.nix
    ../username.nix
  ];

}

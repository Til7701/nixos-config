{ config, pkgs, ... }:

{

  imports = [
    ../firefox
    ../gnome
    ../shortcuts
    ../zsh
    ../android.nix
    ../cli-tools.nix
    ../common-desktop.nix
    ../common.nix
    ../desktop-core.nix
    ../develop.nix
    ../gaming.nix
    ../java.nix
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

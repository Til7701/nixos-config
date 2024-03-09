{ config, pkgs, ... }:

{
  imports = [
    ./firefox
    ./gnome
    ./shortcuts
    ./zsh
    ./android.nix
    ./java.nix
    ./javafx-libs.nix
    ./latex.nix
    ./python.nix
    ./rust.nix
    ./username.nix
  ];
}

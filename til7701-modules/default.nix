{ config, pkgs, ... }:

{
  imports =[
    ./android
    ./username
    ./java
    ./javafx-libs
    ./zsh
    ./gnome
    ./firefox
    ./python
    ./latex
    ./rust
    ./shortcuts
  ];
}

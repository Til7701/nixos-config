{ config, pkgs, ... }:

{
  imports =[
    ./username
    ./java
    ./javafx-libs
    ./zsh
    ./gnome
    ./firefox
    ./python
    ./latex
    ./rust
  ];
}

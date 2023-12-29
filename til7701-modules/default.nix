{ config, pkgs, ... }:

{
  imports =[
    ./username
    ./java
    ./zsh
    ./gnome
    ./firefox
    ./python
    ./latex
    ./rust
    ./fx-demo
  ];
}

{ config, pkgs, ... }:

{

  imports = [
    ./default-core.nix
    ../common.nix
    ../java.nix
  ];

}

{ config, pkgs, ... }:

{

  imports = [
    ./default-core.nix
    ../common.nix
    ../java.nix
    ../cli-tools.nix
  ];

}

{ config, pkgs, ... }:

{

  imports = [
    ../java
    ./default-core.nix
    ../common.nix
    ../cli-tools.nix
  ];

}

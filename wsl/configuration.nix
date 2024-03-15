{ config, lib, pkgs, ... }:

{
  imports = [
    <nixos-wsl/modules>
    ./til7701-modules
  ];

  wsl = {
    enable = true;
    defaultUser = "${config.til7701.user}";
    wslConf.network.hostname = "wsl";
  };

}

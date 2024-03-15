{ config, lib, pkgs, ... }:

{
  imports = [
    <nixos-wsl/modules>
  ];

  wsl = {
    enable = true;
    defaultUser = "${config.til7701.user}";
    wslConf.network.hostname = "wsl";
  };

}

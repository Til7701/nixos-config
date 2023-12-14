{ lib, config, pkgs, ... }:

{
  options.tilman = {
    user = lib.mkOption {
      type = lib.types.str;
    };
  };
}

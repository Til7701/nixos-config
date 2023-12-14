{ lib, config, pkgs, ... }:

{
  options.til7701 = {
    user = lib.mkOption {
      type = lib.types.str;
    };
  };
}

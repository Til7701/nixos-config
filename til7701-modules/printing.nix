{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.printing;
in
{

  options.til7701.printing = {
    enable = lib.mkEnableOption "printing";
  };

  config = lib.mkIf cfg.enable {
    # Enable CUPS to print documents.
    services.printing.enable = true;
  };

}

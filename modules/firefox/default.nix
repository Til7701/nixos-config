{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.firefox;
in {

  options.til7701.firefox = {
    enable = lib.mkEnableOption "firefox";
  };

  config = lib.mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      package = pkgs.firefox;
      #languagePacks = [
      #  "en-GB"
      #  "de"
      #];
      # https://mozilla.github.io/policy-templates/
      #policies = builtins.fromJSON (builtins.readFile "/home/${config.til7701.user}/nixos-config/modules/firefox/policies.json");
    };
  };
}

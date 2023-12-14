{ lib, config, pkgs, ... }:

let
  cfg = config.tilman.firefox;
in {

  options.tilman.firefox = {
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
      #policies = builtins.fromJSON (builtins.readFile "/home/${config.tilman.user}/nixos-config/modules/firefox/policies.json");
    };
  };
}

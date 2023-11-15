{ lib, config, pkgs, ... }:

let
  cfg = config.tilman.zsh;
in {

  options.tilman.zsh = {
    enable = lib.mkEnableOption "zsh";

    user = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = lib.mkIf cfg.enable {
    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        t-rebuild = "/home/${cfg.user}/nixos-config/scripts/rebuild.sh";
        t-full-rebuild = "/home/${cfg.user}/nixos-config/scripts/full-rebuild.sh";
        t-update = "/home/${cfg.user}/nixos-config/scripts/update.sh";
        t-collect-garbage = "/home/${cfg.user}/nixos-config/scripts/collect-garbage.sh";
        t-gnome-settings = "/home/${cfg.user}/nixos-config/scripts/gnome-settings.sh";
        t-arbi = "ssh holube@duemmer.informatik.uni-oldenburg.de";
      };
      ohMyZsh = {
        enable = true;
        custom = "/home/${cfg.user}/nixos-config/modules/zsh/custom";
        plugins = [ "git" ];
        theme = "tilman";
      };
    };
  };
}

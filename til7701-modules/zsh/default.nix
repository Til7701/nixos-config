{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.zsh;

  scriptsDir = ../../scripts;
  customDir = ./custom;
in
{

  options.til7701.zsh = {
    enable = lib.mkEnableOption "zsh";
  };

  config = lib.mkIf cfg.enable {
    users.defaultUserShell = pkgs.zsh;

    programs.zsh = {
      enable = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      shellAliases = {
        t-rebuild = "${scriptsDir}/rebuild.sh";
        t-full-rebuild = "${scriptsDir}/full-rebuild.sh";
        t-update = "${scriptsDir}/update.sh";
        t-collect-garbage = "${scriptsDir}/collect-garbage.sh";
        t-gnome-settings = "${scriptsDir}/gnome-settings.sh";
        t-git-backup = "${scriptsDir}/git-backup.sh";
        t-background = "${scriptsDir}/background.sh";
        t-arbi = "ssh holube@duemmer.informatik.uni-oldenburg.de";
      };
      ohMyZsh = {
        enable = true;
        custom = "${customDir}";
        plugins = [ "git" ];
        theme = "tilman-verbose";
      };
    };
  };
}

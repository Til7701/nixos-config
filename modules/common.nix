{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.common;
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  imports = [
    <home-manager/nixos>
  ];

  options.til7701.common = {
    enable = lib.mkEnableOption "common";
  };

  config = lib.mkIf cfg.enable {
    nixpkgs.config = {
      allowUnfree = true;
      permittedInsecurePackages = [
        #"electron-25.9.0" # https://github.com/NixOS/nixpkgs/issues/273611
      ];
    };
    nix.settings.auto-optimise-store = true;

    home-manager.users.${config.til7701.user} = { pkgs, ... }: {
      home.stateVersion = config.system.stateVersion;
      programs.git = {
        enable = true;
        userName = "Tilman Holube";
        userEmail = "tilman@holube.de";
      };
    };

    environment.systemPackages = with pkgs; [
      git
      ((vim_configurable.override { }).customize {
        name = "vim";
        vimrcConfig.packages.myplugins = with pkgs.vimPlugins; {
          start = [ nerdtree nerdtree-git-plugin vim-nerdtree-syntax-highlight vim-autoformat vim-nix ];
          opt = [ ];
        };
        vimrcConfig.customRC = ''
          " Start NERDTree. If a file is specified, move the cursor to its window.
          autocmd StdinReadPre * let s:std_in=1
          autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif

          syntax on
        '';
      })
    ];

    programs.git.enable = true;
    programs.git.lfs.enable = true;

  };

}

{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.develop;
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  options.til7701.develop = {
    enable = lib.mkEnableOption "develop";
  };

  config = lib.mkIf cfg.enable {
    users.users = {
      ${config.til7701.user} = {
        packages = with pkgs; [
          (unstable.jetbrains.plugins.addPlugins unstable.jetbrains.idea-ultimate [ "github-copilot" ])
          jetbrains.idea-community
          jetbrains.phpstorm
          jetbrains.pycharm-community
          (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
              jnoortheen.nix-ide
              rust-lang.rust-analyzer
              serayuzgur.crates
              ms-python.python
              ms-toolsai.jupyter
            ];
          })
          nixpkgs-fmt
        ];
      };
    };

    environment.systemPackages = with pkgs; [
      nodejs
      dpkg # for opening .deb packages, not for installing them
      apt # for testing PPAs and such things, not for installing anything
      fakeroot # jpackage likes this
    ];

    environment.etc."_til7701/js/node".source = "${pkgs.nodejs}/";
  };

}

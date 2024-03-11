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
    # Enable networking
    networking.networkmanager.enable = true;

    # Set your time zone.
    time.timeZone = "Europe/Berlin";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_GB.UTF-8";

    i18n.extraLocaleSettings = {
      LC_ADDRESS = "de_DE.UTF-8";
      LC_IDENTIFICATION = "de_DE.UTF-8";
      LC_MEASUREMENT = "de_DE.UTF-8";
      LC_MONETARY = "de_DE.UTF-8";
      LC_NAME = "de_DE.UTF-8";
      LC_NUMERIC = "de_DE.UTF-8";
      LC_PAPER = "de_DE.UTF-8";
      LC_TELEPHONE = "de_DE.UTF-8";
      LC_TIME = "de_DE.UTF-8";
    };

    # Configure console keymap
    console.keyMap = "de";

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Enable sound with pipewire.
    sound.enable = true;
    hardware.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      # If you want to use JACK applications, uncomment this
      #jack.enable = true;

      # use the example session manager (no others are packaged yet so this is enabled by default,
      # no need to redefine it in your config for now)
      #media-session.enable = true;
    };

    # Enable touchpad support (enabled default in most desktopManager).
    # services.xserver.libinput.enable = true;

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users = {
      ${config.til7701.user} = {
        isNormalUser = true;
        description = "Tilman";
        extraGroups = [ "networkmanager" "wheel" "adbusers" ];
        packages = with pkgs; [
          thunderbird
          keepassxc
          nextcloud-client
          owncloud-client
          (unstable.jetbrains.plugins.addPlugins unstable.jetbrains.idea-ultimate [ "github-copilot" ])
          jetbrains.idea-community
          jetbrains.phpstorm
          jetbrains.pycharm-community
          unstable.obsidian
          spotify
          discord
          xournalpp
          libreoffice
          gimp
          (vscode-with-extensions.override {
            vscodeExtensions = with vscode-extensions; [
              jnoortheen.nix-ide
              rust-lang.rust-analyzer
              serayuzgur.crates
            ];
          })
          nixpkgs-fmt
          inkscape
          chromium
          stellarium
          signal-desktop
        ];
      };
    };

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

    # List packages installed in system profile. To search, run:
    # $ nix search wget

    environment.systemPackages = with pkgs; [
      git
      pdfarranger
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      htop
      btop
      bat
      tldr
      nodejs
      dpkg # for opening .deb packages, not for installing them
      neofetch
    ];

    hardware.opengl = {
      enable = true;
      driSupport = true;
    };

    nixpkgs.overlays =
      let
        nix-matlab = import (builtins.fetchTarball "https://gitlab.com/doronbehar/nix-matlab/-/archive/master/nix-matlab-master.tar.gz");
      in
      [
        nix-matlab.overlay
        (
          final: prev: {
            # Your own overlays...
          }
        )
      ];
  };
}

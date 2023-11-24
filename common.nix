{ lib, config, pkgs, ... }:

let
  cfg = config.tilman.common;
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {

  imports = [
    <home-manager/nixos>
  ];

  options.tilman.common = {
    enable = lib.mkEnableOption "common";

    user = lib.mkOption {
      type = lib.types.str;
    };
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
      ${cfg.user} = {
        isNormalUser = true;
        description = "Tilman";
        extraGroups = [ "networkmanager" "wheel" ];
        packages = with pkgs; [
          thunderbird
          keepassxc
          nextcloud-client
          owncloud-client
          unstable.jetbrains.idea-ultimate
          jetbrains.idea-community
          jetbrains.phpstorm
          jetbrains.pycharm-community
          unstable.obsidian
          spotify
          unstable.discord
          xournalpp
          libreoffice
          gimp
          vscode
          inkscape
          chromium
          stellarium
          signal-desktop
        ];
      };
    };

    home-manager.users.${cfg.user} = { pkgs, ... }: {
      home.stateVersion = "23.05";
      programs.git = {
        enable = true;
        userName = "Tilman Holube";
        userEmail = "tilman@holube.de";
      };
    };

    nixpkgs.config.allowUnfree = true;
    nix.settings.auto-optimise-store = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    
    environment.systemPackages = with pkgs; [
      git
      ## for using javafx
      xorg.libX11
      xorg.libXtst
      xorg.libXxf86vm

      # utils
      vim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
      wget
      htop
      nodejs
    ];

    environment.variables = {
      LD_LIBRARY_PATH = "${pkgs.xorg.libX11}/lib:${pkgs.xorg.libXtst}/lib:${pkgs.xorg.libXxf86vm}/lib:$LD_LIBRARY_PATH";
    };
    
    virtualisation.docker.enable = true;

    nixpkgs.overlays = let
      nix-matlab = import (builtins.fetchTarball "https://gitlab.com/doronbehar/nix-matlab/-/archive/master/nix-matlab-master.tar.gz");
    in [
      nix-matlab.overlay
      (
        final: prev: {
          # Your own overlays...
        }
      )
    ];
  };
}

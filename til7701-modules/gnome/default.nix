{ lib, config, pkgs, ... }:

let
  cfg = config.til7701.gnome;
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in
{

  options.til7701.gnome = {
    enable = lib.mkEnableOption "gnome";
  };

  config = lib.mkIf cfg.enable {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;

    # Configure keymap in X11
    services.xserver = {
      layout = "de";
      xkb.variant = "";
    };

    home-manager.users.${config.til7701.user} = { pkgs, ... }: {
      imports = [ ./dconf/desktop.nix ./dconf/shell.nix ./dconf/mutter.nix ./dconf/media-keys.nix ./dconf/terminal.nix ];
    };

    services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];

    environment.gnome.excludePackages = with pkgs.gnome; [
      epiphany # web browser
      geary # email client
    ];

    environment.systemPackages = with pkgs; [
      dconf2nix # https://github.com/nix-community/dconf2nix

      gnome.gnome-tweaks
      gnome.ghex
      gnome.atomix
      gnome.dconf-editor
      gnome-latex
      gnome-podcasts
      gnome-obfuscate
      gnome-decoder
      metadata-cleaner
      webfontkitgenerator
      #citations build failed
      elastic
      emblem
      eyedropper
      #gaphor build error
      identity
      plots
      wike
      unstable.switcheroo
      unstable.railway-travel
      unstable.paper-clip
      impression

      # gnomeExtensions.color-picker need a new one
      gnomeExtensions.date-menu-formatter
      gnomeExtensions.just-perfection
      # gnomeExtensions.timezones-extension need a new one
      gnomeExtensions.vitals
      gnomeExtensions.appindicator
      gnomeExtensions.dash-to-dock
      gnomeExtensions.clipboard-indicator
    ];

    programs.dconf.enable = true;

    programs.gnome-terminal.enable = true;
  };
}

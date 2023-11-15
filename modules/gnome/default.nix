{ lib, config, pkgs, ... }:

let
  cfg = config.tilman.gnome;
in {

  options.tilman.gnome = {
    user = lib.mkOption {
      type = lib.types.str;
    };
  };

  config = {
    # Enable the X11 windowing system.
    services.xserver.enable = true;

    # Enable the GNOME Desktop Environment.
    services.xserver.displayManager.gdm.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    
    # Configure keymap in X11
    services.xserver = {
      layout = "de";
      xkbVariant = "";
    };

    home-manager.users.${cfg.user} = { pkgs, ... }: {
      imports = [ ./dconf/desktop.nix ./dconf/shell.nix ./dconf/mutter.nix ./dconf/media-keys.nix ];
    };

    services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
    
    environment.gnome.excludePackages = with pkgs.gnome; [
      epiphany # web browser
      geary    # email client
    ];

    environment.systemPackages = with pkgs; [
      dconf2nix # https://github.com/gvolpe/dconf2nix

      # gnome
      gnome.gnome-tweaks
      # gnome extensions
      # gnomeExtensions.color-picker need a new one
      gnomeExtensions.date-menu-formatter
      gnomeExtensions.just-perfection
      # gnomeExtensions.timezones-extension need a new one
      gnomeExtensions.vitals
      gnomeExtensions.appindicator
      gnomeExtensions.dash-to-dock
    ];

    programs.dconf.enable = true;
  };
}

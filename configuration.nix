# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

let
  user = "tilman";
  unstable = import <nixos-unstable> { config = { allowUnfree = true; }; };
in {

  imports =
    [
      ./hardware-configuration.nix
      ./T07LY9i.nix
      <home-manager/nixos>
    ];

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

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  
  services.udev.packages = with pkgs; [ gnome.gnome-settings-daemon ];
  
  environment.gnome.excludePackages = with pkgs.gnome; [
    epiphany # web browser
    geary    # email client
  ];
  
  programs.dconf.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "de";
    xkbVariant = "";
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
    "${user}" = {
      isNormalUser = true;
      description = "Tilman";
      extraGroups = [ "networkmanager" "wheel" ];
      packages = with pkgs; [
        unstable.firefox
        thunderbird
        keepassxc
        nextcloud-client
        owncloud-client
        jetbrains.idea-ultimate
        jetbrains.phpstorm
        jetbrains.pycharm-community
        unstable.obsidian
        spotify
        unstable.discord
        xournalpp
        libreoffice
        gimp
        unstable.vscode
        inkscape
        chromium
      ];
    };
  };
  users.defaultUserShell = pkgs.zsh;

  home-manager.users.${user} = { pkgs, ... }: {
    home.stateVersion = "23.05";
    imports = [ ./gnome/desktop.nix ./gnome/shell.nix ./gnome/mutter.nix ./gnome/media-keys.nix ];
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
  # custom links to packages in nix/store
  environment.etc."java/javafx".source = "${pkgs.javaPackages.openjfx17}";
  
  environment.variables = {
    LD_LIBRARY_PATH = "${pkgs.xorg.libX11}/lib:${pkgs.xorg.libXtst}/lib:${pkgs.xorg.libXxf86vm}/lib:$LD_LIBRARY_PATH";
  };
  
  programs.java = {
    enable = true;
    package = unstable.jdk21;
  };
  
  virtualisation.docker.enable = true;
  
  programs.zsh = {
    enable = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases = {
      t-rebuild = "/home/${user}/nixos-config/scripts/rebuild.sh";
      t-full-rebuild = "/home/${user}/nixos-config/scripts/full-rebuild.sh";
      t-update = "/home/${user}/nixos-config/scripts/update.sh";
      t-collect-garbage = "/home/${user}/nixos-config/scripts/collect-garbage.sh";
      t-gnome-settings = "/home/${user}/nixos-config/scripts/gnome-settings.sh";
      t-arbi = "ssh holube@duemmer.informatik.uni-oldenburg.de";
    };
    ohMyZsh = {
      enable = true;
      custom = "/home/${user}/nixos-config/zsh";
      plugins = [ "git" ];
      theme = "tilman";
    };
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

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

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system = {
    stateVersion = "23.05";
    copySystemConfiguration = true;
  };

}

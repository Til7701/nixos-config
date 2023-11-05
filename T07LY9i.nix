{ config, pkgs, ... }:

{
  networking.hostName = "T07LY9i";

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.supportedFilesystems = [ "ntfs" ];

  # Speaker Pin
  # https://wiki.archlinux.org/title/Lenovo_Yoga_9i_2022_(14AiPI7)
  # https://nixos.wiki/wiki/ALSA
  boot.extraModprobeConfig = ''
  options snd-sof-intel-hda-common hda_model=alc287-yoga9-bass-spk-pin
  '';

  # DisplayLink
  services.xserver.videoDrivers = [ "displaylink" "modesetting" ]; # https://nixos.wiki/wiki/Displaylink
  # services.xserver.displayManager.sessionCommands = ''
  #   ${lib.getBin pkgs.xorg.xrandr}/bin/xrandr --setprovideroutputsource 2 0
  # '';

  # Suspend-then-hibernate everywhere https://www.worldofbs.com/nixos-framework/
  services.logind = { # https://man7.org/linux/man-pages/man5/logind.conf.5.html
    lidSwitch = "suspend-then-hibernate";
    extraConfig = ''
      HandlePowerKey=suspend-then-hibernate
      IdleAction=suspend-then-hibernate
      IdleActionSec=2m
    '';
  };
  systemd.sleep.extraConfig = "HibernateDelaySec=1h";


}
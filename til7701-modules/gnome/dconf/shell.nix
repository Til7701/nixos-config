# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell" = {
      app-picker-layout = "[{'dd38635b-1f41-417a-9c7c-5b3b4cd8f724': <{'position': <0>}>, 'a4f917ff-62c6-4084-9be0-8300b394c10a': <{'position': <1>}>, 'nixos-manual.desktop': <{'position': <2>}>, 'org.gnome.Settings.desktop': <{'position': <3>}>, 'org.gnome.clocks.desktop': <{'position': <4>}>, 'org.gnome.Weather.desktop': <{'position': <5>}>, 'Utilities': <{'position': <6>}>, 'a5e6e034-ccc3-4182-a50d-24a576a7b844': <{'position': <7>}>, 'org.gnome.Maps.desktop': <{'position': <8>}>, 'org.gnome.Extensions.desktop': <{'position': <9>}>, 'org.gnome.Calculator.desktop': <{'position': <10>}>, 'com.nextcloud.desktopclient.nextcloud.desktop': <{'position': <11>}>, '3c63dcfa-f83a-4e89-be27-cbefdbd011ed': <{'position': <12>}>, 'e628d05b-bfae-4092-9826-5cf72df3f0d8': <{'position': <13>}>, 'xterm.desktop': <{'position': <14>}>, '9c0b7171-8786-4bfa-9b27-650559aece57': <{'position': <15>}>}]";
      disabled-extensions = [ "launch-new-instance@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "color-picker@tuberry" "date-menu-formatter@marcinjakubowski.github.com" "just-perfection-desktop@just-perfection" "drive-menu@gnome-shell-extensions.gcampax.github.com" "Vitals@CoreCoding.com" "dash-to-dock@micxgx.gmail.com" "clipboard-indicator@tudmotu.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" "firefox.desktop" "thunderbird.desktop" "org.keepassxc.KeePassXC.desktop" "discord.desktop" "spotify.desktop" "obsidian.desktop" "com.github.xournalpp.xournalpp.desktop" ];
      last-selected-power-profile = "performance";
      welcome-dialog-last-shown-version = "44.2";
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      background-opacity = 0.8;
      custom-theme-shrink = true;
      dash-max-icon-size = 48;
      disable-overview-on-startup = true;
      dock-position = "RIGHT";
      extend-height = false;
      height-fraction = 1.0;
      icon-size-fixed = true;
      intellihide-mode = "FOCUS_APPLICATION_WINDOWS";
      max-alpha = 0.8;
      preferred-monitor = -2;
      preferred-monitor-by-connector = "eDP-1";
      preview-size-scale = 0.0;
      running-indicator-style = "DOTS";
      transparency-mode = "FIXED";
    };

    "org/gnome/shell/extensions/date-menu-formatter" = {
      pattern = "EEE, y-MM-d  H:mm";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      clock-menu-position-offset = 0;
      controls-manager-spacing-size = 2;
      dash-icon-size = 40;
      panel-button-padding-size = 6;
      panel-icon-size = 0;
      panel-indicator-padding-size = 1;
      panel-size = 0;
      startup-status = 0;
      theme = false;
      weather = false;
      panel-in-overview = true;
      panel = true;
    };

    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = [ "__temperature_max__" ];
    };

  };
}

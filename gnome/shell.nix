# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell" = {
      app-picker-layout = "[{'org.gnome.Extensions.desktop': <{'position': <0>}>, 'org.gnome.Weather.desktop': <{'position': <1>}>, 'org.gnome.clocks.desktop': <{'position': <2>}>, 'org.gnome.Maps.desktop': <{'position': <3>}>, 'e628d05b-bfae-4092-9826-5cf72df3f0d8': <{'position': <4>}>, 'org.gnome.Calculator.desktop': <{'position': <5>}>, '3c63dcfa-f83a-4e89-be27-cbefdbd011ed': <{'position': <6>}>, 'org.gnome.Settings.desktop': <{'position': <7>}>, 'com.nextcloud.desktopclient.nextcloud.desktop': <{'position': <8>}>, 'nixos-manual.desktop': <{'position': <9>}>, 'Utilities': <{'position': <10>}>, 'a4f917ff-62c6-4084-9be0-8300b394c10a': <{'position': <11>}>, '9c0b7171-8786-4bfa-9b27-650559aece57': <{'position': <12>}>, 'xterm.desktop': <{'position': <13>}>, 'a5e6e034-ccc3-4182-a50d-24a576a7b844': <{'position': <14>}>}]";
      disabled-extensions = [ "launch-new-instance@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "color-picker@tuberry" "date-menu-formatter@marcinjakubowski.github.com" "just-perfection-desktop@just-perfection" "drive-menu@gnome-shell-extensions.gcampax.github.com" "Vitals@CoreCoding.com" ];
      favorite-apps = [ "firefox.desktop" "thunderbird.desktop" "discord.desktop" "spotify.desktop" "org.gnome.Nautilus.desktop" "org.gnome.Console.desktop" "org.keepassxc.KeePassXC.desktop" "obsidian.desktop" ];
      welcome-dialog-last-shown-version = "44.2";
    };

    "org/gnome/shell/extensions/date-menu-formatter" = {
      pattern = "EEE, y-MM-d  H:mm";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      clock-menu-position-offset = 0;
      dash-icon-size = 40;
      panel-button-padding-size = 6;
      panel-indicator-padding-size = 1;
      startup-status = 0;
    };

    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = [ "__temperature_max__" ];
    };

    "org/gnome/shell/weather" = {
      automatic-location = true;
      locations = "[<(uint32 2, <('Bremen', 'EDDW', false, [(0.92589716818299184, 0.15358897417550102)], @a(dd) [])>)>]";
    };

    "org/gnome/shell/world-clocks" = {
      locations = "[<(uint32 2, <('Coordinated Universal Time (UTC)', '@UTC', false, @a(dd) [], @a(dd) [])>)>]";
    };

  };
}

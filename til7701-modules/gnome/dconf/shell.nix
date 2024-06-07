# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/shell" = {
      app-picker-layout = "[{'9c0b7171-8786-4bfa-9b27-650559aece57': <{'position': <0>}>, 'android-studio.desktop': <{'position': <1>}>, 'org.gnome.Weather.desktop': <{'position': <2>}>, 'org.gnome.clocks.desktop': <{'position': <3>}>, 'org.gnome.Maps.desktop': <{'position': <4>}>, 'btop.desktop': <{'position': <5>}>, 'org.gnome.Builder.desktop': <{'position': <6>}>, 'org.gnome.Calculator.desktop': <{'position': <7>}>, 'calibre-gui.desktop': <{'position': <8>}>, 'org.gnome.Snapshot.desktop': <{'position': <9>}>, 'org.gnome.Settings.desktop': <{'position': <10>}>, 'chromium-browser.desktop': <{'position': <11>}>, 'ca.desrt.dconf-editor.desktop': <{'position': <12>}>, 'Utilities': <{'position': <13>}>, 'calibre-ebook-edit.desktop': <{'position': <14>}>, 'calibre-ebook-viewer.desktop': <{'position': <15>}>, 'org.gnome.Extensions.desktop': <{'position': <16>}>}, {'org.gnome.gnome-latex.desktop': <{'position': <0>}>, 'gimp.desktop': <{'position': <1>}>, 'htop.desktop': <{'position': <2>}>, 'org.gnome.Loupe.desktop': <{'position': <3>}>, 'io.gitlab.adhami3310.Impression.desktop': <{'position': <4>}>, 'org.inkscape.Inkscape.desktop': <{'position': <5>}>, 'idea-community.desktop': <{'position': <6>}>, 'jupyter-notebook.desktop': <{'position': <7>}>, 'jupyterlab.desktop': <{'position': <8>}>, 'kurtama-client.desktop': <{'position': <9>}>, 'calibre-lrfviewer.desktop': <{'position': <10>}>, 'mw-matlab.desktop': <{'position': <11>}>, 'com.nextcloud.desktopclient.nextcloud.desktop': <{'position': <12>}>, 'nixos-manual.desktop': <{'position': <13>}>, 'NixOSTil7701Channel.desktop': <{'position': <14>}>, 'NoEl.desktop': <{'position': <15>}>, 'obsidian.desktop': <{'position': <16>}>, 'a5e6e034-ccc3-4182-a50d-24a576a7b844': <{'position': <17>}>, 'dd38635b-1f41-417a-9c7c-5b3b4cd8f724': <{'position': <18>}>}, {'owncloud.desktop': <{'position': <0>}>, 'com.github.jeromerobert.pdfarranger.desktop': <{'position': <1>}>, '3c63dcfa-f83a-4e89-be27-cbefdbd011ed': <{'position': <2>}>, 'a4f917ff-62c6-4084-9be0-8300b394c10a': <{'position': <3>}>, 'mw-simulink.desktop': <{'position': <4>}>, 'e628d05b-bfae-4092-9826-5cf72df3f0d8': <{'position': <5>}>, 'spotify.desktop': <{'position': <6>}>, 'org.stellarium.Stellarium.desktop': <{'position': <7>}>, 'code.desktop': <{'position': <8>}>, 'com.github.xournalpp.xournalpp.desktop': <{'position': <9>}>, 'xterm.desktop': <{'position': <10>}>, '64330263-016b-441d-a969-55779d9ab2a9': <{'position': <11>}>}]";
      disable-user-extensions = false;
      disabled-extensions = [ "launch-new-instance@gnome-shell-extensions.gcampax.github.com" "user-theme@gnome-shell-extensions.gcampax.github.com" ];
      enabled-extensions = [ "appindicatorsupport@rgcjonas.gmail.com" "color-picker@tuberry" "date-menu-formatter@marcinjakubowski.github.com" "just-perfection-desktop@just-perfection" "drive-menu@gnome-shell-extensions.gcampax.github.com" "Vitals@CoreCoding.com" "dash-to-dock@micxgx.gmail.com" "system-monitor@gnome-shell-extensions.gcampax.github.com" ];
      favorite-apps = [ "org.gnome.Nautilus.desktop" "org.gnome.Terminal.desktop" "firefox.desktop" "org.keepassxc.KeePassXC.desktop" "thunderbird.desktop" "signal-desktop.desktop" "discord.desktop" "idea-ultimate.desktop" "NixOSConfig.desktop" ];
      last-selected-power-profile = "power-saver";
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
      pattern = "EEE, y-MM-dd  H:mm";
      text-align = "center";
    };

    "org/gnome/shell/extensions/just-perfection" = {
      clock-menu-position-offset = 0;
      controls-manager-spacing-size = 2;
      dash-icon-size = 40;
      panel = true;
      panel-button-padding-size = 6;
      panel-icon-size = 0;
      panel-in-overview = true;
      panel-indicator-padding-size = 1;
      panel-size = 0;
      startup-status = 0;
      theme = false;
      weather = false;
    };

    "org/gnome/shell/extensions/system-monitor" = {
      show-memory = false;
      show-swap = false;
    };

    "org/gnome/shell/extensions/vitals" = {
      hot-sensors = [ "__temperature_max__" ];
    };

    "org/gnome/shell/world-clocks" = {
      locations = [ ];
    };

  };
}

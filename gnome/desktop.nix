# Generated via dconf2nix: https://github.com/gvolpe/dconf2nix
{ lib, ... }:

with lib.hm.gvariant;

{
  dconf.settings = {
    "org/gnome/desktop/app-folders" = {
      folder-children = [ "Utilities" "YaST" "a4f917ff-62c6-4084-9be0-8300b394c10a" "e628d05b-bfae-4092-9826-5cf72df3f0d8" "3c63dcfa-f83a-4e89-be27-cbefdbd011ed" "a5e6e034-ccc3-4182-a50d-24a576a7b844" "9c0b7171-8786-4bfa-9b27-650559aece57" "dd38635b-1f41-417a-9c7c-5b3b4cd8f724" ];
    };

    "org/gnome/desktop/app-folders/folders/3c63dcfa-f83a-4e89-be27-cbefdbd011ed" = {
      apps = [ "cups.desktop" "simple-scan.desktop" ];
      name = "Printer Stuff";
      translate = false;
    };

    "org/gnome/desktop/app-folders/folders/9c0b7171-8786-4bfa-9b27-650559aece57" = {
      apps = [ "org.gnome.Tour.desktop" "yelp.desktop" ];
      name = "Accessories";
    };

    "org/gnome/desktop/app-folders/folders/Utilities" = {
      apps = [ "gnome-abrt.desktop" "gnome-system-log.desktop" "nm-connection-editor.desktop" "org.gnome.baobab.desktop" "org.gnome.Connections.desktop" "org.gnome.DejaDup.desktop" "org.gnome.Dictionary.desktop" "org.gnome.DiskUtility.desktop" "org.gnome.eog.desktop" "org.gnome.Evince.desktop" "org.gnome.FileRoller.desktop" "org.gnome.fonts.desktop" "org.gnome.seahorse.Application.desktop" "org.gnome.tweaks.desktop" "org.gnome.Usage.desktop" "vinagre.desktop" "gnome-system-monitor.desktop" ];
      categories = [ "X-GNOME-Utilities" ];
      name = "X-GNOME-Utilities.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/YaST" = {
      categories = [ "X-SuSE-YaST" ];
      name = "suse-yast.directory";
      translate = true;
    };

    "org/gnome/desktop/app-folders/folders/a4f917ff-62c6-4084-9be0-8300b394c10a" = {
      apps = [ "idea-ultimate.desktop" "phpstorm.desktop" "pycharm-community.desktop" ];
      name = "Programming";
    };

    "org/gnome/desktop/app-folders/folders/a5e6e034-ccc3-4182-a50d-24a576a7b844" = {
      apps = [ "org.gnome.Calendar.desktop" "org.gnome.Contacts.desktop" "org.gnome.TextEditor.desktop" ];
      name = "Office";
    };

    "org/gnome/desktop/app-folders/folders/dd38635b-1f41-417a-9c7c-5b3b4cd8f724" = {
      apps = [ "startcenter.desktop" "writer.desktop" "calc.desktop" "impress.desktop" "math.desktop" "draw.desktop" "base.desktop" ];
      name = "Office";
    };

    "org/gnome/desktop/app-folders/folders/e628d05b-bfae-4092-9826-5cf72df3f0d8" = {
      apps = [ "org.gnome.Cheese.desktop" "org.gnome.Photos.desktop" "org.gnome.Totem.desktop" "org.gnome.Music.desktop" ];
      name = "Sound & Video";
    };

    "org/gnome/desktop/background" = {
      picture-options = "zoom";
      picture-uri = "/home/tilman/.config/background";
      picture-uri-dark = "/home/tilman/.config/background";
    };

    "org/gnome/desktop/input-sources" = {
      sources = [ (mkTuple [ "xkb" "de" ]) ];
      xkb-options = [ "terminate:ctrl_alt_bksp" ];
    };

    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      enable-animations = true;
      enable-hot-corners = false;
      font-antialiasing = "grayscale";
      font-hinting = "slight";
      show-battery-percentage = true;
    };

    "org/gnome/desktop/notifications" = {
      application-children = [ "org-gnome-console" "org-gnome-nautilus" "firefox" "thunderbird" ];
    };

    "org/gnome/desktop/notifications/application/code" = {
      application-id = "code.desktop";
    };

    "org/gnome/desktop/notifications/application/com-nextcloud-desktopclient-nextcloud" = {
      application-id = "com.nextcloud.desktopclient.nextcloud.desktop";
    };

    "org/gnome/desktop/notifications/application/discord" = {
      application-id = "discord.desktop";
    };

    "org/gnome/desktop/notifications/application/firefox" = {
      application-id = "firefox.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-network-panel" = {
      application-id = "gnome-network-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/gnome-power-panel" = {
      application-id = "gnome-power-panel.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-console" = {
      application-id = "org.gnome.Console.desktop";
    };

    "org/gnome/desktop/notifications/application/org-gnome-nautilus" = {
      application-id = "org.gnome.Nautilus.desktop";
    };

    "org/gnome/desktop/notifications/application/org-keepassxc-keepassxc" = {
      application-id = "org.keepassxc.KeePassXC.desktop";
    };

    "org/gnome/desktop/notifications/application/owncloud" = {
      application-id = "owncloud.desktop";
    };

    "org/gnome/desktop/notifications/application/thunderbird" = {
      application-id = "thunderbird.desktop";
    };

    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.124031;
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
      two-finger-scrolling-enabled = true;
    };

    "org/gnome/desktop/search-providers" = {
      disabled = [ "org.gnome.seahorse.Application.desktop" "org.gnome.Photos.desktop" ];
      sort-order = [ "org.gnome.Contacts.desktop" "org.gnome.Documents.desktop" "org.gnome.Nautilus.desktop" ];
    };

    "org/gnome/desktop/session" = {
      idle-delay = mkUint32 0;
    };

    "org/gnome/desktop/wm/preferences" = {
      button-layout = "appmenu:minimize,maximize,close";
    };

  };
}

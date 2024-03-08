let
  pkgs = import <nixpkgs> { };
in
{ stdenv ? pkgs.stdenv
, makeDesktopItem ? pkgs.makeDesktopItem
}:

stdenv.mkDerivation rec {
  pname = "shortcuts";
  version = "0.0.6";

  icons = ./icons;

  unpackPhase = "true";

  installPhase = ''
    mkdir -pv $out/share/applications/
    cp -vr "${localConfigDI}/share/applications" "$out/share/"
    cp -vr "${tilChannelDI}/share/applications" "$out/share/"

    mkdir -v $out/share/pixmaps
    ln -sv "$icons/the_game_icon.png" $out/share/pixmaps
  '';

  localConfigDI = makeDesktopItem {
    name = "NixOSConfig";
    exec = "code /home/tilman/nixos-config";
    icon = "noel";
    desktopName = "NixOS Config";
  };

  tilChannelDI = makeDesktopItem {
    name = "NixOSTil7701Channel";
    exec = "code /home/tilman/IdeaProjects/nix-channel";
    icon = "the_game_icon";
    desktopName = "NixOS Til7701 Channel";
  };

}

let
  pkgs = import <nixpkgs> { };
in
{ stdenv ? pkgs.stdenv
, makeDesktopItem ? pkgs.makeDesktopItem
}:

stdenv.mkDerivation rec {
  pname = "shortcuts";
  version = "0.0.5";

  unpackPhase = "true";

  installPhase = ''
    mkdir -pv $out/share/applications/
      cp -r "${localConfigDI}/share/applications" "$out/share/applications/"
  '';

  localConfigDI = makeDesktopItem {
    name = "NixOS Config";
    exec = "code /home/tilman/nixos-config";
    icon = "noel";
    desktopName = "NixOS Config";
  };

}

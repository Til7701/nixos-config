#!/bin/sh

sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-23.11.tar.gz home-manager
sudo nix-channel --add https://nixos.org/channels/nixos-unstable nixos-unstable
sudo nix-channel --add https://github.com/Til7701/nix-channel/archive/main.tar.gz til7701
nix-channel --add https://github.com/schlunzis/nix-channel/archive/main.tar.gz schlunzis
sudo nix-channel --update

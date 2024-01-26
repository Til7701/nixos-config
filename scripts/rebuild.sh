#!/bin/sh

name=$(hostname)

if [[ $name = "T07LY9i" ]]
then
    # https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script
    read -p "Rebuild system for $name? (y/N)" -n 1 -r
    echo    # move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        sudo nixos-rebuild switch -I nixos-config=/home/tilman/nixos-config/T07LY9i.nix
    fi
else
    echo "Unknown hostname $name"
fi

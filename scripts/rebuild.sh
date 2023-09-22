# https://www.reddit.com/r/NixOS/comments/15vz7vm/view_configurationnix_diff_between_last_build_and/
diff --color=auto --unified=0 --suppress-common-lines /run/current-system/configuration.nix /home/tilman/nixos-config/configuration.nix

# https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script
read -p "Rebuild system? (y/N)" -n 1 -r
echo    # (optional) move to a new line
if [[ $REPLY =~ ^[Yy]$ ]]
then
    sudo nixos-rebuild switch -I nixos-config=/home/tilman/nixos-config/configuration.nix
fi


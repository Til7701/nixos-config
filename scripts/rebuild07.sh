if [[ $(hostname) = "T07LY9i" ]]
then
    git diff

    # https://stackoverflow.com/questions/1885525/how-do-i-prompt-a-user-for-confirmation-in-bash-script
    read -p "Rebuild system? (y/N)" -n 1 -r
    echo    # (optional) move to a new line
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        sudo nixos-rebuild switch -I nixos-config=/home/tilman/nixos-config/T07LY9i.nix
    fi
else
    echo "Wrong hostname"
fi

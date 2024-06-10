#!/bin/sh

directories=(
    "org/gnome/desktop"
    "org/gnome/shell"
    "org/gnome/mutter"
    "org/gnome/settings-daemon/plugins/media-keys"
    "org/gnome/terminal"
)

output_base="/home/tilman/nixos-config/modules/gnome/dconf"

for dir in "${directories[@]}"; do
    filename=$(basename "$dir")
    dconf dump "/$dir/" | dconf2nix --root "$dir/" > "$output_base/$filename.nix"
done

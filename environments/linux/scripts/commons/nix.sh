#!/usr/bin/env bash

echo "Install Standalone Package Manager"
sh <(curl -L https://nixos.org/nix/install) --no-daemon

source ~/.nix-profile/etc/profile.d/nix.sh

# search
nix-env -qPa
# install
nix-env -i vscodium neovim
# remove
#nix-env -i vscodium neovim
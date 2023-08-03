#!/usr/bin/env bash

echo "Install Standalone Package Manager"
# sh <(curl -L https://nixos.org/nix/install) --no-daemon
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

source ~/.nix-profile/etc/profile.d/nix.sh

# search
# nix-env -qPa
# install
nix-env -i starship vscodium neovim lazygit lazydocker fasd-unstable exa bat duf
# remove
#nix-env -i vscodium neovim

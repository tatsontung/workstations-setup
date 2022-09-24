#!/usr/bin/env bash

echo "Install Standalone Package Manager"
sh <(curl -L https://nixos.org/nix/install) --no-daemon

source ~/.nix-profile/etc/profile.d/nix.sh

# search
# nix-env -qPa
# install
nix-env -i starship vscodium neovim lazygit lazydocker fasd-unstable netcat-openbsd
# remove
#nix-env -e exa bat

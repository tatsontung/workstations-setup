#!/usr/bin/env bash

# All these applications are independent, so if one
# fails to install, don't stop.

bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

set +e
echo
echo "Installing applications"

# Utilities
brew install lazygit
brew install lazydocker
brew install ncdu

# Terminals
brew install jenv
brew install fontforge
brew install screenfetch

echo "Install devel sdk"
brew install fasd
brew install w3m
brew install imagemagick
brew install jandedobbeleer/oh-my-posh/oh-my-posh

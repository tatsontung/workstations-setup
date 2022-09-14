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
brew install --cask flycut
brew install --cask shiftit
echo
echo "configure shiftit to select 1/3 screen width, 1/2 screen width and 2/3 screen width:"
echo "`defaults write org.shiftitapp.ShiftIt multipleActionsCycleWindowSizes YES`"
echo
brew install --cask dash
brew install --cask postman

# Terminals
brew install jenv
brew install fontforge
brew install screenfetch
brew install cntlm

echo "Show wireless network on terminal"
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport

echo "Install nerdfont"
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font
brew install --cask font-monofur-nerd-font
brew install --cask font-monofur-nerd-font-mono

echo "Install devel sdk"
brew install corkscrew
brew install ferdi
brew install fasd
brew install w3m
brew install imagemagick
brew install --cask kitty

echo "Install Browsers"
brew install --cask google-chrome
brew install --cask firefox

echo "Installing SDK and Visual Code"
brew install --cask jetbrains-toolbox --force # guard against pre-installed jetbrains-toolbox
brew install --cask visual-studio-code

echo "Install Emacs"
brew tap railwaycat/emacsmacport
brew install --cask emacs-mac
set -e

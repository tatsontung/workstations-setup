# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

# Utilities

brew cask install flycut
brew cask install shiftit
echo
echo "configure shiftit to select 1/3 screen width, 1/2 screen width and 2/3 screen width:"
echo "`defaults write org.shiftitapp.ShiftIt multipleActionsCycleWindowSizes YES`"
echo
brew cask install dash
brew cask install postman

# Terminals
brew install jenv
brew install fontforge
brew install screenfetch
brew install cntlm
echo "Show wireless network on terminal"
sudo ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport
echo "Install nerdfont"
brew tap homebrew/cask-fonts
brew cask install font-hack-nerd-font
brew cask install font-monofur-nerd-font
brew cask install font-monofur-nerd-font-mono
echo "Install devel sdk"
brew install nvm
brew install corkscrew
brew install starship
brew install fasd
brew install w3m
brew install imagemagick
brew cask install iterm2
echo "Install powerlevel9k themes for zsh"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Install zsh and set as default shell"
brew install zsh
sudo dscl . -create /Users/$USER UserShell /usr/local/bin/zsh

# Browsers
brew cask install google-chrome
brew cask install firefox

# Communication
brew cask install slack

# Text Editors
brew cask install macvim
brew cask install jetbrains-toolbox --force # guard against pre-installed jetbrains-toolbox
brew cask install visual-studio-code
set -e

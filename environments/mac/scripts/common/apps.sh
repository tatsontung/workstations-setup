# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo
echo "Installing applications"

# Utilities

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
brew install --cask alacritty
brew install --cask kitty
echo "Install powerlevel9k themes for zsh"
git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
echo "Install zsh and set as default shell"
brew install zsh

# Browsers
brew install --cask google-chrome
brew install --cask firefox

# Install Rust
echo "Install Rust and Cargo"
if [ ! -d ~/.cargo ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Alreay install rust and cargo"
fi

echo "Installing my custom nvim fork and config folder"
brew install neovim
git clone https://github.com/tatsontung/vim $HOME/.config/vim

echo "Installing my custom vim fork and config folder"
rm -rf $HOME/.config/vim
rm -rf $HOME/.vim
rm -f $HOME/.vimrc
git clone https://github.com/tatsontung/vim $HOME/.config/vim

curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $HOME/.config/vim $HOME/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
~/.vim/bin/install
mkdir -p ~/.vim/colors

echo "Install Doom Emacs"
if [ ! -d ~/.emacs.d ]; then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
else
    echo "Doom Emacs Already Installed"
fi

# Text Editors
brew install --cask jetbrains-toolbox --force # guard against pre-installed jetbrains-toolbox
brew install --cask visual-studio-code
set -e

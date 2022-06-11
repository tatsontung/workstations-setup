# All these applications are independent, so if one
# fails to install, don't stop.
set +e

echo "Installing My Custom NeoVim based on AstroNvim"
git clone --depth 1 https://github.com/tatsontung/nvim.git ${XDG_CONFIG_HOME:-$HOME/.config}/nvim

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

# Install Rust
echo "Install Rust and Cargo"
if [ ! -d ~/.cargo ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Alreay install rust and cargo"
fi

echo "Install Doom Emacs"
if [ ! -d ~/.emacs.d ]; then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
else
    echo "Doom Emacs Already Installed"
fi

echo "Zplug plugins management for Zsh"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

set -e
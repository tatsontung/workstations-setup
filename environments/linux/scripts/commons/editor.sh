#!/bin/env bash

echo "Installing Doom NeoVim"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
chmod u+x nvim.appimage
mv ./nvim.appimage $HOME/.local/bin/nvim
rm -rf $HOME/.config/nvim
git clone https://github.com/tatsontung/nvim ${XDG_CONFIG_HOME:-$HOME/.config}/nvim

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
    git clone https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
else
    echo "Doom Emacs Already Installed"
fi

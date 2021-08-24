#!/bin/env bash

echo "Installing my custom nvim fork from lunar nvim"
bash <(curl -s https://raw.githubusercontent.com/tatsontung/nvim/master/utils/installer/install.sh)

echo "Clone vim and config folder"
git clone https://github.com/tatsontung/vim $HOME/.config/vim

curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $HOME/.config/vim $HOME/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
~/.vim/bin/install
mkdir -p ~/.vim/colors
ln -s ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors/gruvbox.vim



#!/bin/env bash

echo "Installing my custom nvim fork from lunar nvim"
rm -rf $HOME/.config/nvim
bash <(curl -s https://raw.githubusercontent.com/tatsontung/nvim/master/utils/installer/install.sh)

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
 git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
 ~/.emacs.d/bin/doom install

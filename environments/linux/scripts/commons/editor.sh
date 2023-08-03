#!/usr/bin/env bash

echo "Setup custom vim installation"
rm -rf $HOME/.config/vim
rm -rf $HOME/.vim
rm -f $HOME/.vimrc
git clone https://github.com/tatsontung/vim .vim
curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
ln -s $HOME/.config/vim $HOME/.vim
ln -s ~/.vim/.vimrc ~/.vimrc
~/.vim/bin/install
mkdir -p ~/.vim/colors
ln -sfn ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors/gruvbox.vim

echo "Setup custom nvim installation"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
mkdir -p $HOME/bin
mv nvim.appimage $HOME/bin/nvim
chmod +x $HOME/bin/nvim
git clone --depth 1 https://github.com/AstroNvim/AstroNvim.git ${XDG_CONFIG_HOME:-$HOME/.config}/nvim
nvim

echo "Install Doom Emacs"
if [ ! -d ~/.emacs.d ]; then
    git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
    ~/.emacs.d/bin/doom install
else
    echo "Doom Emacs Already Installed"
fi

#!/bin/sh
echo "Installation must have software for Archlinux workstation"
paru -Syu git kitty neovim-nightly-bin gvim emacs zsh fish lsof nginx copyq ranger mc stow \
tmux httpie xsel fzf fasd wget curl python python-pip libsecret highlight atool w3m mediainfo \
nfs-utils samba openssh exfatprogs zip unzip curl wget \
zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps

sudo systemctl enable sshd

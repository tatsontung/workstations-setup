#!/bin/sh
echo "Installation must have software for Archlinux workstation"
yay -Syu git kitty neovim gvim zsh fish lsof nginx copyq ranger mc \
tmux httpie tree xsel fzf fasd wget curl python python-pip \
nfs-utils samba openssh exfatprogs ntfs-3g libsecret highlight atool w3m mediainfo \
zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps

sudo systemctl enable sshd

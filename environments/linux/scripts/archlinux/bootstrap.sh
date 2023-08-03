#!/bin/bash
echo "Installation must have software for Archlinux workstation"
sudo pacman -S --needed base-devel git openssh git curl wget zip unzip

paru -Syu kitty neovim vim emacs zsh fish lsof nginx xclip copyq ranger mc stow \
	tmux httpie xsel fzf fasd wget curl python python-pip \
	nfs-utils samba exfatprogs screenfetch \
	zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps

sudo systemctl enable sshd

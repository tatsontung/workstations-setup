#!/bin/bash
echo "Installation must have software for Archlinux workstation"
sudo pacman -S --needed base-devel git openssh git curl wget zip unzip

git clone https://aur.archlinux.org/paru.git
pushd paru || exit
makepkg -si
popd || exit

paru -Syu git kitty neovim-nightly-bin gvim emacs zsh fish lsof nginx copyq ranger mc stow \
	tmux httpie xsel fzf fasd wget curl python python-pip libsecret highlight atool w3m mediainfo \
	nfs-utils samba exfatprogs screenfetch \
	zathura zathura-cb zathura-djvu zathura-pdf-mupdf zathura-ps

sudo systemctl enable sshd

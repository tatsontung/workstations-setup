#!/usr/bin/env bash
echo
echo "Installing Git and associated tools"

# Git configuration
echo
echo "Setting up user"
echo "Configuration Git"
git config --global user.name "Tat Corp"
git config --global user.email tat.dev@tatcorp.com
git config --global core.editor vim

echo
echo "Configuration Git duet"
rm  -rf /tmp/gitduet
mkdir -p /tmp/gitduet
curl -L https://github.com/git-duet/git-duet/releases/download/0.7.0/linux_amd64.tar.gz > /tmp/gitduet/gitduet.tar.gz
tar -xvzf /tmp/gitduet/gitduet.tar.gz --directory /tmp/gitduet
mkdir -p $HOME/.local/bin
sudo mv /tmp/gitduet/git-* $HOME/.local/bin

echo
echo "To set up git duet aliases..."
echo "git config --global alias.dc duet-commit"

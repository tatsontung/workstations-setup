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
echo "Setting up Git aliases..."
git config --global alias.gst git status
git config --global alias.st status
git config --global alias.di diff
git config --global alias.co checkout
git config --global alias.ci commit
git config --global alias.br branch
git config --global alias.sta stash
git config --global alias.llog "log --date=local"
git config --global alias.flog "log --pretty=fuller --decorate"
git config --global alias.lg "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
git config --global alias.lol "log --graph --decorate --oneline"
git config --global alias.lola "log --graph --decorate --oneline --all"
git config --global alias.blog "log origin/master... --left-right"
git config --global alias.ds diff --staged
git config --global alias.fixup commit --fixup
git config --global alias.squash commit --squash
git config --global alias.unstage reset HEAD
git config --global alias.rum "rebase master@{u}"
git config --global push.default simple

echo
echo "Configuration Git duet"
rm  -rf /tmp/gitduet
mkdir -p /tmp/gitduet
curl -L https://github.com/git-duet/git-duet/releases/download/0.7.0/linux_amd64.tar.gz > /tmp/gitduet/gitduet.tar.gz
tar -xvzf /tmp/gitduet/gitduet.tar.gz --directory /tmp/gitduet
sudo mv /tmp/gitduet/git-* $HOME/bin

echo
echo "Setting up Git duet aliases..."
git config --global alias.dc duet-commit
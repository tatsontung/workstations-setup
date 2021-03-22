#!bin/sh

curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish

if [ "$(whoami)" != "root" ]
then
  sudo chsh -s `which fish`
else
  chsh -s `which fish`
fi
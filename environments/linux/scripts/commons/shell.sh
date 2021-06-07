#!/usr/bin/env bash
echo "Install tmux plugin manager"
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "Already have tmux tpm"
fi

echo "Install starship prompt"
curl -fsSL https://starship.rs/install.sh | bash

echo "Install zplug a plugin manager for zsh"
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

touch $HOME/.credrc.sh
chsh -s `which zsh`

echo
echo "-----------------------------------------"
echo "Done!"
echo "-----------------------------------------"
echo
echo "If hostname needs to be set consider"
echo "sudo scutil --set ComputerName newname"
echo "sudo scutil --set LocalHostName newname"
echo "sudo scutil --set HostName newname"
echo
echo "You can use 'git pair' (enabled) 'git duet' (enabled) or 'git with' aka git-together (installed but not enabled)"
echo "To enable git together"
echo "'git=git-together' >> ~/.bash_profile"
echo
echo "After checking the above output for any problems, start a new terminal session to make use of all the installed tools."
echo "Rebooting is only necessary for keyboard repeat settings to work."
echo

exit

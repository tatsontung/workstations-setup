#!/usr/bin/env bash
echo
echo "Configuring bash with bash_it"
if [ ! -d ~/.bash_it ]; then
    git clone --depth=1 https://github.com/Bash-it/bash-it.git ~/.bash_it
else
    echo "Already clone bash_it"
fi

echo "Install oh-my-zsh"
if [ ! -d ~/.oh-my-zsh ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
    # Exit the zsh script and continue
    echo "9k configurations"
    git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
    echo
    echo "Copy zsh configuration"
    mkdir -p ~/.oh-my-zsh/custom/
else
    echo " Already clone and config oh-my-zsh"
fi

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

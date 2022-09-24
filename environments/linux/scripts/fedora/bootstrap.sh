#!/usr/bin/env bash

#!/usr/bin/env bash
# Get root up in here
# sudo su

# Configuration for cntlm proxy parser
# echo 'Acquire::http::Proxy "http://10.0.2.2:3128";' >> /etc/apt/apt.conf.d/99proxy

# Get root up in here
if [ "$(whoami)" != "root" ]
then
    # Update all dependencies and install packages
    sudo dnf update -y
    
    sudo dnf install -y git vim emacs cmake wget curl htop lsof tmux \
    fzf zsh fish ranger mc cmus httpie tree xsel samba-common \
    nginx python python3 python3-pip neofetch duf exa bat \
    atool highlight w3m mediainfo

    sudo systemctl disable nginx

    # SYSCTL
    echo "setting sysctl to 9001!!!"
    # this number is for angular js watch files changes
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
else
    
    # SYSCTL
    echo "setting sysctl to 9001!!!"
    # this number is for angular js watch files changes
    echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p
fi

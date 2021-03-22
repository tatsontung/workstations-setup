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
    sudo apt update -y
    
    sudo apt install -y git build-essential vim vim-gtk3 neovim wget curl htop lsof tilix tmux tty-clock \
    fzf fasd zsh fish taskwarrior copyq ranger mc cmus httpie tree xsel samba-common exfat-utils \
    nginx python python3 python3-pip ruby memcached docker docker-compose python3-pip pkg-config \
    libsecret-1-0 libsecret-1-dev

    echo "Configuration git credentials gnome"
    pushd /usr/share/doc/git/contrib/credential/libsecret
    sudo make
    git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/
    popd

    # SYSCTL
    echo "setting sysctl to 9001!!!"
    # this number is for angular js watch files changes
    echo fs.inotify.max_user_watches=524288 | sudo tee -a /etc/sysctl.conf && sudo sysctl -p
else 
    # Update all dependencies and install packages
    apt update -y
    
    apt install -y git build-essential vim neovim wget curl htop lsof tilix tmux tty-clock \
    fzf fasd zsh taskwarrior copyq ranger mc cmus httpie tree xsel samba-common exfat-utils \
    nginx python python3 python3-pip ruby memcached docker docker-compose python3-pip pkg-config \
    libsecret-1-0 libsecret-1-dev

    echo "Configuration git credentials gnome"
    pushd /usr/share/doc/git/contrib/credential/libsecret
    make
    git config --global credential.helper /usr/share/doc/git/contrib/credential/libsecret/
    popd

    # SYSCTL
    echo "setting sysctl to 9001!!!"
    # this number is for angular js watch files changes
    echo fs.inotify.max_user_watches=524288 | tee -a /etc/sysctl.conf && sysctl -p
fi

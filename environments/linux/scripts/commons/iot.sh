#!/usr/bin/env bash
echo "Configuring server"

set -e

function show_help() {
    cat << EOF
Usage: ${0##*/}
    [-h show help]
    [-d distro ]
                            raspberry/ubuntu/debian
    [-o hostname ]
                            tat-server

Config script for linux-server

    -h                      Cloud Foundry User
    -d                      distro used
    -o                      display this help and exit
EOF
    exit $1
}

if [[ $# -eq 0 ]] ; then
    show_help 0
fi

NEWHOST=tat-server
DISTRO=raspberry
while getopts h:o:d: opt; do
    case $opt in
        h)
            show_help 0
        ;;
        o)
            NEWHOST="$OPTARG"
        ;;
        d)
            DISTRO="$OPTARG"
        ;;
        *)
            show_help 1 >&2
        ;;
    esac
done

sudo apt-get install git lsb-release

sudo sed -i "s/$DISTRO/$NEWHOST/g" /etc/hosts
sudo sed -i "s/$DISTRO/$NEWHOST/g" /etc/hostname

sudo apt install docker docker - compose
sudo usermod - aG docker "$USER"
git clone https: //github.com/gcgarner/IOTstack.git
~/menu.sh
docker - compose up - d

case $DISTRO in
    raspberry)
        git clone https: //github.com/azlux/log2ram.git
        cd log2ram || exit
        sudo ./install.sh
        sudo nano / etc/log2ram.conf
    ;;
    *)
    ;;
esac

git clone --depth=1 https://github.com/RetroPie/RetroPie-Setup.git
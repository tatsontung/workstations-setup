#!/usr/bin/env bash
# Fail immediately if any errors occur
set -e

DIST=$1
ENVR=$2
export MY_DIR="$(dirname "$0")"
function install_script() {
    # Get root up in here
    source ${MY_DIR}/scripts/${DIST}/bootstrap.sh
    source ${MY_DIR}/config/${ENVR}/homeconfig.sh
    source ${MY_DIR}/scripts/commons/config.sh
    source ${MY_DIR}/scripts/commons/git.sh
    source ${MY_DIR}/scripts/commons/apps.sh
    source ${MY_DIR}/scripts/commons/bash.sh
    source ${MY_DIR}/scripts/commons/zsh.sh
    source ${MY_DIR}/scripts/commons/fish.sh
    read -p "Choose your shell interpretor wisely ? (zsh/fish)" shell
    case $shell in
			fish)
				if [ "$(whoami)" != "root" ]

				then
					sudo chsh -s `which fish`
				else
					chsh -s `which fish`
				fi
				;;
			zsh)
				chsh -s `which zsh`
    esac
    echo "Copy all dotfiles to home folder"
    cp -v ${MY_DIR}/config/.[^.]* ${HOME}
    source ${MY_DIR}/scripts/commons/shell.sh

}

function pre-requis() {
sudo cp ${MY_DIR}/config/${ENVR}/apt.95proxies /etc/apt/apt.conf.d/95proxies
source ${MY_DIR}/config/${ENVR}/cntlm.sh
}

# echo "Caching password..."
# sudo -K
# sudo true;
# clear

echo "Setting up a '$DIST' machine... with '$ENVR'"
case $ENVR in
	internal)
		pre-requis
		install_script
		;;
	*)
		install_script
		;;
esac

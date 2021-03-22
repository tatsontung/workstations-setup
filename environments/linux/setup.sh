#!/usr/bin/env bash
# Fail immediately if any errors occur
set -e

DIST=$1
ENVR=$2
MY_DIR="$(dirname "$0")"
echo "$MY_DIR"
function install_script() {
    echo "Install custom dircolors"
    # Get root up in here
    source ${MY_DIR}/scripts/${DIST}/bootstrap.sh
    cp ${MY_DIR}/config/dircolors.ansi-dark.config ~/.dircolors
    source ${MY_DIR}/config/${ENVR}/homeconfig.sh
    source ${MY_DIR}/scripts/commons/config.sh
    source ${MY_DIR}/scripts/commons/git.sh
    source ${MY_DIR}/scripts/commons/apps.sh
    source ${MY_DIR}/scripts/commons/zsh.sh
    # source ${MY_DIR}/scripts/commons/fish.sh
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
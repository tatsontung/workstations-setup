#!/usr/bin/env bash
echo
echo "Configuring bash with oh my bash"
if [ ! -d ~/.oh-my-bash ]; then
    bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
else
    echo "Already clone oh my bash"
fi

#!/usr/bin/env sh
echo
echo "Configuring bash with oh my bash"
if [ ! -d ~/.oh-my-bash ]; then
    sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
else
    echo "Already clone oh my bash"
fi

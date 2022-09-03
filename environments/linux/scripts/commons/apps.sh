#!/usr/bin/env bash

# Install FzF
echo
echo "Installing fzf configuration"
if [ ! -d ~/.fzf ]; then
  rm -rf ~/.fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
fi

# Install Nodejs and NPM
echo "Installing node"
if [ ! -d ~/.nvm ]; then
  curl -L git.io/nodebrew | perl - setup
  nodebrew install latest
  # nodebrew install stable # stable version
  # nodebrew install stable # stable version
  # nodebrew install v8.9   # v8.9 latest
  # nodebrew install 8.9.4  # without `v`
  echo "Installing angular 2 core"
  export NG_CLI_ANALYTICS=ci
  npm i -g @angular/cli @angular/core webpack-cli webpack-bundle-analyzer
else
  echo "NVM is already installed"
fi

# echo "Configure npmrc"
# cat > ~/.npmrc << EOL
# cache=${HOME}/.npm-cache
# strict-ssl=false
# EOL

# Install lazy docker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash
rm lazydocker

# Install Rust
echo "Install Rust and Cargo"
if [ ! -d ~/.cargo ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Alreay install rust and cargo"
fi

# Install Go brew a Go version manager
curl -sLk https://git.io/gobrew | sh
gobrew ls
gobrew install 1.16
gobrew use 1.16

# Install SDK Man
if [ ! -d ~/.sdkman ]; then
  curl -s "https://get.sdkman.io" | bash
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk list java
else
  echo "Already have sdk man"
fi

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
  export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"

  echo "Installing angular 2 core"
  export NG_CLI_ANALYTICS=ci
  npm i -g @angular/cli @angular/core webpack-cli webpack-bundle-analyzer
  nvm install --lts # "node" is an alias for the latest version
else
  echo "NVM is already installed"
  export NVM_DIR="$HOME/.nvm" && "$NVM_DIR/nvm.sh"
fi

echo "Configure npmrc"
cat > ~/.npmrc << EOL
cache=${HOME}/.npm-cache
strict-ssl=false
EOL

# Install lazy docker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Install Rust
echo "Install Rust and Cargo"
if [ ! -d ~/.cargo ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Alreay install rust and cargo"
fi

# Install Go
if [ ! -d ~/sdk/go ]; then
  curl -O https://dl.google.com/go/go1.15.linux-amd64.tar.gz
  tar xvf go1.15.linux-amd64.tar.gz
  mkdir -p ~/sdk
  mv go ~/sdk/go1.15
  ln -s ~/sdk/go1.15 ~/sdk/go
  rm go1.15.linux-amd64.tar.gz
else
  echo "Already have go install"
fi

# Install SDK Man
if [ ! -d ~/.sdkman ]; then
  curl -s "https://get.sdkman.io" | bash
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk list java
else
  echo "Already have sdk man"
fi

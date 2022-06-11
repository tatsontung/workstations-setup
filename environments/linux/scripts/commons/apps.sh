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
if [ ! -d ~/.nodebrew ]; then
  curl -L git.io/nodebrew | perl - setup
  export PATH=$HOME/.nodebrew/current/bin:$PATH
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

# Install Rust
echo "Install Rust and Cargo"
if [ ! -d ~/.cargo ]; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
else
  echo "Alreay install rust and cargo"
fi

# Install Go brew a Go version manager
if [ ! -d ~/.cargo ]; then
	curl -sLk https://git.io/gobrew | sh
	export PATH="$HOME/.gobrew/bin:$PATH"
	eval "$(gobrew init -)"
	gobrew install 1.16
	gobrew use 1.16
	gobrew ls
else
	echo "Already install go"
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

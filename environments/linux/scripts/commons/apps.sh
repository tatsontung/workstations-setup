#!/usr/bin/env bash

# Tilix
echo "Install tilix color shemes and load themes"
pushd ~/
if [ ! -d ~/.config/tilix/shemes ]; then
    mkdir -p ~/.config/tilix/schemes/
    wget -qO $HOME"/.config/tilix/schemes/homebrew.json" https://git.io/v7Qa4
    git clone https://github.com/MichaelThessel/tilix-gruvbox.git
    pushd tilix-gruvbox
    cp gruvbox-* ~/.config/tilix/schemes/
    popd
    rm -rf tilix-gruvbox
fi
popd

# Install FzF
echo
echo "Installing fzf configuration"
if [ ! -d ~/.fzf ]; then
  rm -rf ~/.fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
fi

echo "Installing node"
export NVM_DIR="$HOME/.nvm" && (
  git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
  cd "$NVM_DIR"
  git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
) && \. "$NVM_DIR/nvm.sh"

nvm install --lts=erbium # "node" is an alias for the latest version

echo "Configure npmrc"
cat > ~/.npmrc << EOL
cache=${HOME}/.npm-cache
strict-ssl=false
EOL

echo "Installing angular 2 core"
export NG_CLI_ANALYTICS=ci
npm i -g @angular/cli @angular/core webpack-cli webpack-bundle-analyzer

# Vim
echo
echo "Installing vim configuration"
if [ ! -d ~/.vim ]; then
  git clone https://github.com/tatsontung/vim ~/.config/vim
  curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ln -s $HOME/.config/vim $HOME/.vim
  ln -s ~/.vim/.vimrc ~/.vimrc
  ~/.vim/bin/install
  mkdir -p ~/.vim/colors
  ln -s ~/.vim/plugged/gruvbox/colors/gruvbox.vim ~/.vim/colors/gruvbox.vim
else
  echo "Already clone vim repo"
fi

# NVim
echo
echo "Installing nvim configuration"
if [ ! -d ~/.config/nvim ]; then
  git clone -b tatsontung https://github.com/tatsontung/nvim ~/.config/nvim
  curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  ~/.config/nvim/utils/install.sh
else
  echo "Already clone nvim repo"
fi

# Install lazy docker
curl https://raw.githubusercontent.com/jesseduffield/lazydocker/master/scripts/install_update_linux.sh | bash

# Install Rust
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

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
curl -s "https://get.sdkman.io" | bash
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk list java

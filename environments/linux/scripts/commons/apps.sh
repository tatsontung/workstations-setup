#!/usr/bin/env bash

# # Postman is an api tools
# echo "Installing lib dependency for postman"
# sudo apt install libgconf-2-4
# sudo rm -f /usr/bin/postman

# echo "Installing postman binary"
# wget https://dl.pstmn.io/download/latest/linux64 -O /tmp/postman.tar.gz
# sudo tar -xzf /tmp/postman.tar.gz -C /opt
# rm /tmp/postman.tar.gz
# sudo ln -s /opt/Postman/Postman /usr/bin/postman

# echo "Customize desktop configuration"
# touch ~/.local/share/applications/postman.desktop
# cat > ~/.local/share/applications/postman.desktop <<EOL
# [Desktop Entry]
# Encoding=UTF-8
# Name=Postman
# Exec=postman
# Icon=/opt/Postman/app/resources/app/assets/icon.png
# Terminal=false
# Type=Application
# Categories=Development;
# EOL

# Tilix
echo "Install tilix color shemes and load themes"
pushd ~/
if [ ! -d ~/.config/tilix/shemes ]; then
    mkdir -p ~/.config/tilix/schemes/
    wget -qO $HOME"/.config/tilix/schemes/homebrew.json" https://git.io/v7Qa4
    git clone https://github.com/tatsontung/tilix-gruvbox.git
    pushd tilix-gruvbox
    cp gruvbox-* ~/.config/tilix/schemes/
    popd
    rm -rf tilix-gruvbox
fi
popd
cat > /tmp/tilix.conf <<EOL
[/]
enable-wide-handle=false
prompt-on-close=true
prompt-on-delete-profile=true
quake-height-percent=90
quake-specific-monitor=0
terminal-title-show-when-single=false
terminal-title-style='small'
theme-variant='system'
warn-vte-config-issue=false
window-style='borderless'

[profiles]
list=['2b7c4080-0ddd-46c5-8f23-563fd3ba789d']

[profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d]
background-color='#1D2021'
background-transparency-percent=0
badge-color-set=false
badge-position='northeast'
badge-text='${username}${hostname}'
bold-color-set=false
cursor-colors-set=false
dim-transparency-percent=0
font='Monofur Nerd Font Bold 12'
foreground-color='#EBDBB2'
highlight-colors-set=false
login-shell=true
palette=['#1D2021', '#CC241D', '#98971A', '#D79921', '#458588', '#B16286', '#689D6A', '#BDAE93', '#7C6F64', '#FB4934', '#B8BB26', '#FABD2F', '#83A598', '#D3869B', '#8EC07C', '#EBDBB2']
use-system-font=false
use-theme-colors=false
visible-name='Default'
EOL

# Gnome Terminalcle
cat > /tmp/gnome-terminal.conf <<EOL
[/]
list=['8ea9f29b-56e8-466a-b1f9-c400ae62d070']

[:8ea9f29b-56e8-466a-b1f9-c400ae62d070]
allow-bold=true
background-color='#282828282828'
background-transparency-percent=13
bold-color='#ebebdbdbb2b2'
bold-color-same-as-fg=true
font='Monofur Nerd Font Mono Bold 12'
foreground-color='#ebebdbdbb2b2'
highlight-background-color='#'
highlight-colors-set=true
highlight-foreground-color='#'
palette=['#282828282828', '#cccc24241d1d', '#989897971a1a', '#d7d799992121', '#454585858888', '#b1b162628686', '#68689d9d6a6a', '#a8a899998484', '#929283837474', '#fbfb49493434', '#b8b8bbbb2626', '#fafabdbd2f2f', '#8383a5a59898', '#d3d386869b9b', '#8e8ec0c07c7c', '#ebebdbdbb2b2']
use-system-font=false
use-theme-background=false
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=true
visible-name='Gruvbox Dark'
EOL

if ! command -v dconf &> /dev/null
then
    echo "COMMAND dconf could not be found think to switch to Gnome"
else
    dconf load /com/gexperts/Tilix/ < /tmp/tilix.conf
    dconf load /org/gnome/terminal/legacy/profiles:/ < /tmp/gnome-terminal.conf
fi


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
npm i -g @angular/cli @angular/core

# Vim
echo
echo "Installing vim configuration"
if [ ! -d ~/.vim ]; then
  git clone https://github.com/tatsontung/vim.git ~/.vim
  curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
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
curl -O https://dl.google.com/go/go1.15.linux-amd64.tar.gz
tar xvf go1.15.linux-amd64.tar.gz
mkdir -p ~/sdk
mv go ~/sdk/go1.15
ln -s ~/sdk/go1.15 ~/sdk/go
rm go1.15.linux-amd64.tar.gz

# Install SDK Man
curl -s "https://get.sdkman.io" | bash
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
sdk list java

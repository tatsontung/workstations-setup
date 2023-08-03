#!/usr/bin/env bash

# Install Nodejs and NPM
echo "Installing NVM"
if [ ! -d ~/.nvm ]; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.4/install.sh | bash
else
  echo "NVM is already installed"
fi
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

echo "Install pnpm"
npm i -g pnpm
export PNPM_HOME="$HOME/.local/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

echo "Installing angular 2 core"
export NG_CLI_ANALYTICS=ci
npm i -g @angular/cli @angular/core webpack-cli webpack-bundle-analyzer

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

# Install FzF
echo
echo "Installing fzf configuration"
if [ ! -d ~/.fzf ]; then
  rm -rf ~/.fzf
  git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
fi

# Install Tmux Plugin Manager
echo "Install tmux plugin manager"
if [ ! -d ~/.tmux/plugins/tpm ]; then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo "Already have tmux tpm"
fi
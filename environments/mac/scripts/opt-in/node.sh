# Install Nodejs and NPM
echo "Installing node"
if [ ! -d ~/.nvm ]; then
  export NVM_DIR="$HOME/.nvm" && (
    git clone https://github.com/nvm-sh/nvm.git "$NVM_DIR"
    cd "$NVM_DIR"
    git checkout `git describe --abbrev=0 --tags --match "v[0-9]*" $(git rev-list --tags --max-count=1)`
  ) && \. "$NVM_DIR/nvm.sh"
  nvm install --lts # "node" is an alias for the latest version

  echo "Installing angular 2 core"
  export NG_CLI_ANALYTICS=ci
  npm i -g @angular/cli @angular/core webpack-cli webpack-bundle-analyzer
else
  echo "NVM is already installed"
fi

echo
echo "Installing global NodeJS Packages"

npm i -g yo
npm i -g webpack
npm i -g grunt-cli
npm i -g gulp-cli
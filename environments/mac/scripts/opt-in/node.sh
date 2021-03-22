echo
echo "Installing most recent version of NodeJS"
brew install node
brew install node@10
brew link --force --overwrite node@10

echo
echo "Installing global NodeJS Packages"

npm install --global @angular/cli @angular/core
npm install --global yo
npm install --global webpack
npm install --global grunt-cli
npm install --global gulp-cli
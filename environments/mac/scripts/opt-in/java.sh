echo
echo "Installing most recent version of Java"
brew tap adoptopenjdk/openjdk
brew install --cask adoptopenjdk8
echo

# Install SDK Man
if [ ! -d ~/.sdkman ]; then
  curl -s "https://get.sdkman.io" | bash
  export SDKMAN_DIR="$HOME/.sdkman"
  [[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
  sdk list java
else
  echo "Already have sdk man"
fi

sdk install gradle
sdk install maven


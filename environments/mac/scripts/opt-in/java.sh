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


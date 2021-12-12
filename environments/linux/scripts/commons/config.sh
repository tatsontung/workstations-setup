#!/usr/bin/env bash

echo "Configuration Cmus"
mkdir -p ~/.config/cmus
cat > ~/.config/cmus/rc << EOL
set output_plugin=alsa
set dsp.alsa.device=default
set mixer.alsa.device=default
set mixer.alsa.channel=Master
EOL

echo "Installing Mono nerd fonts"
if [ ! -d ~/.local/share/fonts ]; then
  mkdir -p ~/.local/share/fonts
fi
pushd ~/.local/share/fonts
if [ ! -d Monofur ]; then
  rm ~/.local/share/fonts/*.zip
  curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip -O -J -L
  curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -O -J -L
  unzip Monofur.zip -d Monofur
  unzip Hack.zip -d Hack
  fc-cache -fv ~/.local/share/fonts
  rm ~/.local/share/fonts/*.zip
fi
popd


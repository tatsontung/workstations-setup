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
if [ ! -d ~/.fonts ]; then
  mkdir -p ~/.fonts
fi
pushd ~/.fonts
if [ ! -d Monofur ]; then
  curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip -O -J -L
  curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -O -J -L
  unzip Monofur.zip -d Monofur
  unzip Hack.zip -d Hack
  fc-cache -fv ~/.fonts
  rm ~/.fonts/Monofur.zip
  rm ~/.fonts/Hack.zip
fi
popd

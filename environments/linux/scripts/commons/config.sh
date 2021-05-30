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
  curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Monofur.zip -O -J -L
  curl https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip -O -J -L
  unzip Monofur.zip -d Monofur
  unzip Hack.zip -d Hack
  fc-cache -fv ~/.local/share/fonts
  rm ~/.local/share/fonts/Monofur.zip
  rm ~/.local/share/fonts/Hack.zip
fi
popd

# GruvBox
#cat > /tmp/tilix.terminal.conf <<EOL
#[/]
#enable-wide-handle=false
#prompt-on-close=true
#prompt-on-delete-profile=true
#quake-height-percent=90
#quake-specific-monitor=0
#terminal-title-show-when-single=false
#terminal-title-style='small'
#theme-variant='system'
#warn-vte-config-issue=false
#window-style='borderless'

#[profiles]
#list=['2b7c4080-0ddd-46c5-8f23-563fd3ba789d']

#[profiles/2b7c4080-0ddd-46c5-8f23-563fd3ba789d]
#background-color='#1D2021'
#background-transparency-percent=0
#badge-color-set=false
#badge-position='northeast'
#badge-text='${username}${hostname}'
#bold-color-set=false
#cursor-colors-set=false
#dim-transparency-percent=0
#font='Monofur Nerd Font Bold 12'
#foreground-color='#EBDBB2'
#highlight-colors-set=false
#login-shell=true
#palette=['#1D2021', '#CC241D', '#98971A', '#D79921', '#458588', '#B16286', '#689D6A', '#BDAE93', '#7C6F64', '#FB4934', '#B8BB26', '#FABD2F', '#83A598', '#D3869B', '#8EC07C', '#EBDBB2']
#use-system-font=false
#use-theme-colors=false
#visible-name='GruvBox'
#EOL

#cat > /tmp/gnome.terminal.conf <<EOL
#[/]
#list=['8ea9f29b-56e8-466a-b1f9-c400ae62d070']

#[:8ea9f29b-56e8-466a-b1f9-c400ae62d070]
#allow-bold=true
#background-color='#282828282828'
#background-transparency-percent=13
#bold-color='#ebebdbdbb2b2'
#bold-color-same-as-fg=true
#font='Monofur Nerd Font Mono Bold 12'
#foreground-color='#ebebdbdbb2b2'
#highlight-background-color='#'
#highlight-colors-set=true
#highlight-foreground-color='#'
#palette=['#282828282828', '#cccc24241d1d', '#989897971a1a', '#d7d799992121', '#454585858888', '#b1b162628686', '#68689d9d6a6a', '#a8a899998484', '#929283837474', '#fbfb49493434', '#b8b8bbbb2626', '#fafabdbd2f2f', '#8383a5a59898', '#d3d386869b9b', '#8e8ec0c07c7c', '#ebebdbdbb2b2']
#use-system-font=false
#use-theme-background=false
#use-theme-colors=false
#use-theme-transparency=false
#use-transparent-background=true
#visible-name='Gruvbox'
#EOL

# Dracula Themes for Tilix
cat > /tmp/tilix.terminal.conf <<EOL
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
background-color='#282936'
background-transparency-percent=13
badge-color-set=false
badge-position='northeast'
badge-text=''
bold-color-set=false
cursor-colors-set=false
dim-transparency-percent=0
font='Monofur Nerd Font Mono Bold Italic 12'
foreground-color='#F8F8F2'
highlight-colors-set=false
login-shell=true
palette=['#000000', '#FF5454', '#50FA7B', '#F1FA8C', '#BD93F9', '#FF79C6', '#8BE8FD', '#BFBFBF', '#4D4D4D', '#FF6E67', '#5AF78D', '#F4F99D', '#CAA8FA', '#FF92D0', '#9AEDFE', '#E6E6E6']
use-system-font=false
use-theme-colors=false
visible-name='Dracula'
EOL

# Dracula Themes for Gnome Terminal
cat > /tmp/gnome.terminal.conf <<EOL
[/]
list=['8ea9f29b-56e8-466a-b1f9-c400ae62d070']
[:8ea9f29b-56e8-466a-b1f9-c400ae62d070]
allow-bold=true
background-color='#282A36'
background-transparency-percent=13
bold-color='#6E46A4'
bold-color-same-as-fg=false
font='Monofur Nerd Font Mono Bold 12'
foreground-color='#F8F8F2'
highlight-background-color='#'
highlight-colors-set=true
highlight-foreground-color='#'
palette=['#262626', '#E356A7', '#42E66C', '#E4F34A', '#9B6BDF', '#E64747', '#75D7EC', '#EFA554', '#7A7A7A', '#FF79C6', '#50FA7B', '#F1FA8C', '#BD93F9', '#FF5555', '#8BE9FD', '#FFB86C']
use-system-font=false
use-theme-background=false
use-theme-colors=false
use-theme-transparency=false
use-transparent-background=true
visible-name='Dracula'
EOL

if ! command -v dconf &> /dev/null
then
    echo "COMMAND dconf could not be found think to switch to Gnome"
else
  dconf load /com/gexperts/Tilix/ < /tmp/gnome.terminal.conf
  dconf load /org/gnome/terminal/ < /tmp/tilix.terminal.conf
fi

# Bootstrap installation with scoop
# Install powershell module
# nvim $PROFILE.CurrentUserCurrentHost
# add . $env:USERPROFILE\.config\powershell\user_profile.ps1

iex (new-object net.webclient).downloadstring('https://get.scoop.sh')

scoop install curl sudo jq

scoop bucket add extras
scoop bucket add Versions
scoop bucket add Ash258 'https://github.com/Ash258/scoop-Ash258.git'
scoop bucket add nerd-fonts

scoop install neovim
scoop install neovide
scoop install python
scoop install ripgrep
scoop install rust
scoop install nginx
scoop install nvm
scoop install lsd
scoop install mingw-winlibs
scoop install winfetch
scoop install cloudfoundry-cli
scoop install extras/vcredist2015
scoop install msys2
scoop install starship
# scoop install https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/oh-my-posh.json

echo "Cloning AstroNvim Config"
git clone https://github.com/AstroNvim/AstroNvim $env:USERPROFILE/AppData/Local/nvim

# Install-Module post-git -Scope Current User
# Install-Module oh-my-posh -Scope Current User
# Install-Module PSReadLine -Scope CurrentUser
# Install-Module PSFzf -Scope CurrentUser
# Install-Module z -Scope CurrentUser
#
# Mush do symbolic link before installing sdkman
# ln -s /c/Program\ Files/7-Zip/7z.exe /c/Program\ Files/Git/mingw64/bin/zip.exe
# curl -s "https://get.sdkman.io" | bash

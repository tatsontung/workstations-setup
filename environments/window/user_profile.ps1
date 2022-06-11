Import-Module posh-git
Import-Module oh-my-posh
$omp_config = Join-Path $PSScriptRoot ".\user.omp.json"
oh-my-posh --init --shell pwsh --config $omp_config | Invoke-Expression
# Invoke-Expression (&starship init powershell)

Import-Module -Name Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar

# Fzf
Import-Module PSFzf
Set-PsFzfOption -PSReadlineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Env
$env:GIT_SSH = "C:\Windows\system32\OpenSSH\ssh.exe"

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'
Set-Alias ps1.reload '& $profile'
#Set-Alias posh.theme 'Set-PoshPrompt'
Set-Alias dotfiles 'git --git-dir=$home/.dotfiles --work-tree=$home'
Set-Alias ddps 'dotfiles push origin master'
Set-Alias ddpr 'dotfiles pull -r'
Set-Alias ddst 'dotfiles status'
Set-Alias dot 'dotfiles'
Set-Alias sshagent 'ssh-agent -s'
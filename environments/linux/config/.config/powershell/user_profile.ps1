Import-Module posh-git
Import-Module oh-my-posh
$omp_config = Join-Path $PSScriptRoot "tatsontung.omp.json"
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

# Alias
Set-Alias ls lsd
Set-Alias ps1.reload '. $profile'
Set-Alias posh.theme 'Set-PoshPrompt'

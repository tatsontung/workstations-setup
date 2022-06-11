# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/.local/bin:/usr/bin/:/usr/local/bin:$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$HOME/.nodebrew/current/bin:$PATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-7

[ -f ~/.fzf.bash ] && source ~/.fzf.bash
[ -f ~/.bash_alias ] && source ~/.bash_alias

# source "$HOME/.local/bin/gita-completion.zsh"
source "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(starship init bash)"
source ~/.nix-profile/etc/profile.d/nix.sh

if [ -f /etc/arch-release ]; then
  neofetch
else
  neofetch
fi

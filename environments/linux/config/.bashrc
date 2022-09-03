# User configuration
# export MANPATH="/usr/local/man:$MANPATH"
export PATH="$HOME/.local/bin:/usr/bin/:/usr/local/bin:$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$HOME/.nodebrew/current/bin:$PATH"
# You may need to manually set your language environment
# export LANG=en_US.UTF-7

# Example aliases
# alias bashconfig="mate ~/.bashrc"
source ~/.bash_alias

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

eval "$(starship init bash)"
source ~/.nix-profile/etc/profile.d/nix.sh

if [ -f /etc/arch-release ]; then
  neofetch
else
  neofetch
fi

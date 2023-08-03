# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -s '^U' 'unicodemoji^M'
# Path to your oh-my-zsh installation.
#export ZSH=~/.oh-my-zsh
export DEFAULT_USER="$USER"
export LANG="en_US.UTF-8"
export TERM="screen-256color"
export EDITOR=/usr/bin/vim
export VISUAL=/usr/bin/vim
## History wrapper
function zsh_history {
  local clear list
  zparseopts -E c=clear l=list

  if [[ -n "$clear" ]]; then
    # if -c provided, clobber the history file
    echo -n >| "$HISTFILE"
    fc -p "$HISTFILE"
    echo >&2 History file deleted.
  elif [[ -n "$list" ]]; then
    # if -l provided, run as if calling `fc' directly
    builtin fc "$@"
  else
    # unless a number is provided, show all history events (starting from 1)
    [[ ${@[-1]-} = *[0-9]* ]] && builtin fc -l "$@" || builtin fc -l "$@" 1
  fi
}
# Timestamp format
case ${HIST_STAMPS-} in
  "mm/dd/yyyy") alias history='zsh_history -f' ;;
  "dd.mm.yyyy") alias history='zsh_history -E' ;;
  "yyyy-mm-dd") alias history='zsh_history -i' ;;
  "") alias history='zsh_history' ;;
  *) alias history="zsh_history -t '$HIST_STAMPS'" ;;
esac

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
[ "$HISTSIZE" -lt 50000 ] && HISTSIZE=500000
[ "$SAVEHIST" -lt 10000 ] && SAVEHIST=100000

source ~/.zplug/init.zsh

# Supports oh-my-zsh plugins and the like
zplug "plugins/git",   from:oh-my-zsh
zplug "plugins/alias-finder",   from:oh-my-zsh
zplug "plugins/fasd",   from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "b4b4r07/emoji-cli"
# Set the priority when loading
# e.g., zsh-syntax-highlighting must be loaded
# after executing compinit command and sourcing other plugins
# (If the defer tag is given 2 or above, run after compinit command)
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting"
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load

# Arch Linux command-not-found support, you must have package pkgfile installed
# https://wiki.archlinux.org/index.php/Pkgfile#.22Command_not_found.22_hook
[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh


## Options configuration
setopt extended_history               # record timestamp of command in HISTFILE
setopt hist_expire_dups_first         # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups               # ignore duplicated commands history list
setopt hist_ignore_space              # ignore commands that start with space
setopt histignorealldups              # If a new command is a duplicate, remove the older one
setopt hist_verify                    # show command with history expansion to user before running it
setopt share_history                  # share command history da
setopt correct                      # Auto correct mistakes
setopt extendedglob                 # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                   # Case insensitive globbing
setopt rcexpandparam                # Array expension with parameters
setopt nocheckjobs                  # Don't warn about running processes when exiting
setopt numericglobsort              # Sort filenames numerically when it makes sense
setopt nobeep                       # No beep
setopt appendhistory                # Immediately append history instead of overwriting
setopt autocd                       # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Completion.
autoload -Uz compinit
compinit
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

# Keys
# Use emacs key bindings
#bindkey -e

## [PageUp] - Up a line of history
#if [[ -n "${terminfo[kpp]}" ]]; then
  #bindkey -M emacs "${terminfo[kpp]}" up-line-or-history
  #bindkey -M viins "${terminfo[kpp]}" up-line-or-history
  #bindkey -M vicmd "${terminfo[kpp]}" up-line-or-history
#fi
## [PageDown] - Down a line of history
#if [[ -n "${terminfo[knp]}" ]]; then
  #bindkey -M emacs "${terminfo[knp]}" down-line-or-history
  #bindkey -M viins "${terminfo[knp]}" down-line-or-history
  #bindkey -M vicmd "${terminfo[knp]}" down-line-or-history
#fi

## Start typing + [Up-Arrow] - fuzzy find history forward
#if [[ -n "${terminfo[kcuu1]}" ]]; then
  #autoload -U up-line-or-beginning-search
  #zle -N up-line-or-beginning-search

  #bindkey -M emacs "${terminfo[kcuu1]}" up-line-or-beginning-search
  #bindkey -M viins "${terminfo[kcuu1]}" up-line-or-beginning-search
  #bindkey -M vicmd "${terminfo[kcuu1]}" up-line-or-beginning-search
#fi
## Start typing + [Down-Arrow] - fuzzy find history backward
#if [[ -n "${terminfo[kcud1]}" ]]; then
  #autoload -U down-line-or-beginning-search
  #zle -N down-line-or-beginning-search

  #bindkey -M emacs "${terminfo[kcud1]}" down-line-or-beginning-search
  #bindkey -M viins "${terminfo[kcud1]}" down-line-or-beginning-search
  #bindkey -M vicmd "${terminfo[kcud1]}" down-line-or-beginning-search
#fi

## [Home] - Go to beginning of line
#if [[ -n "${terminfo[khome]}" ]]; then
  #bindkey -M emacs "${terminfo[khome]}" beginning-of-line
  #bindkey -M viins "${terminfo[khome]}" beginning-of-line
  #bindkey -M vicmd "${terminfo[khome]}" beginning-of-line
#fi
## [End] - Go to end of line
#if [[ -n "${terminfo[kend]}" ]]; then
  #bindkey -M emacs "${terminfo[kend]}"  end-of-line
  #bindkey -M viins "${terminfo[kend]}"  end-of-line
  #bindkey -M vicmd "${terminfo[kend]}"  end-of-line
#fi

## [Shift-Tab] - move through the completion menu backwards
#if [[ -n "${terminfo[kcbt]}" ]]; then
  #bindkey -M emacs "${terminfo[kcbt]}" reverse-menu-complete
  #bindkey -M viins "${terminfo[kcbt]}" reverse-menu-complete
  #bindkey -M vicmd "${terminfo[kcbt]}" reverse-menu-complete
#fi

## [Backspace] - delete backward
#bindkey -M emacs '^?' backward-delete-char
#bindkey -M viins '^?' backward-delete-char
#bindkey -M vicmd '^?' backward-delete-char
## [Delete] - delete forward
#if [[ -n "${terminfo[kdch1]}" ]]; then
  #bindkey -M emacs "${terminfo[kdch1]}" delete-char
  #bindkey -M viins "${terminfo[kdch1]}" delete-char
  #bindkey -M vicmd "${terminfo[kdch1]}" delete-char
#else
  #bindkey -M emacs "^[[3~" delete-char
  #bindkey -M viins "^[[3~" delete-char
  #bindkey -M vicmd "^[[3~" delete-char

  #bindkey -M emacs "^[3;5~" delete-char
  #bindkey -M viins "^[3;5~" delete-char
  #bindkey -M vicmd "^[3;5~" delete-char
#fi

### ARCHIVE EXTRACTION
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

export PATH="$HOME/bin:$HOME/.bin:$HOME/.local/bin:$NVM_BIN:$GRAALVM_HOME/bin:$HOME/.npm-packages/bin:$HOME/bin/jav/bin:$HOME/sdk/go/bin:/var/lib/snapd/snap/bin:$HOME/.gobrew/current/bin:$HOME/.gobrew/bin:$HOME/.nodebrew/current/bin:$PATH"


[[ -f ~/.fzf.zsh ]] && source ~/.fzf.zsh
[[ -f ~/.bash_aliases ]] && source ~/.bash_aliases

# source "$HOME/.local/bin/gita-completion.zsh"
source "$HOME/.cargo/env"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

eval "$(starship init zsh)"
source ~/.nix-profile/etc/profile.d/nix.sh

if [ -f /etc/arch-release ]; then
  neofetch
else
  neofetch
fi


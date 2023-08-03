#!/usr/bin/env bash

alias tmux='TERM=xterm-256color tmux'
alias vim='TERM=xterm-256color vim'
alias vi='vim'
alias wakeserver='wakeonlan 00:11:22:33:44:55'

# Replace ls with exa
alias ls='exa -al --color=always --group-directories-first --icons' # preferred listing
alias la='exa -a --color=always --group-directories-first --icons'  # all files and dirs
alias ll='exa -l --color=always --group-directories-first --icons'  # long format
alias lt='exa -aT --color=always --group-directories-first --icons' # tree listing
alias l.="exa -a | egrep '^\.'"                                     # show only dotfiles

# Youtube-Dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "
alias ytv-best="youtube-dl -f bestvideo+bestaudio "

# Git Aliases
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ddps='dotfiles push origin master'
alias ddpr='dotfiles pull -r'
alias ddst='dotfiles status'
alias dot='dotfiles'
alias gdc='git duet-commit'
alias gcl='git clone'
alias ga='git add'
alias grm='git rm'
alias gap='git add -p'
alias gall='git add -A'
alias gf='git fetch --all --prune'
alias gft='git fetch --all --prune --tags'
alias gfv='git fetch --all --prune --verbose'
alias gftv='git fetch --all --prune --tags --verbose'
alias gus='git reset HEAD'
alias gpristine='git reset --hard && git clean -dfx'
alias gclean='git clean -fd'
alias gm="git merge"
alias gmv='git mv'
alias g='git'
alias get='git'
alias gst='git status'
alias gs='git status'
alias gss='git status -s'
alias gsu='git submodule update --init --recursive'
alias gl='git pull'
alias glum='git pull upstream master'
alias gpr='git pull --rebase'
alias gpp='git pull && git push'
alias gup='git fetch && git rebase'
alias gp='git push'
alias gpo='git push origin'
alias gpu='git push --set-upstream'
alias gpom='git push origin master'
alias gr='git remote'
alias grv='git remote -v'
alias gra='git remote add'
alias gd='git diff'
alias gdv='git diff -w "$@" | vim -R -'
alias gc='git commit -v'
alias gca='git commit -v -a'
alias gcm='git commit -v -m'
alias gcam="git commit -v -am"
alias gci='git commit --interactive'
alias gb='git branch'
alias gba='git branch -a'
alias gbt='git branch --track'
alias gbm='git branch -m'
alias gbd='git branch -d'
alias gbD='git branch -D'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gco='git checkout'
alias gcom='git checkout master'
alias gcb='git checkout -b'
alias gcob='git checkout -b'
alias gct='git checkout --track'
alias gexport='git archive --format zip --output'
alias gdel='git branch -D'
alias gmu='git fetch origin -v; git fetch upstream -v; git merge upstream/master'
alias gll='git log --graph --pretty=oneline --abbrev-commit'
alias gg="git log --graph --pretty=format:'%C(bold)%h%Creset%C(magenta)%d%Creset %s %C(yellow)<%an> %C(cyan)(%cr)%Creset' --abbrev-commit --date=relative"
alias glola="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset %C(bold blue)<%cn>%Creset' --abbrev-commit --date=relative"
alias ggs="gg --stat"
alias gsl="git shortlog -sn"
alias gwc="git whatchanged"
alias gt="git tag"
alias gta="git tag -a"
alias gtd="git tag -d"
alias gtl="git tag -l"
# From http://blogs.atlassian.com/2014/10/advanced-git-aliases/
# Show commits since last pull
alias gnew="git log HEAD@{1}..HEAD@{0}"
# Add uncommitted and unstaged changes to the last commit
alias gcaa="git commit -a --amend -C HEAD"
alias ggui="git gui"
alias gcsam="git commit -S -am"
alias gstd="git stash drop"
alias gstl="git stash list"
alias gh='cd "$(git rev-parse --show-toplevel)"'

# Proxy madness
PROXY_HOST=192.168.1.24
PROXY_PORT=3128

alias proxyon="export http_proxy=http://$PROXY_HOST:$PROXY_PORT; export https_proxy=http://$PROXY_HOST:$PROXY_PORT"
alias proxyoff="export http_proxy=;export https_proxy= "
alias sshagent="eval $(ssh-agent -s)"
alias npmproxyoff="npm config rm proxy;npm config rm https-proxy"
alias npmproxyon="npm config set proxy http://$PROXY_HOST:$PROXY_PORT;npm config set https-proxy http://$PROXY_HOST:$PROXY_PORT"
alias gitproxyon="git config --global http.proxy http://$PROXY_HOST:$PROXY_PORT"
alias gitproxyoff="git config --global --unset http.proxy"
alias gradleproxy="./gradlew -Dhttps.proxyHost=$PROXY_HOST -Dhttps.proxyPort=$PROXY_PORT -Dhttp.proxyHost=$PROXY_HOST -Dhttp.proxyPort=$PROXY_PORT"
alias updatepath="export PATH=/snap/bin:$NVM_BIN:$HOME/bin:$JAVA_HOME/bin:$PATH"
export _JAVA_OPTIONS="-Dhttp.proxyHost=$PROXY_HOST -Dhttp.proxyPort=$PROXY_PORT -Dhttps.proxyHost=$PROXY_HOST -Dhttps.proxyPort=$PROXY_PORT"
export PATH=/snap/bin:$NVM_BIN:$HOME/bin:$JAVA_HOME/bin:$PATH

case $OSTYPE in
  darwin*)
    alias gtls="git tag -l | gsort -V"
    ;;
  *)
    alias gtls='git tag -l | sort -V'
    ;;
esac

# fasd 
fasd_cd () {
	if [ $# -le 1 ]
	then
		fasd "$@"
	else
		local _fasd_ret="$(fasd -e 'printf %s' "$@")" 
		[ -z "$_fasd_ret" ] && return
		[ -d "$_fasd_ret" ] && cd "$_fasd_ret" || printf %s\n "$_fasd_ret"
	fi
}

alias a='fasd -a'
alias d='fasd -d'
alias f='fasd -f'
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'
alias j='fasd_cd -d -i'  # cd with interactive selection
alias v='f -e vim'       # quick opening files with vim
alias m='f -e mplayer'   # quick opening files with mplayer
alias o='a -e xdg-open'  # quick opening files with xdg-open
alias nv='f -e nvim'
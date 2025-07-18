# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~
# Directories
export REPOS="$HOME/Repos"
export GITUSER="pedrotchang"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export SECONDBRAIN="$HOME/secondbrain"

export GOBIN="$HOME/.local/bin"
export GOPATH="$HOME/go/"

# enable zsh history
HISTFILE="$HOME/.zsh_history"
HISTSIZE=80000
SAVEHIST=50000

# Add Homebrew zsh completions
if type brew &>/dev/null; then
  FPATH=/opt/homebrew/share/zsh/site-functions:$FPATH
fi

# enable zsh completion
autoload -Uz compinit && compinit

# Enhance pass completion for nested paths
zstyle ':completion:*:*:pass:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

# enable zsh vi-mode
bindkey -v
export KEYTIMEOUT=1 # make switching between modes faster

# enable extended glob and null glob
setopt extended_glob null_glob

# mise runtime manager
if command -v mise > /dev/null ; then
  eval "$(mise activate zsh)"
fi

# neovim
if command -v nvim > /dev/null ; then
  export EDITOR="nvim"
  export VISUAL="nvim"
  alias v=nvim
fi

# lsd - modern ls replacement
if command -v lsd > /dev/null ; then
  alias ls="lsd"
  alias ll="ls -lgh"
  alias la='ls -a'
  alias lla='ls -lgha'
  alias lt='ls --tree'
else
  # fallback to standard ls with colors if available
  if ls --color=auto &>/dev/null; then
    alias ls='ls --color=auto'
    alias ll='ls -la'
    alias la='ls -A'
    alias lla='ll -A'
  fi
fi

# starship prompt
if command -v starship > /dev/null ; then
  eval "$(starship init zsh)"
fi

# fzf
if command -v fzf > /dev/null ; then
  source <(fzf --zsh)
  alias hb='history | fzf'
fi

# flux
if command -v flux > /dev/null ; then
  source <(flux completion zsh)
fi

# bat - cat replacement
if command -v bat > /dev/null ; then
  alias cat="bat"
fi

# tmux
if command -v tmux > /dev/null ; then
  alias t='tmux'
fi

# git
if command -v git > /dev/null ; then
  alias g='git'
  alias gp='git pull'
  alias gs='git status'
fi

if command -v lazygit > /dev/null ; then
  alias lg='lazygit'
fi

# kubectl
if command -v minikube > /dev/null ; then
  alias mk='minikube kubectl --'
  alias kgp='kubectl get pods'
  alias mkd='minikube dashboard'
fi

# kubectl
if command -v kubectl > /dev/null ; then
  alias k='kubectl'
  alias kgp='kubectl get pods'
fi

if command -v kubectx > /dev/null ; then
  alias kc='kubectx'
fi

if command -v kubens > /dev/null ; then
  alias kn='kubens'
fi

# Basic aliases
alias c="clear"
alias ..="cd .."

# Directory aliases
if [ -d "$SCRIPTS" ]; then
  alias scripts='cd $SCRIPTS'
fi

if [ -d "$LAB" ]; then
  alias lab='cd $LAB'
fi

if [ -d "$GHREPOS/dotfiles" ]; then
  alias dot='cd $GHREPOS/dotfiles/'
fi

if [ -d "$GHREPOS/homelab" ]; then
  alias home='cd $GHREPOS/homelab/'
fi

if [ -d "$REPOS/github.com/mischavandenburg/homelab" ]; then
  alias mvhome='cd $REPOS/github.com/mischavandenburg/homelab'
fi

if [ -d "$GHREPOS" ]; then
  alias gr='cd $GHREPOS'
fi

if [ -d "$REPOS/github.com/mischavandenburg/dotfiles" ]; then
  alias mvdot='cd $REPOS/github.com/mischavandenburg/dotfiles'
fi

if [ -d "$GHREPOS/homelab/clusters/tachtit" ]; then
  alias tach='cd $GHREPOS/homelab/clusters/tachtit/'
fi

if [ -d "$GHREPOS/homelab/clusters/data" ]; then
  alias data='cd $GHREPOS/homelab/clusters/data/'
fi

if [ -d "$GHREPOS/blog" ]; then
  alias blog='cd $GHREPOS/blog/'
fi

if [ -d "$HOME/secondbrain/0-inbox" ]; then
  alias in="cd $HOME/secondbrain/0-inbox/"
fi

if [ -d "$HOME/secondbrain" ]; then
  alias cdsb="cd $HOME/secondbrain/"
fi

if [[ -d .zsh/zsh-autosuggestions ]] ; then
  source .zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# syntax highlighting needs to be at the end because of reasons
if [[ -d .zsh/zsh-syntax-highlighting ]] ; then
  source .zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/seyza/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/seyza/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

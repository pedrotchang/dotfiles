# ~~~~~~~~~~~~~~~ Environment Variables ~~~~~~~~~~~~~~~~~~~~~~~~


# Set to superior editing mode

set -o vi

export VISUAL=nvim
export EDITOR=nvim
export TERM="tmux-256color"

export BROWSER="chrome"

# Directories

export REPOS="$HOME/Repos"
export GITUSER="pedrotchang"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dotfiles"
export LAB="$GHREPOS/lab"
export SCRIPTS="$DOTFILES/scripts"
export ICLOUD="$HOME/icloud"
export SECONDBRAIN="$HOME/secondbrain"

# Go related. In general all executables and scripts go in .local/bin

#export GOBIN="$HOME/.local/bin"
#export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
#export GOPATH="$HOME/.local/share/go"
#export GOPATH="$HOME/go/"

# ~~~~~~~~~~~~~~~ Path configuration ~~~~~~~~~~~~~~~~~~~~~~~~


setopt extended_glob null_glob

path=(
    /opt/homebrew/opt/curl/bin      # Homebrew curl
    $path                           # Keep existing PATH entries
    /opt/local/bin
    $HOME/bin
    $HOME/.local/bin
    $HOME/.cargo
    $HOME/.cargo/env
    $SCRIPTS
    #$HOME/.krew/bin
    $HOME/.rd/bin                   # Rancher Desktop
    /root/.local/bin                # Dev Container Specifics
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH

# Source asdf
. "$HOME/.asdf/asdf.sh"
    
# Source Rust
. "$HOME/.cargo/"
. "$HOME/.cargo/env"


# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~

eval "$(starship init zsh)"

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias v=nvim
alias c="clear"
alias hb='history | fzf'

# cd
alias ..="cd .."

# repos
alias gr="cd /Users/seyza/Repos/github.com/pedrotchang/"

#etc
alias icloud="cd \$ICLOUD"

#ls
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias lla='ll -A'

alias lsda='lsd -all'
alias lsdt='lsd --tree'

#git
alias g='git'
alias gp='git pull'
alias gs='git status'
alias lg='lazygit'
alias go='git log --oneline'

# kubectl
alias k='kubectl'
alias kgp='kubectl get pods'
alias kc='kubectx'
alias kn='kubens'
autoload -U +X compinit && compinit
source <(kubectl completion zsh)
# source <(kubectl completion zsh)
#complete -o default -F __start_kubectl k

alias kcs='kubectl config use-context admin@homelab-staging'
alias kcp='kubectl config use-context admin@homelab-production'

# secondbrain
alias in="cd /Users/seyza/secondbrain/0-inbox/"
alias cdsb="cd /Users/seyza/secondbrain/"

if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi


### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/seyza/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

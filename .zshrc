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

function get_os_paths() {
    case "$OSTYPE" in
        linux-gnu*)
            if [[ -f /etc/debian_version ]]; then
                # Debian/Ubuntu specific paths
                echo "/opt/nvim-linux64/bin"  # Added Neovim path
                # Add more Debian-specific paths as needed
            fi
            ;;
        darwin*)
            # macOS specific paths
            echo "/opt/homebrew/bin"
            echo "/opt/homebrew/sbin"
            echo /opt/local/bin
            echo /opt/homebrew/opt/curl/bin      # Homebrew curl
            ;;
    esac
}

path=(
    $path                           # Keep existing PATH entries
    $HOME/bin
    $HOME/.local/bin
    $HOME/.cargo
    $HOME/.cargo/env
    $HOME/.asdf
    $HOME/.asdf/asdf.sh
    $SCRIPTS
    #$HOME/.krew/bin
    $HOME/.rd/bin                   # Rancher Desktop
    /root/.local/bin                # Dev Container Specifics
    /home/vscode/.local/bin         # Dev Container Specifics
)

# Remove duplicate entries and non-existent directories
typeset -U path
path=($^path(N-/))

export PATH



# ~~~~~~~~~~~~~~~ Dev Container Specifics ~~~~~~~~~~~~~~~~~~~~~~~~


if [ -d "/home/linuxbrew/.linuxbrew" ]; then
     eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
fi

# ~~~~~~~~~~~~~~~ Prompt ~~~~~~~~~~~~~~~~~~~~~~~~


PURE_GIT_PULL=0


if [[ "$OSTYPE" == darwin* ]]; then
  fpath+=("$(brew --prefix)/share/zsh/site-functions")
else
  fpath+=($HOME/.zsh/pure)
fi

autoload -U promptinit; promptinit
prompt pure

# ~~~~~~~~~~~~~~~ Aliases ~~~~~~~~~~~~~~~~~~~~~~~~

alias v=nvim
alias c="clear"
alias hb='history | fzf'
alias t='tmux'

# cd
alias ..="cd .."

# repos
alias scripts='cd $SCRIPTS'
alias lab='cd $LAB'
alias dot='cd $GHREPOS/dotfiles/'
alias gr='cd $GHREPOS'
alias mvdot='cd $REPOS/github.com/mischavandenburg/dotfiles'

#ls
alias ls='ls --color=auto'
alias ll='ls -la'
alias la='ls -A'
alias lla='ll -A'
# alias la='exa -laghm@ --all --icons --git --color=always'

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
# autoload -U +X compinit && compinit
# source <(kubectl completion zsh)
# source <(kubectl completion zsh)
# complete -o default -F __start_kubectl k

alias kcs='kubectl config use-context admin@homelab-staging'
alias kcp='kubectl config use-context admin@homelab-production'

# secondbrain
alias in="cd /Users/seyza/secondbrain/0-inbox/"
alias cdsb="cd /Users/seyza/secondbrain/"

# ~~~~~~~~~~~~~~~ Completion ~~~~~~~~~~~~~~~~~~~~~~~~


fpath+=~/.zfunc

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit -u

zstyle ':completion:*' menu select


# Example to install completion:
# talosctl completion zsh > ~/.zfunc/_talosctl


# ~~~~~~~~~~~~~~~ Sourcing ~~~~~~~~~~~~~~~~~~~~~~~~


# source "$HOME/.privaterc"
source <(fzf --zsh)

#eval "$(direnv hook zsh)"

# ~~~~~~~~~~~~~~~ Misc ~~~~~~~~~~~~~~~~~~~~~~~~

fpath+=~/.zfunc; autoload -Uz compinit; compinit

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
export PATH="/Users/seyza/.rd/bin:$PATH"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)


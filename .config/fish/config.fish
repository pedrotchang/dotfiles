if status is-interactive
    # Commands to run in interactive sessions can go here
    
end

function ..
    cd ..
end

function ..2
    cd ..
    cd ..
end

function ..3
    cd ..
    cd ..
    cd ..
end


set fish_greeting ""

set -gx TERM xterm-256color

# theme
set -g theme_color_scheme terminal-dark
set -g fish_prompt_pwd_dir_length 1
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_hostname always


# shortcuts
alias c='clear'
alias g='git'
alias gbr="git branch"
alias gst="git status"
alias p='pwd -P'
alias q='exit'
alias la='ls -A'
alias l='ls -CF'
alias ide='bash ~/code/scripts/ide.sh'
command -qv nvim && alias vim nvim

# alias
set -gx EDITOR nvim
set -gx PATH bin $PATH
set -gx PATH ~/bin $PATH
set -gx PATH ~/.local/bin $PATH
set -gx PATH /.emacs.d/bin $PATH

# NodeJS
set -gx PATH node_modules/.bin $PATH

# Dynamic ruby gem paths
set -U fish_user_paths (ruby -e 'print Gem.user_dir')/bin $fish_user_paths

# This config an alias for my git bare repo dotfiles.
alias config='/opt/homebrew/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(frum init)"

export PATH="$HOME/.emacs.d/bin:$PATH"
export BUN_INSTALL="/Users/ptyc/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


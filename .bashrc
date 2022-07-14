eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(frum init)"
alias config='/opt/homebrew/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'
# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt
export PATH="$HOME/.emacs.d/bin:$PATH"

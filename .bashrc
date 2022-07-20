# Run twolfson/sexy-bash-prompt
. ~/.bash_prompt
# z jump-list
. ~/.config/env/z.sh

# Aliases
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'
alias mkdir='mkdir -p'
alias h='history'
alias j='jobs -l'
alias which='type -a'
alias path='echo -e ${PATH//:/\\n}'
alias libpath='echo -e ${LD_LIBRARY_PATH//:/\\n}'

alias du='du -kh'    # Makes a more readable output. Disk Usage
alias df='df -kTh'   # Disk Free (available amount free)

# faster directory changes
alias ..="cd .."
alias ..1="cd .."
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."
alias -- -="cd -"

# shortcuts
alias c='clear'
alias g='git'
alias gbr="git branch"
alias gst="git status"
alias p='pwd -P'
alias q='exit'
alias la='ls -A'
alias l='ls -CF'

alias vim='nvim'

# This config an alias for my git bare repo dotfiles.
alias config='/opt/homebrew/bin/git --git-dir=$HOME/dotfiles/ --work-tree=$HOME'

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(frum init)"

# exports
export PATH="$HOME/.emacs.d/bin:$PATH"
export BUN_INSTALL="/Users/ptyc/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# export EDITOR=vim
# export HISTCONTROL=ignoreboth
# export TERM=xterm-256color
# export VISUAL=vim
# export MYNAME
# export LESS='-M'
# export CLICOLOR=1
# export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'
# export PATH

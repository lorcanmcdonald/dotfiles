#!/bin/bash

# shellcheck source=~/.bashrc
source "$HOME/.bashrc" 

if which brew > /dev/null; then
  if [ -f $(brew --prefix)/etc/bash_completion ]; then
    . $(brew --prefix)/etc/bash_completion
  fi
fi

alias docker-env='eval $(docker-machine env default)'
alias denv=docker-env
alias ddev='docker run --rm -ti -v "$(pwd):/home/lorcan/vol" -w /home/lorcan/vol lorcan/dev-machine'

export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PS1='⚒ \[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

alias hlint="hlint --hint=Default --hint=Dollar --hint=Generalise"

alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias chrome-canary="/Applications/Google\ Chrome\ Canary.app/Contents/MacOS/Google\ Chrome\ Canary"
alias fst="awk '{print \$1}'"
alias snd="awk '{print \$2}'"

set -o vi

export PATH="$PATH:$HOME/scripts/bin"
export PATH="$PATH:$HOME/bin"

# added by Anaconda3 2.5.0 installer
# export PATH="//anaconda/bin:$PATH"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

export PATH="$PATH:$HOME/.cargo/bin"
export PATH="$HOME/.local/bin:$PATH"
export EDITOR=vim

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

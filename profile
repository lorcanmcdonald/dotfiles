#!/bin/bash

# shellcheck source=~/.bashrc
source $HOME/.bashrc

if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad

PS1='⚒ \[\e[0;32m\]\u\[\e[m\] \[\e[1;34m\]\w\[\e[m\] \[\e[1;32m\]\$\[\e[m\] '

alias hlint="hlint --hint=Default --hint=Dollar --hint=Generalise"

set -o vi

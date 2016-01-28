#!/bin/bash

export EDITOR=vim
export PATH="$PATH:$HOME/.local/bin"
export PATH="$PATH:$HOME/.cabal/bin"
export PATH="$PATH:$HOME/.aws/bin"
alias timestamp='date +"%s"'

export NVM_DIR="/Users/lorcan/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

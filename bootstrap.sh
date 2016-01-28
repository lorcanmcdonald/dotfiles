#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

function link_dotfile {
  DOTFILE=$1
  SOURCE="$DIR/$DOTFILE"
  TARGET="$HOME/.$DOTFILE"


  if [ -e "$TARGET" ]; then
    if [ ! -h "$TARGET" ]; then
      echo "[33m$TARGET[0m is a regular file. Skipping..."
    fi
  elif [ ! -h "$TARGET" ]; then
    echo "linking $TARGET → $SOURCE"
    ln -s "$SOURCE" "$TARGET"
  fi
}

DOTFILES=("bashrc" "emacs" "gitconfig" "profile" "stylish-haskell.yaml" "tmux-osx.conf" "tmux.conf" "vim" "vimrc")

for DOTFILE in "${DOTFILES[@]}"; do
  link_dotfile "$DOTFILE"
done

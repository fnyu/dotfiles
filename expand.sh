#!/usr/bin/env zsh
#
items=(
  ".gitignore_global"
  ".omz.zsh-theme"
  ".vimrc"
  ".zshrc"
  ".plugins"
  "promptctl"
)

location=${0:a:h}

for i in $items; do
  if [[ ! -L "$HOME/$i" ]]; then
    echo "Linking: $HOME/$i"
    ln -s $location/$i $HOME/$i
  fi
done

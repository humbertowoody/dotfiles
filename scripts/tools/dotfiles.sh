#!/bin/bash
# dotfiles - @humbertowooody
# A simple bash script to take me to my dotfiles directory *if* the environment
# variable `DOTFILES_DIR` is set.

# Go directly to my dotfiles dir.
function dotfiles()
{
  # Validate the variable is set.
  if [[ -z {DOTFILES_DIR+x} ]] then
    # Information and hint.
    echo "No DOTFILES_DIR value detected.";
    echo "Perhaps you need: export DOTFILES_DIR=/home/humbertowoody/bla";
  else
    # Warm welcome.
    echo "welcome @humbertowoody" | cowsay -f stegosaurus;
    # We use pushd because a desition was made.
    pushd $DOTFILES_DIR;
  fi
}

#!/bin/bash
# This script setup Alacritty (the best terminal emulator imho) in your
# local macOS installation.

# Install main cask package using Homebrew
brew install --cask alacritty

# Create the symbolic links for configuration
ln -fs $PWD/alacritty/alacritty.yml.symlink $HOME/.alacritty.yml
# ln -fs $PWD/alacritty/dracula.yml.symlink $HOME/.dracula.yml
echo "Alacritty - Symbolic Links ready!"

# Alacritty quits automatically on first opening
open /Applications/Alacritty.app

# We open it again
open /Applications/Alacritty.app

# We wait on Powerlevel10k startup configuration task
read -p "Powerlevel10k is currently fetching gitstatusd, hit enter when it is done"

# We kill Alacritty once again
open /Applications/Alacritty.app

echo "Alacritty - Ready!"


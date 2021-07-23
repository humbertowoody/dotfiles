#!/bin/bash
# My personal favorite shell is Zsh, this file setup all the configuration
# required for it to work properly.

# First the system link for powerlevel10k
ln -fs $PWD/zsh/p10k.zsh.symlink $HOME/.p10k.zsh

# Second the symbolic link for zsh plugins
ln -fs $PWD/zsh/zsh_plugins.txt.symlink $HOME/.zsh_plugins.txt

# Finally, the main configuration for zsh
ln -fs $PWD/zsh/zshrc.symlink $HOME/.zshrc

echo "ZSH - Symbolic links created!"


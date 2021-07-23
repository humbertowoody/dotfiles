#!/bin/zsh
# This is the tmux plugin manager configuration

# tmux plugin manager https://github.com/tmux-plugins/tpm
if [ ! -d "$HOME/.tmux/plugins/tpm" ]; then
  git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
fi


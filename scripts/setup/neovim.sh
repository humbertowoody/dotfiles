#!/bin/bash
# neovim.sh - setup neovim symlink to replace `vim`

# create a symlink to /usr/local/bin/vim
sudo ln -fs $(which nvim) /usr/local/bin/vim;


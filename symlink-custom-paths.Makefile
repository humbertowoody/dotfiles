# symlinks-custom-paths.Makefile - @humbertowoody
#
# Generating complex path configuration for config files outside the basic
# $HOME directory (e.g. $HOME/.zshrc) like Alacritty's newer:
# $HOME/.config/alacritty.yml path is complicated.
#
# This file holds "manual" path generation and configuration for those cases.

# yt-dlp is a youtube download tool
yt-dlp := $(HOME)/yt-dlp.conf
$(yt-dlp):
	ln -fs $(PWD)/yt-dlp/yt-dlp.conf $(HOME)/yt-dlp.conf

# Alacritty is da' best terminal emulator (and the fastest)
alacritty := $(HOME)/.config/alacritty

$(alacritty):
	ln -fs $(PWD)/alacritty $@

# The $HOME/tools directory is the one where I store my local scripts
# and custom tooling for bash-based operations.
tools := $(HOME)/tools

$(tools):
	ln -fs $(PWD)/scripts/tools $@

# Neovim configuration
nvim := $(HOME)/.config/nvim

$(nvim):
	ln -fs $(PWD)/nvim $@

# /etc/hosts - configuration
hosts := /etc/hosts

# For this configuration i'm using a hard link (not symbolic) due to 
# special requirements. Also using 'sudo' (not the best practice) in order
# to add the file as it should be root-owned.
$(hosts):
	sudo ln -f $(PWD)/hosts/hosts $@

# Include Pago46 custom symlink paths
include dotfiles-p46/symlink-custom-paths.Makefile

# General task
.PHONY: symlink-custom-paths
symlink-custom-paths: p46-symlink-custom-paths $(yt-dlp) $(alacritty) $(tools) $(nvim) $(hosts)


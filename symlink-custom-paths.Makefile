# symlinks-custom-paths.Makefile - @humbertowoody
#
# Generating complex path configuration for config files outside the basic
# $HOME directory (e.g. $HOME/.zshrc) like Alacritty's newer:
# $HOME/.config/alacritty.yml path is complicated.
#
# This file holds "manual" path generation and configuration for those cases.

# Alacritty is da' best terminal emulator (and the fastest)
alacritty := $(HOME)/.config/alacritty

$(alacritty):
	ln -fs $(PWD)/alacritty $@

# YouTube DL is a utility which downloads YouTube videos directly from 
# the command line and it's really useful.
youtube-dl := $(HOME)/.config/youtube-dl

$(youtube-dl):
	ln -fs $(PWD)/youtube-dl $@

# The $HOME/tools directory is the one where I store my local scripts
# and custom tooling for bash-based operations.
tools := $(HOME)/tools

$(tools):
	ln -fs $(PWD)/scripts/tools $@

# Include Pago46 custom symlink paths
include dotfiles-p46/symlink-custom-paths.Makefile

# General task
.PHONY: symlink-custom-paths
symlink-custom-paths: p46-symlink-custom-paths $(youtube-dl) $(alacritty) $(tools)


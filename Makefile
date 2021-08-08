#@name dotfiles - @humbertowoody
#@description Personal dotfiles configuration for my environment.

# Abstract:
# 	This file holds all the necessary configuration orchestator to setup
# macOS-based systems (yes, also works for Linux if you switch all the
# homebrew-based installations, probably a future update might include
# that too) with my personal choices and preferences.

# Make sure that everything runs with BASH as interpreter.
SHELL := /usr/bin/env bash

# VPATH tells Make to search this list of folders when using the % pattern
VPATH = $(shell find . -type d -not -path "*/\.*")

# Homebrew
/usr/local/bin/brew:
	@scripts/pre-setup/homebrew.sh

## In this step we install Alacritty and Zsh with complements.
.PHONY: pre-setup
pre-setup: /usr/local/bin/brew
	@scripts/pre-setup/zsh.sh
	@scripts/pre-setup/alacritty.sh

## Install software with Homebrew, it should be defined within the 
## appropriate file.
.PHONY: brew
brew:
	@brew bundle

## Dump the currently-installed packages with homebrew to the Brewfile and
## overwrite it while generating a .prev copy.
.PHONY: brew-dump
brew-dump:
	@mv Brewfile Brewfile.prev
	@brew bundle dump --describe --force
	@mv Brewfile Brewfile.tmp
	@touch Brewfile
	@echo "# Brewfile - @humbertowoody" > Brewfile
	@echo "# This file holds all the packages that should be installed" >> Brewfile
	@echo "# by using the homebrew package manager." >> Brewfile
	@cat < Brewfile.tmp >> Brewfile
	@rm Brewfile.tmp

## Run various setup scripts that are really better-handled separetely
## instead of makefile-manipulated ones.
.PHONY: scripts
scripts:
	@for f in scripts/setup/*; do ./$$f; done

# Create symbolic links for .symlink files/folders
$(HOME)/.%: %.symlink
	ln -fs $(abspath $<) $@

# Find all the files/directories ending with .symlink
files-to-symlink := $(shell find . -name "*.symlink")

# Get the name.symlink from the previous list
symlinks := $(patsubst %.symlink, %, $(shell basename -a $(files-to-symlink)))

# Generate a list of symlink targets we need
symlink-paths := $(addprefix $(HOME)/., $(symlinks))

# We hold on a separate file all the custom paths to symbolic links
# in case we need to use some weird criteria/configuration destination.
include symlink-custom-paths.Makefile

## Create (or update) the symbolic links for all the configuration files
.PHONY: symlinks
symlinks: $(symlink-paths) symlink-custom-paths
	@echo "<(symbolic links were created or updated)>"


## Run a complete setup (install everything)
.PHONY: setup
setup: brew scripts symlinks
	@echo "<(ready)>"

# Get the "pretty make" script that outputs contents of a Makefile
# in a `man`-like format
bin/pretty-make:
	@curl -Ls https://raw.githubusercontent.com/awea/pretty-make/master/scripts/install.sh | bash -s

.DEFAULT_GOAL := help
## wow so much help
.PHONY: help
help: bin/pretty-make
	@bin/pretty-make pretty-help Makefile

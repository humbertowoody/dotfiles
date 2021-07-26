# dotfiles - @humbertowoody

This repository holds all my personal dotfiles configuration and a compendium
of setup-tooling in order to get everything were it's supposed to be.

The only requirement for initial work is: `make`.

## Portability

The main idea is to setup an environment "as is" right now on my local machine,
it is macOS-specific and most won't work out of it. With minor modifications
(e.g. switching homebrew for your OS packet manager) it _could_ work.

Everything is intended to work on a bash-based environment so you can easily
run this on any initial version of macOS bundled interpreter.

## Automagic

In order to setup everything I use a `Makefile` with a bunch of different
options and with built-in _pretty_ documentation.

```sh
make           # shows help
make help      # wow so much help
make symlinks  # setup the symlinks
make setup     # run .sh on scripts/setup/*
make brew      # install software with homebrew
make pre-setup # initial setup of base software (zsh, homebrew, etc) 
```

## Credits + Acknowledgments

Honestly, handling dotfiles has been a *nightmare* over the years, for the
ocassion of (finally) picking a strategy and did my research, if you'd 
like to see the original inspiration for this:

- [mmayylliiss/dotfiles](https://github.com/mmaayylliiss/dotfiles)
- [dwt1/dotfiles](https://gitlab.com/dwt1/dotfiles)

---

> Yes, there's `stow`, we know, we _all_ know.


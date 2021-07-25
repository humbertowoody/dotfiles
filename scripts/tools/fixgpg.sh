#!/bin/bash
# fixgpg - @humbertowoody
# simple script that binds the GPG_TTY variable to the current
# output of tty, this helps when navigating nested configurations
# in tmux where we need to use GPG for signing something

# this is it
function fixgpg ()
{
  export GPG_TTY=$(tty)
}


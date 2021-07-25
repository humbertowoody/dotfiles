#!/bin/bash
# hello - @humbertowoody
# Simple script which greets the user with a nice phrase + colorful
# stegosaurus

function hello()
{
  fortune | cowsay -f stegosaurus | lolcat -F 1;
}


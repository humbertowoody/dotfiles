#!/bin/bash

# gitdis - @humbertowoody

function gitvis() { 
  git log --graph --full-history --all --color \
          --pretty=format:"%x1b[31m%h%x09%x1b[32m%d%x1b[0m%x20%s"
}


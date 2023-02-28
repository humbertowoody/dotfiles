#!/bin/bash
# update-macos.sh - @humbertowoody
# This script perform standard update mgmt for my current
# macOS system. This has to be the most stupid way of keeping
# home$HOMEBREW_BIN up-to-date but, if not done every now and then:
# you: i'd like to update *this* package
# brew: i'll update the soul of your setup in a very unevitable manner
# you: o: 

HOMEBREW_BIN=/opt/homebrew/bin/brew
GCLOUD_BIN=/Users/humbertowoody/google-cloud-sdk/bin/gcloud

# Function definition
function update_macos()
{
  $HOMEBREW_BIN update && $HOMEBREW_BIN upgrade && $HOMEBREW_BIN cleanup && $GCLOUD_BIN components update -q;
}



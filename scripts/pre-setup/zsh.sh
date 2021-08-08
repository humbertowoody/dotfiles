#!/bin/bash
# My personal favorite shell is ZSH, in here I install both oh-my-zsh and
# powerlevel10k theme.

# Install Oh My ZSH
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

# Install Powerlevel10k theme
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Done
echo "Done! You can now start using ZSH."

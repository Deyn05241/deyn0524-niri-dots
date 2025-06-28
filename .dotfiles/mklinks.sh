#!/bin/bash

############################################################################
# Script that automatically creates symlinks for Deyn0524's niri dotfiles. #
############################################################################

# Symlink for .zshrc
rm -f $HOME/.zshrc
ln -s $HOME/.dotfiles/dot-zsh-theme/.zshrc $HOME/.zshrc

# Symlink for powerlevel10k
rm -f $HOME/.p10k.zsh
ln -s $HOME/.dotfiles/dot-zsh-theme/p10k.zsh $HOME/.p10k.zsh

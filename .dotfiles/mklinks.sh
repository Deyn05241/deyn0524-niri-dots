#!/bin/bash

############################################################################
# Script that automatically creates symlinks for Deyn0524's niri dotfiles. #
############################################################################

# Symlink for .zshrc
if [ -f "$HOME/.zshrc" ]
then
    mv $HOME/.zshrc $HOME/.zshrc.bak
fi
ln -s $HOME/.dotfiles/dot-zsh-theme/.zshrc $HOME/.zshrc

# Symlink for powerlevel10k
if [ -f "$HOME/.p10k.zsh" ]
then
    mv $HOME/.p10k.zsh $HOME/.p10k.zsh.bak
fi
ln -s $HOME/.dotfiles/dot-zsh-theme/.p10k.zsh $HOME/.p10k.zsh

# Symlink for configs
rm -f $HOME/.config/niri/config.kdl
rm -f $HOME/.config/foot/foot.ini
rm -f $HOME/.config/waybar/config.jsonc
rm -f $HOME/.config/waybar/.style.css
cp -rs $HOME/.dotfiles/.config/* $HOME/.config/

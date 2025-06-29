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
if [ -f "$HOME/.config/niri/config.kdl" ]
then
    mv $HOME/.config/niri/config.kdl $HOME/.config/niri/config.kdl.bak
fi
if [ -f "$HOME/.config/foot/foot.ini" ]
then
    mv $HOME/.config/foot/foot.ini $HOME/.config/foot/foot.ini.bak
fi
if [ -f "$HOME/.config/waybar/config.jsonc" ]
then
    mv $HOME/.config/waybar/config.jsonc $HOME/.config/waybar/config.jsonc.bak
fi
if [ -f "$HOME/.config/waybar/style.css" ]
then
    mv $HOME/.config/waybar/style.css $HOME/.config/waybar/style.css.bak
fi
cp -rs $HOME/.dotfiles/.config/* $HOME/.config/

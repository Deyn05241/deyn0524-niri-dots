#!/bin/bash

###############################################################################################
# Script to setup Deyn0524's dotfiles for Niri, a scrollable tiling window manager for Wayland#
###############################################################################################

# Check if needed programs are already installed, if not, installs it
echo "-----Installing necessary programs-----"
echo ""

echo "---Installing git---"
echo ""
if ! command -v git > /dev/null 2>&1
then
    echo "---git could not be found, installing...---"
    sudo pacman -S git
    echo "---git installed!---"
else
    echo "---git already installed!---"
fi
echo ""

echo "---Installing yay---"
echo ""
if ! command -v yay > /dev/null 2>&1
then
    echo "---yay could not be found, installing...---"
    cd $HOME/.cache
    mkdir deyn0524-niri-dots
    cd deyn0524-niri-dots
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
    cd $HOME/.cache
    rm -rf deyn0524-niri-dots
else
    echo "---yay already installed!---"
fi
echo ""

echo "---Updating Arch packages---"
echo ""
yay
echo ""

echo "---Installing zsh---"
echo ""
if ! command -v zsh > /dev/null 2>&1
then
    echo "---zsh could not be found, installing...---"
    sudo pacman -S zsh
else
    echo "---zsh already installed!---"
fi
echo ""

echo "---Setting zsh as the default shell---"
echo "$SHELL"
if ! [ "$SHELL" == "/usr/bin/zsh"  ]
then
    chsh -s /usr/bin/zsh
    "---zsh set as the default shell!---"
else
    echo "---zsh already set as the default shell!---"
fi
echo ""

# Theming ZSH
echo "-----Theming zsh-----"
echo ""

echo "---Installing zinit"
echo ""

if ! pacman -Qs zinit > /dev/null 2&>1
then
    yay -S zinit --answerclean none --answerdiff none --noconfirm
else
    echo "---zinit already installed!---"
fi

echo "---Downloading everforest-dark zsh theme---"
cd $HOME/.dotfiles/dot-zsh-theme
wget -O everforest-dark.zsh https://raw.githubusercontent.com/sainnhe/dotfiles/refs/heads/master/.zsh-theme/everforest-dark.zsh 
echo "-----Done downloading!-----"
echo ""

# Runs mklink.sh to automatically create symlinks
cd $HOME/.dotfiles
echo -----Creating Symlinks for configuration files-----
echo Running mklinks.sh
./mklinks.sh
echo -----Done creating symlinks!-----



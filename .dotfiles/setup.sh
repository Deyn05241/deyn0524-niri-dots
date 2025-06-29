#!/bin/bash

################################################################################################
# Script to setup Deyn0524's dotfiles for Niri, a scrollable tiling window manager for Wayland #
################################################################################################

# Create cache folder to store temporary files
echo "-----Creating cache folder for temporary files-----"
echo ""
mkdir -p $HOME/.cache/deyn0524-niri-dots/
echo "---Cache folder created!---"
echo ""

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
    cd $HOME/.cache/deyn0524-niri-dots
    git clone https://aur.archlinux.org/yay.git
    cd yay
    makepkg -si
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

echo "---Installing zinit---"
echo ""

if ! pacman -Qs zinit > /dev/null 2>&1
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

# Theming GTK, Icons and Cursors
echo "-----Theming GTK, Icons and Cursors-----"
echo ""

echo "---Theming GTK---"
echo ""
echo "---Cloning repository---"
echo ""
cd $HOME/.cache/deyn0524-niri-dots
git clone https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme
echo "---Installing prerequisites---"
echo ""
if ! pacman -Qs gtk-engine-murrine > /dev/null 2>&1
then
    sudo pacman -S gtk-engine-murrine --noconfirm
else
    echo "---Prerequisites already installed!---"
fi
echo ""
echo "---Installing GTK theme---"
echo ""
$HOME/.cache/deyn0524-niri-dots/Everforest-GTK-Theme/themes/install.sh -l 
gsettings set org.gnome.desktop.interface gtk-theme 'Everforest-Dark'
echo "---GTK theme installed!---"
echo ""
echo "---Fixing Flatpak theming---"
echo ""
echo "---Installing prerequisites---"
echo ""
if ! pacman -Qe flatpak > /dev/null 2>&1
then
    sudo pacman -S flatpak ostree appstream-glib --noconfirm
else
    echo "---Prerequisites already installed!---"
fi
echo ""
echo "---Cloning repository---"
echo ""
git clone https://github.com/refi64/stylepak
cd stylepak
./stylepak install-user Everforest-Dark
echo "---Flatpak theming fixed!---"
echo ""

echo "---Theming Icons---"
echo ""
mkdir -p $HOME/.icons/
mv $HOME/.cache/deyn0524-niri-dots/Everforest-GTK-Theme/icons/Everforest-Dark $HOME/.icons/
gsettings set org.gnome.desktop.interface icon-theme 'Everforest-Dark'
echo "---Icons themed!---"
echo ""

echo "---Theming Cursors---"
echo ""
echo "---Downloading Cursors---"
echo ""
wget -cO- https://github.com/talwat/everforest-cursors/releases/latest/download/everforest-cursors-variants.tar.bz2 | tar xfj - -C ~/.icons
gsettings set org.gnome.desktop.interface cursor-theme everforest-cursors-light
gsettings set org.gnome.desktop.interface cursor-size 32
echo "---Cursors themed!---"
echo ""

# Runs mklink.sh to automatically create symlinks
cd $HOME/.dotfiles
echo "-----Creating Symlinks for configuration files-----"
echo ""
./mklinks.sh
echo "-----Done creating symlinks!-----"

echo "-----SCRIPT COMPLETE!-----"
echo "Reboot and select Niri in GDM to enjoy the dotfiles."


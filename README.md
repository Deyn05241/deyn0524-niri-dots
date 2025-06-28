# WARNING!
These dotfiles are in progress! I am still in the middle of configuring Niri and writing the scripts. This warning will be omitted once the dotfiles are deemed complete.

# Introduction:
This repository contains Deyn0524's custom dotfiles for [Niri](https://github.com/YaLTeR/niri), a scrollable tiling window manager for Wayland. It also contains a script **WRITTEN ONLY FOR ARCHLINUX AND DERIVATIVES** to automatically setup the needed programs, create symbolic links to the configuration files as well as download themes.

# Preview:
![[preview.png]]
*CachyOS Linux *
1. **Color Scheme** - [Everforest Dark Hard](https://github.com/sainnhe/everforest)
2. **Window Manager - **
3. **Terminal** - [Foot](https://codeberg.org/dnkl/foot) themed with [Everforest Dark Hard for Foot](https://gist.github.com/jakesco/c9b11f362f4ae0251ba2ca99a4e1e005)
4. **Shell** - ZSH themed with [Everforest Dark theme](https://github.com/sainnhe/dotfiles/tree/master/.zsh-theme)
5. **GTK Theme** - [Everforest Dark GTK Theme](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme)
6. **Icon Theme** - [Everforest Dark Icon Theme](https://github.com/Fausto-Korpsvart/Everforest-GTK-Theme)
7. **Cursor Theme** - [Everforest Light Cursors](https://github.com/talwat/everforest-cursors)

# Usage:
```
git clone https://github.com/Deyn05241/deyn0524-niri-dots
mv deyn0524-niri-dots/.dotfiles ~/
```
## Automatic:
```
~/.dotfiles/setup.sh
```

> [!WARNING]
> 1. This script is incomplete! **Please use the manual method** for now.
> 2. This script is written for Arch Linux and **ONLY works on Arch Linux** and its derivatives. If you're on another distro, use the manual method until your distro is supported.
## Manual:
### STEP 1 - Install Programs:
1. Niri
2. GDM
3. Fuzzel
4. Mako
5. Foot
6. Waybar
7. ZSH
8. zinit
9. (OPTIONAL for **Screensharing**) xdg-desktop-portal-gtk, xdg-desktop-portal-gnome
10. (OPTIONAL for **Wallpaper**) swaybg
11. (OPTIONAL for **Screen locking**) swayidle, swaylock
12. (OPTIONAL for **X11 apps**) xwayland-xsatellite
### STEP 2 - Setup configuration files

# Roadmap:
- [x] ZSH theming
- [ ] Change fonts
- [ ] Consistent theme across all apps and UI elements
	- [ ] Waybar theming
	- [ ] Foot theming
	- [ ] Fuzzel theming
	- [ ] Niri theming
	- [ ] Notification daemon theming
	- [ ] Firefox / Zen browser theming
- [ ] Automatic wallpaper selection
- [ ] Setup script for Arch
- [ ] Setup script for other distros (e.g. Debian, Fedora, Void, etc.)
- [ ] Accessories (e.g. audio visualizer, music player, etc.)
- [ ] GUI installer

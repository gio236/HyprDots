#!/bin/bash

echo "i will install various packages for the envirronment"

# audio things
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber alsa-utils pavucontrol
systemctl --user enable --now pipewire wireplumber pipewire-pulse

# base things for the hyprland envirronment
sudo pacman -S hyprland fuzzel alacritty firefox dolphin

# yay
if command -v yay >/dev/null 2>&1; then
  echo "no need to install yay"
fi
tmpdir=$(mktemp -d)
sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay-bin.git "$tmpdir/yay-bin"
cd "$tmpdir/yay-bin" || exit 1
makepkg -si

# font
sudo pacman -S ttf-jetbrains-mono
yay -S ttf-jetbrains-mono-nerd

# clipboard
sudo pacman -S wl-clipboard

# neovim setup
sudo pacman -S nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# hyprland setup
mkdir ~/.config
cd ~/HyprDots/.config && cp -r . ~/.config/

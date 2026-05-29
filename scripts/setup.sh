#!/bin/bash

echo "i will install various packages for the envirronment | WARNING : before execute the script be sure tath u copy the repository from the home"

# hyprland setup
mkdir ~/.config
cd ~/HyprDots/.config && cp -r . ~/.config/

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

# move in the correct position the directory
cp -rf ~/HyprDots/scripts/ ~/

# waybar
yay -S waybar-git

# zsh shell + oh-my-zsh
sudo pacman -S zsh
chsh -s $(which zsh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "To see the shell changes, you need to reboot"

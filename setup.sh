echo "i will install various packages for the envirronment"

# audio things
sudo pacman -S pipewire pipewire-alsa pipewire-pulse pipewire-jack wireplumber alsa-utils pavucontrol
systemctl --user enable --now pipewire wireplumber pipewire-pulse

# base things for the hyprland envirronment
sudo pacman -S hyprland fuzzel alacritty firefox

# yay
cd
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si

# font
sudo pacman -S ttf-jetbrains-mono

# clipboard
sudo pacman -S wl-clipboard

# neovim setup
sudo pacman -S nvim
git clone https://github.com/LazyVim/starter ~/.config/nvim
rm -rf ~/.config/nvim/.git

# hyprland setup
mkdir ~/.config
cd ~/HyprDots/.config && cp -r . ~/.config/

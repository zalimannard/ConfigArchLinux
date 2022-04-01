#!/bin/bash


# Activate multilib repository
echo "Making multilib available"
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf


# Folder for configurations
mkdir ~/.config


# Full update before installation
echo | sudo pacman -Syu


# Pacman
# Update GPG
echo | sudo pacman-key --init
echo | sudo pacman-key --populate archlinux
echo | sudo pacman-key --refresh-keys
echo | sudo pacman -Sy


# Preparing for installation
echo | pacman -S base-devel git


# File Systems
# NTFS
echo | pacman -S ntfs-3g
# Exfat
echo | pacman -S exfat-utils


# Archives
echo | pacman -S unrar unzip


# AUR-Helpers
# Yay
git clone https://aur.archlinux.org/yay.git
cd yay
echo | makepkg -si
cd ..
rm -rf yay


# Fonts
# Roboto
echo | sudo pacman -S ttf-roboto ttf-roboto-mono ttf-roboto-slab
# JetBrains mono
echo | sudo pacman -S ttf-jetbrains-mono
# JetBrains mono Nerd
git clone https://aur.archlinux.org/nerd-fonts-jetbrains-mono.git
cd nerd-fonts-jetbrains-mono
echo | makepkg -si
cd ..
rm -rf nerd-fonts-jetbrains-mono
# Source code pro
echo | sudo pacman -S adobe-source-code-pro-fonts
# Nerd Source code pro
git clone https://aur.archlinux.org/nerd-fonts-source-code-pro.git
cd nerd-fonts-source-code-pro
echo | makepkg -si
cd ..
rm -rf nerd-fonts-source-code-pro


# AwesomeWM
# X11
echo | pacman -S xorg xorg-init xorg-server
# AwesomeWM
echo | sudo pacman -S awesome


# Picom (fork by Jonaburg)
git clone https://aur.archlinux.org/picom-jonaburg-git.git
cd picom-jonaburg-git
echo | makepkg -si
cd ..
rm -rf picom-jonaburg-git


# Eww
echo | sudo pacman -Rsn rust
echo | sudo pacman -S rustup
git clone https://aur.archlinux.org/eww-git.git
cd eww-git
echo | makepkg -si
cd ..
rm -rf eww-git


# Bluetooth
echo | sudo pacman -S bluez bluez-utils blueman


# Audio
# Pipewire
echo | sudo pacman -S pipewire pipewire-alsa pipewire-pulse gst-plugin-pipewire
# Audio control
echo | sudo pacman -S pamixer
# Media control
echo | sudo pacman -S playerctl


# Video
# NVIDIA proprietary drivers
if [[ `lspci | grep -E "VGA|3D"` == *NVIDIA* ]]; then
	echo | sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-opencl-nvidia opencl-nvidia libxnvctrl
	sudo mkinitcpio -P
	sudo cp etc/mkinitcpio.conf /etc/mkinitcpio.conf
	sudo mkinitcpio -P
fi
# Brightness control
echo | sudo pacman -S brightnessctl


# Themes
echo | pacman oxygen oxygen-icons breeze


# Dolphin - File Manager
echo | sudo pacman -S dolphin


# Browsers
# Tor-browser
git clone https://aur.archlinux.org/tor-browser.git
cd tor-browser
echo | makepkg -si
cd ..
rm -rf tor-browser
# Yandex-Browser
    # Dependencies for gconf
echo | sudo pacman -S intltool gtk-doc gobject-introspection gnome-common
    # Gconf
git clone https://aur.archlinux.org/gconf.git
cd gconf
echo | makepkg -si
cd ..
rm -rf gconf
    # Other dependency
echo | sudo pacman -S gtk2 harfbuzz-icu chromium
    # Browser
git clone https://aur.archlinux.org/yandex-browser-beta.git
cd yandex-browser-beta
echo | makepkg -si
cd ..
rm -rf yandex-browser-beta
    # Fixing video playback for Yandex Browser
    # Dependencies
echo | sudo pacman -S wget jq
sudo /opt/yandex/browser-beta/update-ffmpeg


# Torrent
echo | sudo pacman -S transmission-qt


# Kate
echo | sudo pacman -S kate


# Neovim
echo | sudo pacman -S neovim
# Export config from other repository


# Terminal Emulator
# Kitty
echo | sudo pacman -S kitty


# Players
## Vlc
echo | sudo pacman -S vlc
## Mpv
echo | sudo pacman -S mpv


# Krita - Image Editor
echo | sudo pacman -S krita


# Gwenview
echo | sudo pacman -S gwenview


# Flameshot
echo | sudo pacman -S flameshot


# Inkscape
echo | sudo pacman -S inkscape


# OBS
echo | sudo pacman -S obs-studio


# Telegram
echo | sudo pacman -S telegram-desktop


# SimpleScreenRecorder
echo | sudo pacman -S simplescreenrecorder


# Okular
echo | sudo pacman -S okular


# Ark
echo | sudo pacman -S ark


# Discord
echo | sudo pacman -S discord




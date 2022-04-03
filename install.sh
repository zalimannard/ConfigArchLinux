#!/bin/bash


# Activate multilib repository
echo "Making multilib available"
echo "[multilib]" | sudo tee --append /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" | sudo tee --append /etc/pacman.conf


# Folders
#---- Folder for configurations
mkdir ~/.config
#---- User's folder
mkdir ~/Music
mkdir ~/Picture
mkdir ~/Picture
mkdir ~/Video
mkdir ~/Downloads
#-------- Wallpaper
cp -r ./home/user/Picture/Wallpapers ~/Picture


# Full update before installation
sudo pacman -Syu --noconfirm


# Pacman
# Update GPG
sudo pacman-key --init
sudo pacman-key --populate archlinux
sudo pacman-key --refresh-keys
sudo pacman -Sy


# Preparing for installation
sudo pacman -S base-devel git --noconfirm


# File Systems
# NTFS
sudo pacman -S ntfs-3g --noconfirm
# ExFAT
sudo pacman -S exfat-utils --noconfirm


# Archives
sudo pacman -S unrar unzip --noconfirm


# AUR-Helpers
# Yay
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si --noconfirm
cd ..
rm -rf yay


# Fonts
# Roboto
sudo pacman -S ttf-roboto ttf-roboto-mono ttf-roboto-slab --noconfirm
# JetBrains mono
sudo pacman -S ttf-jetbrains-mono --noconfirm
# JetBrains mono Nerd
git clone https://aur.archlinux.org/nerd-fonts-jetbrains-mono.git
cd nerd-fonts-jetbrains-mono
makepkg -si --noconfirm
cd ..
rm -rf nerd-fonts-jetbrains-mono
# Source code pro
sudo pacman -S adobe-source-code-pro-fonts --noconfirm
# Nerd Source code pro
git clone https://aur.archlinux.org/nerd-fonts-source-code-pro.git
cd nerd-fonts-source-code-pro
makepkg -si --noconfirm
cd ..
rm -rf nerd-fonts-source-code-pro


# AwesomeWM
# X11
sudo pacman -S xorg xorg-xinit xorg-server --noconfirm
#touch ~/.xinitrc
#echo "#!/bin/bash" > ~/.xinitrc
#echo "exec awesome" >> ~/.xinitrc
# Sddm
sudo pacman -S sddm --noconfirm
systemctl enable sddm
# AwesomeWM
sudo sudo pacman -S awesome --noconfirm
cp -r ./home/user/.config/awesome ~/.config/


# Picom (fork by Jonaburg)
git clone https://aur.archlinux.org/picom-jonaburg-git.git
cd picom-jonaburg-git
makepkg -si --noconfirm
cd ..
rm -rf picom-jonaburg-git
# Config
cp ./home/user/.config/picom ~/.config/


# Bluetooth
sudo pacman -S bluez bluez-utils blueman --noconfirm
systemctl enable bluetooth.service


# Audio
# Pipewire
sudo pacman -S pipewire pipewire-alsa pipewire-pulse gst-plugin-pipewire --noconfirm
# Audio control
sudo pacman -S pamixer --noconfirm
# Media control
sudo pacman -S playerctl --noconfirm


# Video
# NVIDIA proprietary drivers
#if [[ `lspci | grep -E "VGA|3D"` == *NVIDIA* ]]; then
#	sudo pacman -S nvidia-dkms nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader lib32-opencl-nvidia opencl-nvidia libxnvctrl --noconfirm
#	sudo mkinitcpio -P
#	sudo cp etc/mkinitcpio.conf /etc/mkinitcpio.conf
#	sudo mkinitcpio -P
#fi
# Brightness control
sudo pacman -S brightnessctl --noconfirm


# Themes
sudo pacman -S oxygen oxygen-icons breeze --noconfirm


# Dolphin - File Manager
sudo pacman -S dolphin --noconfirm


# Browsers
# Tor-browser
git clone https://aur.archlinux.org/tor-browser.git
cd tor-browser
makepkg -si --noconfirm
cd ..
rm -rf tor-browser
# Yandex-Browser
# https://aur.archlinux.org/yandex-browser.git
    # Dependencies for gconf
#sudo pacman -S intltool gtk-doc gobject-introspection gnome-common --noconfirm
    # Gconf
#git clone https://aur.archlinux.org/gconf.git
#cd gconf
#makepkg -si --noconfirm
#cd ..
#rm -rf gconf
    # Other dependency
#sudo pacman -S gtk2 harfbuzz-icu chromium --noconfirm
    # Browser
#git clone https://aur.archlinux.org/yandex-browser-beta.git
#cd yandex-browser-beta
#makepkg -si --noconfirm
#cd ..
#rm -rf yandex-browser-beta
    # Fixing video playback for Yandex Browser
    # Dependencies
#sudo pacman -S wget jq --noconfirm
#sudo /opt/yandex/browser-beta/update-ffmpeg


# Torrent
sudo pacman -S transmission-qt --noconfirm


# Kate
sudo pacman -S kate --noconfirm


# Neovim
sudo pacman -S neovim --noconfirm
# Export config from other repository


# Terminal
#---- Terminal Emulator
#-------- Kitty
sudo pacman -S kitty --noconfirm
cp -r ./home/user/.config/kitty ~/.config/
#---- Shells
#-------- Zsh
sudo pacman -S zsh --noconfirm
sudo pacman -S zsh-completions --noconfirm
#------------ Oh My Zsh
#git clone https://aur.archlinux.org/oh-my-zsh-git.git
#cd oh-my-zsh-git
#makepkg -si --noconfirm
#cd ..
#rm -rf oh-my-zsh-git
#------------ Zsh Syntax Highlighting
#sudo pacman -S zsh-syntax-highlighting --noconfirm
#------------ Powerlevel10k
#sudo pacman -S zsh-theme-powerlevel10k --noconfirm
#echo "source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme" >>! ~/.zshrc
#------------ Configs
cp ./home/user/.zshrc ~/
cp ./home/user/.p10k.zsh ~/
#-------- Change default shell
chsh -s /bin/zsh


# Players
## Vlc
sudo pacman -S vlc --noconfirm
## Mpv
sudo pacman -S mpv --noconfirm


# Krita - Image Editor
sudo pacman -S krita --noconfirm


# Gwenview
sudo pacman -S gwenview --noconfirm


# Flameshot
sudo pacman -S flameshot --noconfirm


# Inkscape
sudo pacman -S inkscape --noconfirm


# OBS
sudo pacman -S obs-studio --noconfirm


# Telegram
sudo pacman -S telegram-desktop --noconfirm


# SimpleScreenRecorder
sudo pacman -S simplescreenrecorder --noconfirm


# Okular
sudo pacman -S okular --noconfirm


# Ark
sudo pacman -S ark --noconfirm


# Discord
sudo pacman -S discord --noconfirm


# Terminal utils
sudo pacman -S tree --noconfirm

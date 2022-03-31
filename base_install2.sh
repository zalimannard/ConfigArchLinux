#!/bin/bash

read -p "Enter the host (computer) name" hostname
read -p "Enter the user name" username

echo "Setting hostname"
echo $hostname > /etc/hostname

echo "Setting localtime"
ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
hwclock --systohc

echo "Setting locale"
echo en_US.UTF-8 UTF-8 > /etc/locale.gen
locale-gen

echo "Setting system language"
echo LANG=en_US.UTF-8 > /etc/locale.conf

echo "Running mkinitcpio"
mkinitcpio -P

echo "Creating root password"
passwd

echo "Adding user"
useradd -m -g users -G wheel -s /bin/bash $username

echo "Setting user password"
passwd $username

echo "Setting sudo"
echo "%wheel ALL=(ALL) ALL" >> /etc/sudoers

echo "Making multilib available"
echo "[multilib]" >> /etc/pacman.conf
echo "Include = /etc/pacman.d/mirrorlist" >> /etc/pacman.conf
pacman -Syu

echo "Setting internet autostart"
systemctl enable NetworkManager

echo "Installing bootloader"
refind-install

exit

#!/bin/bash

read -p "Enter the host (computer) name: " hostname
read -p "Enter the user name: " username

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

echo "Setting internet autostart"
systemctl enable NetworkManager

echo "Installing bootloader"
refind-install
echo "Fixing Refind"
part=$(cat /boot/refind_linux.conf | sed -n 3p | cut -d "=" -f 2 | rev | cut -c 2- | rev)
uuid=$(sudo blkid $part | cut -d '=' -f 2 | cut -d ' ' -f 1 | cut -c 2- | rev | cut -c 2- | rev)

echo "\"Boot with standard options\"  \"ro root=UUID=$uuid\"" > /boot/refind_linux.conf
echo "\"Boot to single-user mode\"    \"ro root=UUID=$uuid single\"" >> /boot/refind_linux.conf
echo "\"Boot with minimal options\"   \"ro root=$part\"" >> /boot/refind_linux.conf

exit

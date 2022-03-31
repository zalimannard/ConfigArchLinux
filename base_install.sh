#!/bin/bash

echo "Clock synchronization"
timedatectl set-ntp true

echo "Disk partioning"
echo "Format and mount disks?"
read -p "Y/n" format
if [ $format == "Y" ] || [$format == "y"] || [$format == ""]; then

    # TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO
    
    echo "Disk Formatting"
    mkfs.btrfs -f /dev/nvme0n1p7
    mkfs.fat -F32 /dev/nvme0n1p5
    
    echo "Disk Mounting"
    mount /dev/nvme0n1p7 /mnt
    mkdir /mnt/boot
    mkdir /mnt/boot/efi
    mount /dev/nvme0n1p5 /mnt/boot/efi
fi

echo "Installing basic packages"
pacstrap /mnt base linux-zen linux-zen-headers linux-firmware networkmanager git

echo "Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "Changing root"
arch-chroot /mnt

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

echo "Creating root password"
passwd

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

echo "Installation is complete. You can restart the computer and run install.sh for full customization."
exit

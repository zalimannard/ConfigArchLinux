#!/bin/bash

fdisk -l
echo *****************************************************************
echo * From these disks, you need to select root and efi partitions. *
echo * If the disks are not partitioned, do it with cfdisk           *
echo *****************************************************************

echo "Clock synchronization"
timedatectl set-ntp true

echo "Disk partioning"
read -p "Enter the root partion" root_path
read -p "Enter the efi partion" efi_path
echo "Format and mount disks?"
read -p "y/n: " format
if [[ $format == "y" ]]; then
    
    echo "Disk Formatting"
    yes | mkfs.ext4 $root_path
    mkfs.fat -F32 $efi_path
    
    echo "Disk Mounting"
    mount $root_path /mnt
    mkdir -p /mnt/boot/efi
    mount $efi_path /mnt/boot/efi
fi

echo "Installing basic packages"
pacstrap /mnt base linux-zen linux-zen-headers linux-firmware networkmanager refind git sudo

echo "Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "Changing root"
cp -r ../ConfigArchLinux /mnt/home
arch-chroot /mnt bash /home/ConfigArchLinux/base_install2.sh
em -r /mnt/home/ConfigArchLinux
umount -R /mnt

echo "Installation is complete. You can restart the computer and run install.sh for full customization."


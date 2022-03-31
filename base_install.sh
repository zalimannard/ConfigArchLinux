#!/bin/bash

echo "Clock synchronization"
timedatectl set-ntp true

echo "Disk partioning"
echo "Format and mount disks?"
read -p "Y/n" format
if [ $format == "Y" ] || [$format == "y"] || [$format == ""]; then

    # TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO TODO
    
    echo "Disk Formatting"
    yes | mkfs.ext4 /dev/nvme0n1p7
    mkfs.fat -F32 /dev/nvme0n1p5
    
    echo "Disk Mounting"
    mount /dev/nvme0n1p7 /mnt
    mkdir -p /mnt/boot/efi
    mount /dev/nvme0n1p5 /mnt/boot/efi
fi

echo "Installing basic packages"
pacstrap /mnt base linux-zen linux-zen-headers linux-firmware networkmanager refind git

echo "Generating fstab"
genfstab -U /mnt >> /mnt/etc/fstab

echo "Changing root"
mv base_install2.sh /mnt/home
arch-chroot /mnt bash /home/base_install2.sh
rm /mnt/home/base_install2.sh

echo "Installation is complete. You can restart the computer and run install.sh for full customization."


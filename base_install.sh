mkfs.btrfs -f /dev/nvme0n1p7
mount /dev/nvme0n1p7 /mnt
mkdir /mnt/boot
mkdir /mnt/boot/efi
mount /dev/nvme0n1p5 /mnt/boot/efi
pacstrap /mnt base linux-zen linux-zen-headers linux-firmware git
genfstab -U /mnt >> /mnt/etc/fstab
echo RUN_IT ln -sf /usr/share/zoneinfo/Europe/Moscow /etc/localtime
echo RUN_IT hwclock --systohc
echo RUN_IT echo en_US.UTF-8 UTF-8 >> /etc/locale.gen
echo RUN_IT locale-gen
echo RUN_IT LANG=en_US.UTF-8 echo > /etc/locale.conf
echo RUN_IT echo zalimannard > /etc/hostname
echo RUN_IT passwd
arch-chroot /mnt

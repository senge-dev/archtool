#!/bin/bash
mv /etc/locale.gen /etc/localr.gen.bak
touch /etc/locale.gen
cat >> /etc/locale.gen << EOF
en_US.UTF-8 UTF-8
zh_CN.UTF-8 UTF-8
locale-gen
EOF
cat >> /etc/locale.conf << EOF
LANG=en_US.UTF-8 >> /etc/locale.conf
EOF
ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc --utc
pacman -S dosfstools grub efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/EFI --recheck
grub-mkconfig -o /boot/grub/grub.cfg
echo "Please input root password. "
passwd
useradd -m -g users -s /bin/bash arch
echo "Please inout user password. "
passwd arch
cat >> /etc/sudoers << EOF
arch ALL=(ALL) ALL
Defaults env_reset,pwfeedback
EOF
pacman -S dhcpcd dhcp netctl iw wpa_supplicant dialog
systemctl enable dhcpcd
pacman -S xf86-video-vesa

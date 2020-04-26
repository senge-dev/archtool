#!/bin/bash
pacstrap -i /mnt base base-devel linux linux-firmware
genfstab -U /mnt >> /mnt/etc/fstab
cat /etc/fstab
arch-chroot /mnt /bin/bash

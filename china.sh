#!/bin/bash
# 同步时间
timedatectl set-ntp true
# 切换镜像为清华源
mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.bak
if [ $? != 0 ]; then
	echo "Failed to backup the mirror! Please try again. "
	exit
else
	echo "Backup the mirror successfully! "
fi
touch /etc/pacman.d/mirrorlist
if [ $? != 0 ]; then
	echo "Failed to make mirrorlist! Please try again. "
	exit
else
	echo "Make mirrorlist successfully! "
fi
cat >> /etc/pacman.d/mirrorlist << EOF
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
EOF
if [ $? != 0 ]; then
	echo "Failed to write the mirrorlist! Please try again."
	exit
else
	echo "Write mirrorlist successfully!"
fi
# 添加archlinuxcn源
cat >> /etc/pacman.conf << EOF
[archlinuxcn]
SigLevel = Optional TrustAll
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch
EOF
lsblk

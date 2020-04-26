#!/bin/bash
pacman -S xorg gnome gnome-tweaks alacarte
systemctl enable gdm
systemctl enable NetworkManager

#!/bin/bash
pacman -S plasma dolphin konsole kde-applications plasma-nm kde-connect
systemctl enable sddm
systemctl enable NetworkManager

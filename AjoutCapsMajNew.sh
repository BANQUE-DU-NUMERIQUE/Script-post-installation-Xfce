#!/bin/bash

# Paramètres
# Appliquer les changements à chaque création d'un nouvel utilisateur
# (0 pour désactiver)
APPLY_TO_NEW_USERS=1

# Custom layout pour Shit Lock mswindows style
echo -e "\033[0;94m> Changement du comportement de la touche SHIFT-LOCK: Style ms-windows\033[0m"
sudo cp /usr/share/X11/xkb/symbols/fr /usr/share/X11/xkb/symbols/fr.bak
sudo rm /usr/share/X11/xkb/symbols/fr
sudo cp ./keybord-fr-mswin-capslock/fr-new /usr/share/X11/xkb/symbols/fr
sudo rm /etc/default/keyboard
sudo cp ./keybord-fr-mswin-capslock/keyboard-new /etc/default
setxkbmap fr -variant oss


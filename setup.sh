#!/bin/bash

# Paramètres
# Appliquer les changements à chaque création d'un nouvel utilisateur
# (0 pour désactiver)
APPLY_TO_NEW_USERS=1
# Nom du fichier à utiliser pour le fond d'écran dans ./wallpapers
WALLPAPER_NAME="desktop.png"


# Mise à jour des paquets
#echo -e "\033[0;94m> Mise à jour des paquets\033[0m"
#sudo apt update && sudo apt upgrade -y

# Installation de paquets additionnels
#Installation d'un logiciel de capture via webcam (Cheese))
sudo dpkg -i apps/cheese/*.deb
#echo -e "\033[0;94m> Installation de paquets additionnels\033[0m"
#packages=("cheese")
#for package in "${packages[@]}"; do
#    sudo apt install $package -y
#done

# Copie des dossiers vers /usr/share/banque du numérique
echo -e "\033[0;94m> Copie des dossiers vers /usr/share/banque du numérique\033[0m"
directories=("desktop" "icons" "wallpapers")
for dir in "${directories[@]}"; do
    sudo mkdir -p /usr/share/banque\ du\ numérique/$dir
    echo -e "Copie de ./$dir..."
    sudo cp ./$dir/* /usr/share/banque\ du\ numérique/$dir/
done
sudo chmod -R a+r /usr/share/banque\ du\ numérique

# Paramètres xfconf
# Voir configuration xdg par .xml pour définir les paramètres par défaut pour les nouveaux utilisateurs
echo -e "\033[0;94m> Application des paramètres xfconf\033[0m"
if [[ "$APPLY_TO_NEW_USERS" -eq 1 ]]; then
    sudo mkdir -p /etc/xdg/xdg-default/xfce4/xfconf/xfce-perchannel-xml
    for file in "./xfce-perchannel-xml"/*.xml; do
        echo -e "$file"
        sudo rm /etc/xdg/xdg-default/xfce4/xfconf/xfce-perchannel-xml/$(basename "$file")
        sudo cp -r "$file" /etc/xdg/xdg-default/xfce4/xfconf/xfce-perchannel-xml
    done
fi
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-home -s true
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-removable -s true
xfconf-query -c xfce4-desktop -p /desktop-icons/file-icons/show-trash -s true
MONITOR_PATHS=$(xfconf-query -c xfce4-desktop -l | grep last-image)
if [ -n "$MONITOR_PATHS" ]; then
    for MONITOR_PATH in $MONITOR_PATHS; do
        xfconf-query -c xfce4-desktop -p "$MONITOR_PATH" -s "/usr/share/banque du numérique/wallpapers/$WALLPAPER_NAME"
        echo "Fonds d'écran changé sur $MONITOR_PATH"
    done
else
    echo "Echec du changement de fond d'écran"
fi

# Création des raccourcis de bureau
echo -e "\033[0;94m> Création des raccourcis de bureau\033[0m"
if [[ "$APPLY_TO_NEW_USERS" -eq 1 ]]; then
    sudo mkdir -p /etc/skel/Bureau
    for file in /usr/share/banque\ du\ numérique/desktop/*.desktop; do
        sudo cp "$file" /etc/skel/Bureau
        sudo chmod +x "/etc/skel/Bureau/$(basename "$file")"
    done
    sudo cp ./profile.d/banque_du_numerique.sh /etc/profile.d
fi
for file in "/usr/share/banque du numérique/desktop"/*.desktop; do
    if [ -f "$file" ]; then
        cp "$file" $HOME/Bureau
        chmod +x $HOME/Bureau/$(basename "$file")
        gio set -t string $HOME/Bureau/$(basename "$file") metadata::xfce-exe-checksum $(sha256sum $HOME/Bureau/$(basename "$file") | awk '{print $1}')
        if [[ "$APPLY_TO_NEW_USERS" -eq 1 ]]; then
            sudo cp "$file" /etc/skel/Bureau
            sudo chmod +x /etc/skel/Bureau/$(basename "$file")
        fi
    fi
done

# Custom layout pour Shit Lock mswindows style
echo -e "\033[0;94m> Changement du comportement de la touche SHIFT-LOCK: Style ms-windows\033[0m"
sudo cp ./keybord-fr-mswin-capslock/fr-custom /usr/share/X11/xkb/symbols
sudo rm /etc/default/keyboard
sudo cp ./keybord-fr-mswin-capslock/keyboard /etc/default

Desktop Entry]
Version=1.0
Name=Banque du Numérique
Comment=Lutte contre la fracture numérique et l'illectronisme
Exec=xdg-open https://www.banquedunumerique.org/
Icon=/usr/share/banque du numérique/icons/ABN_128_128.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;
Desktop Entry]
Version=1.0
Name=Google
Comment=Google Search
Exec=xdg-open https://www.google.com/
Icon=/usr/share/banque du numérique/icons/google_128_128.png
Terminal=false
Type=Application
Categories=Network;WebBrowser;


#!/bin/bash

#On demande le numéro d'inventaire
echo -n "Numero Inventaire?: "
read ninventaire

#On change la variable $hostname du système
hostnamectl set-hostname $ninventaire

#On restitue le numéro d'inventaire saisi pour inciter à un contrôle.
echo $hostname

#Arrêt du système
#systemctl poweroff
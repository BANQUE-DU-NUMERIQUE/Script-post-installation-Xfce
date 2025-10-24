# Script Post-Installation Xfce

[![License: GPL v3](https://img.shields.io/badge/License-GPLv3-blue.svg)](LICENSE)
[![Platform: Linux Mint Xfce](https://img.shields.io/badge/platform-Linux%20Mint%20Xfce-green)](https://linuxmint.com/)
[![Status: Stable](https://img.shields.io/badge/status-stable-success)](#)
[![Made with Bash](https://img.shields.io/badge/made%20with-Bash-1f425f.svg)](#)

Projet développé par [BANQUE-DU-NUMERIQUE](https://github.com/BANQUE-DU-NUMERIQUE).

Script d’automatisation de la configuration post-installation pour **Linux Mint Xfce**.

---

## Sommaire

- [Présentation](#présentation)
- [Fonctionnalités](#fonctionnalités)
- [Prérequis](#prérequis)
- [Installation et utilisation](#installation-et-utilisation)
- [Structure du projet](#structure-du-projet)
- [Personnalisation](#personnalisation)
- [Contribution](#contribution)
- [Licence](#licence)
- [Remerciements](#remerciements)

---

## Présentation

Le **Script post-installation Xfce** automatise la configuration initiale d’un poste sous **Linux Mint + Xfce**.  
Il applique une série de réglages et d’installations pour fournir un environnement utilisateur cohérent et prêt à l’emploi.

Objectif : simplifier et standardiser la mise en service d’ordinateurs reconditionnés.

---

## Fonctionnalités

- Fonctionne **hors ligne** (tous les fichiers nécessaires sont inclus)
- Installation de **raccourcis sur le bureau**
- Affichage des **disques sur le bureau**
- **Changement du fond d’écran**
- **Réaffectation de la touche Majuscule/CapsLock** pour accéder rapidement aux chiffres
- Installation de **Cheese** (outil photo/vidéo via webcam)
- Outils supplémentaires :
  - `getKeyPressed` : test du clavier
  - `sysinfo` : collecte d’informations matérielles

---

## Prérequis

- Distribution **Linux Mint Xfce** (ou environnement Xfce équivalent)
- Mot de passe de la session éxecutant le script
- Exécution recommandée juste après l’installation du système

---

## Personnalisation

Le script est conçu pour être modulaire et facilement adaptable selon les besoins de l’utilisateur ou de l’organisation.

### Modifier les fonds d’écran
Les images utilisées comme fond d’écran se trouvent dans le dossier :

wallpapers/

Remplace ou ajoute tes propres fichiers `.jpg` ou `.png` dans ce répertoire.  
Tu peux également modifier le script principal pour définir un autre fond d’écran par défaut.

### Adapter les icônes
Les icônes placées sur le bureau ou dans le menu peuvent être personnalisées dans :

icons/

Tu peux remplacer les fichiers existants ou ajouter de nouveaux éléments pour refléter ta charte graphique ou tes applications favorites.

### Modifier les raccourcis du bureau
Le script suivant gère la création des raccourcis :

ajout_raccourci.sh

Édite-le pour :
- Ajouter ou retirer des raccourcis
- Modifier leurs cibles (`Exec=`)
- Adapter leurs icônes et descriptions

### Configuration du clavier
Le dossier suivant contient la configuration du clavier adaptée à la disposition « Français – Windows » avec la touche Maj/CapsLock réaffectée :

keyboard-fr-mswin-capslock/

Tu peux y modifier les fichiers XML pour adapter la disposition selon tes besoins (autre langue, autre comportement de touches, etc.).

### Autres personnalisations possibles
- Modifier le nom d’hôte via `change_hostname.sh`
- Adapter le comportement de session dans `profile.d/`
- Modifier les paramètres Xfce dans `xfce-perchannel-xml/`
- Ajouter ou supprimer des applications dans `apps/`

---

## Contribution

Les contributions sont les bienvenues !

1. **Forke** le dépôt sur GitHub.  
2. **Crée une branche** pour ta modification :
   ```bash
   git checkout -b feature/ma-nouvelle-fonction
3. **Apporte tes changements**, en suivant les bonnes pratiques Bash et en gardant la compatibilité Linux Mint Xfce.
4. **Soumets une Pull Request** avec une description claire de tes ajouts ou correctifs.

Merci d’ajouter des commentaires et d’éviter les dépendances inutiles.

## Licence
Ce projet est distribué sous la licence GPL-3.0
Vous êtes libre de l’utiliser, le modifier et le redistribuer sous les mêmes conditions.

## Remerciements

Merci à toutes les personnes ayant contribué au projet **Script post-installation Xfce**,
et à la communauté **BANQUE-DU-NUMERIQUE** pour sson accompagement dans la démarche d’inclusion et de revalorisation numérique.

Ce script facilite la configuration de postes Linux Mint Xfce,
en simplifiant la mise en service et en promouvant la réutilisation responsable du matériel.

_Simplifer, reconditionner, partager — BANQUE-DU-NUMERIQUE_

#!/bin/bash

sudo dmidecode -t system | grep Serial\ Number
sudo dmidecode -t processor | grep Version
sudo dmidecode -t memory | grep Size
echo "--------------------------------------------------------------------------------"
sudo fdisk -l | grep "Disque\|Disk model"
echo "--------------------------------------------------------------------------------"
sudo lsblk -o NAME,ROTA

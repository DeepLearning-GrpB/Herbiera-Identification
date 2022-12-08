#!/bin/bash

# Étape ~0 --> Installer les requirements
sudo apt-get install wget  # Install "wget"
sudo apt-get install unzip  # Install "unzip"


# Étape ~1 --> Enregistrer le fichier compressé avec le Lien Partagé du Google Drive
echo "\n"
echo "---------------------------------------"
echo "-----  Étape 1 -> Enregistrement  -----"
echo "---------------------------------------"

# Google Drive Lien Partagé: https://drive.google.com/file/d/1NKaDghYPk3NEdQ4ZBVqXjSs1hNacNW6b/view?usp=share_link
FILEID="1NKaDghYPk3NEdQ4ZBVqXjSs1hNacNW6b"  # ID associé au Lien : 1NKaDghYPk3NEdQ4ZBVqXjSs1hNacNW6b
FILENAME="Data/Dataset.zip"  # Chemin où Enregistrer le fichier compressé : Data/Dataset.zip
wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=$FILEID' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=$FILEID" -O $FILENAME && rm -rf /tmp/cookies.txt

echo "----------------------------------------------"
echo "-----  Fichier compressé -> ENREGISTRER  -----"
echo "----------------------------------------------"
echo "\n"


# Étape ~2 --> Extraire le fichier compressé
echo "\n"
echo "--------------------------------------"
echo "-----  Étape 2 -> Décompression  -----"
echo "--------------------------------------"

if [ -d Data/Dataset/ ]
then
   sudo rm -R Data/Dataset
fi
sudo unzip -d Data/ Data/Dataset.zip

echo "-------------------------------------"
echo "-----  Fichier -> DÉCOMPRESSER  -----"
echo "-------------------------------------"
echo "\n"


# Étape ~3 --> Supprimer le fichier compressé
echo "\n"
echo "------------------------------------"
echo "-----  Étape 3 -> SUPPRESSION  -----"
echo "------------------------------------"

sudo rm -R Data/Dataset.zip

echo "--------------------------------------------"
echo "-----  Fichier compressé -> SUPPRIMER  -----"
echo "--------------------------------------------"
echo "\n"


# Étape Finale --> Retourner un message de validation
echo "\n\n"
echo "------------------------------------------"
echo "------------------------------------------"
echo "-----   Jeux de Données DISPONIBLE   -----"
echo "------------------------------------------"
echo "------------------------------------------"
echo "\n\n"
# Auteur: Rohdri FRIMAT
# Date de création: 22/08/2016


#!/bin/bash


#Créez un script qui permet :
#    de créer l'arborescence /rep1/rep2/rep3 à partir de votre dossier personnel
#    de créer un fichier vide nommé test.txt dans le répertoire rep1
#    de déplacer ce fichier dans le répertoire rep3

cd $HOME
mkdir -p rep1/rep2/rep3
touch rep1/test.txt
mv rep1/test.txt rep1/rep2/rep3/



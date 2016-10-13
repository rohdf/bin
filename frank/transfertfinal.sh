#!/bin/bash

# Ce programme bash automatise un transfert de données par serveur FTP.
# auteur : Frank THIBAUT
# date : 23/08/2016


# usage/help
display_usage() {

      echo "Veillez renseigner les arguments suivant : nom du fichier à transférer, le répertoire source, le répertoire cible et l'adresse IP du serveur FTP"
      echo "Pour plus d'aide utilisez -h --help"
}

display_help() {

      echo "........................................................................"
      echo "Ce programme automatise un transfert par serveur FTP"
      echo "                                                                       "
      echo "Il est nécessaire pour cela de renseigner 4 argumnents :"
      echo "Le nom du fichier à transférer"
      echo "Le répertoire source (où se situe notre fichier à transférer)"
      echo "Le répertoire où le transfert doit être effectué"
      echo "L'adresse IP du serveur FTP utilisé pour le transfert)."
      echo "........................................................................"

}

# Si l'utilisateur entre l'option -h ou --help.  

if [[ ( $1 == "--help") ||  $1 == "-h" ]]; then display_help; exit 0; fi

# Si 4 arguments ne sont pas renseignés.

if [  $# -ne 4 ] ; then  display_usage; exit 1; fi 


#Paramètres :

filename="$1"
local_directory="$2"
remote_directory="$3"
hostname="$4"

# Pensez à renseigner le "username" et le "password" selon le serveur FTP.

username="fhangying"
password="pftdebian16"

ftp -n $hostname <<EOF
quote USER $username
quote PASS $password

binary
lcd $local_directory

mkdir $remote_directory
cd $remote_directory

put $filename 
quit
EOF



#!/bin/bash

#Auteur : Rohdri FRIMAT
#Date : 23/08/2016

# Fonction d'aide et d'usage
function usage {
	echo 
	echo "= ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ="
	echo -e "usage : transfert3.sh filename local_directory remote_directory hostname"
	echo -e "Use option -h|--help pour plus d'aide"
	echo "= ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ ="
	echo
	echo "filename        : nom du fichier" 
	echo "local_directory : adresse locale où se trouve le fichier"
	echo "remote_directory: adresse distante où dera télécharger le client" 
	echo "hostname        : IP du serveur"
}

function aide {
	echo "///////////////////////////////////////////////////////////////////////"
	usage; 
	echo "Transfert de fichier par ftp"
	echo "> Serveur utilisé Proftpd <"
	echo
	echo "-----------------------------------"
	echo "OPTIONS"
	echo "   -h|--help HELP: Pour plus d'aide"
	echo
	echo "///////////////////////////////////////////////////////////////////////"
	echo
	exit;
}

# Test sur les paramètres
if [ $# -ne 4 ]
then
	usage
	exit
fi

if [ "$1" = "-h" -o "$1" = "--help" ]
then
	aide
	exit
fi


# Affectation des variables
filename=$1
local_directory=$2
remote_directory=$3
hostname=$4

# Identifiants de connexion
username="nhang"
password="Debian0"

# Connexion du client au serveur et transfert du fichier sélectionné
ftp -nv $hostname <<EOF
quote USER $username
quote PASS $password
binary
lcd $local_directory
cd $remote_directory
put $filename
quit
EOF









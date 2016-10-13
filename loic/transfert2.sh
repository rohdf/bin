#!/bin/bash
#auteur : Loïc Golvan
#date de création 23/08/2016
#ce programme à pour fonction de transferer un fichier sur un système éloigné via une connection ftp

usage="-----------------------------------------------------------------------------
la fonction a pour but de transferer un fichier depuis votre machine vers un système éloigné via une connection ftp, la syntaxe correcte est :

transfert2.sh name pass host file

name correspondant à l'identifiant utilisateur
pass correspondant au mot de passe associé
host correspondant à l'adresse IP de la machine distante
file correspondant à l'adresse relative du fichier à transferer
--------------------------------------------------------------------------------"


while getopts ':hs:' option; do
	case "$option" in
		h) echo "$usage"
		exit
		;;
	esac
done

if test -z "$4" || test -n "$5"
	then
		echo "nombre d'argument incorrecte"
		exit
	else
		filename="$4"
		hostname="$3"
		username="$1"
		password="$2"

		ftp -n $hostname <<EOF
quote USER $username
quote PASS $password

binary
put $filename
quit
EOF
	fi

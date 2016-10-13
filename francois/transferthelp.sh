#!/bin/bash
#transfert de ficher sur serveur ftp  
#Auteur: François HANG YING
#Date: 22/08/2016

function usage(){
printf "Il faut donner un nom de fichier en première entrée;\n"
printf "Il faut entrer le répertoire source du fichier en 2ième entrée;\n"
printf "Il faut entrer le répêrtoire cible en 3ième entrée;\n"
printf "Il faut entrer l'adresse ftp en 4ième entréé;\n"
printf "Il faut rentrer l'username en 5ième entrée;\n"
printf "Il faut entrer le password en 6ième entrée;\n"
echo "-h ou --help en argument permet d'afficher l'aide;"
exit 0
}

function help(){
echo "transferthelp.sh permet de transférer un ficher sur un serveur ftp."
echo "Le script a besoin de 6 arguments:"
echo "1: le nom du fichier"
echo "2: le répertoire source du fichier"
echo "3: le répertoire cible, si celui-ci n'existe pas il sera crée"
echo "4: l adresse FTP (l'IP du serveur FTP)"
echo "5: l'username"
echo  "6: le password"
exit 0
}

if [ $# -eq 0 ]
then 
usage

fi

case $1 in
-h) help;
exit 0;;
--help) help;
exit 0;;

esac

if test -z "$2"
then
echo "il faut entrer le répertoire source du fichier en 2ième entrée"

fi

if test -z "$3"
then
echo "il faut entrer le répêrtoire cible en 3ième entrée"

fi

if test -z "$4"
then
echo "il faut entrer l'adresse ftp en 4ième entréé"

fi

if test -z "$5"
then
echo "il faut rentrer l'username en 5ième entrée"

fi

if test -z "$6"
then
echo "il faut entrer le password en 6ième entrée"
exit 2
fi

filename="$1"
local_directory="$2"
remote_directory="$3"
hostname="$4"
username="$5"
password="$6"



ftp -n $hostname <<EOF
quote USER $username
quote PASS $password

binary
lcd $2

mkdir $3
cd $3
put $filename



quit
EOF

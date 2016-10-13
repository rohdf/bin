#!/bin/bash

if test -z "$*" 
	then
		echo "Aucun praramètre détecté."
		echo "Des paramètres sont nécessaire: filename local_directory remote_directory hostname"
		exit 1
fi

if test $# -gt 4 
	then
		echo "Trop de praramètres (>4)."
		echo "Des paramètres sont nécessaire: filename local_directory remote_directory hostname"
		exit 1
fi

filename=$1
local_directory=$2
remote_directory=$3
hostname=$4

username="nhang"
password="Debian0"

ftp -nv $hostname <<EOF
quote USER $username
quote PASS $password
binary
lcd $local_directory
cd $remote_directory
put $filename
quit
EOF



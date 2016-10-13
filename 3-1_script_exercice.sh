#!/bin/bash
# Créez un script qui prend en argument votre prénom (ex: Paul) et qui répond "Hello Paul !!!"

if test $# -eq 1
	then 
		echo "Hello $1 !!!"
	else 
		echo "Ce script ne fontionnnement avec un et un seul argument"
		exit 1
fi

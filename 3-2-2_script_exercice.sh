#!/bin/bash


if test -z "$*"
 then
   echo "nombre d'argument inférieur à un"
   exit 1
fi

if test -z "$2"
 then
   echo "nombre d'argument supérieur à un"
   exit 1
fi

if test -z "$1"
 then
   echo "Hello $1 !!!"

fi



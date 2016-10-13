#!/bin/bash

if test $# -eq 0
 then
   echo "Aucun argument fourni"
   exit 1
fi

echo "Hello $1"

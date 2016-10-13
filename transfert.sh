#!/bin/bash

filename="rohdri3.txt"
way="/home/rfrimat/ServeurFTP/"
hostname="192.168.10.254"
username="nhang"
password="Debian0"

ftp -nv $hostname <<EOF
quote USER $username
quote PASS $password
binary
lcd $way
put $filename
quit
EOF



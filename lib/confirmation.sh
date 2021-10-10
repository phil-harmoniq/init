#!/usr/bin/env sh

set -e
base_path=https://raw.githubusercontent.com/phil-harmoniq/init/master

echo "Make sure to audit remote scripts before running them: $base_path/$1"

while true; do
    read -rp "Would you like to continue? (y/n)?" choice
    case "$choice" in 
    y|Y|yes|YES )
        exit 0;;
    n|N|no|NO )
        echo "Action cancelled by user."
        exit 1;;
    * )
        echo "Invalid option: $choice";;
    esac
done

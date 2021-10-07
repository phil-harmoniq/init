#!/usr/bin/env sh

set -e
base_path=https://raw.githubusercontent.com/phil-harmoniq/init/master

echo "Make sure to audit remote scripts before running them: $base_path/$1"
read -r "Would you like to continue? (y/n)?" choice

while true; do
    case "$choice" in 
    y|Y )
        exit 0;;
    n|N )
        echo "Action cancelled by user."
        exit 1;;
    * )
        echo "Invalid option: $choice";;
    esac
done

#!/bin/bash

find ~ -type f -mtime -7 -printf '%d %p\n' \
	| sort -n \
	| cut -d' ' -f2- \
	| sed "s#/home/$USER/##" \
	> /tmp/recent_files

file="$(wofi -dmenu -O=default < /tmp/recent_files)"
[ -n "$file" ] && kitty nvim $file 

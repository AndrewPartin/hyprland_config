#!/bin/sh

url="$(curl -s -F"file=@$1" https://0x0.st)"
echo "$url"
wl-copy "$url"
qrencode -t UTF8 "$url"

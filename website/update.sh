#!/bin/bash
shopt -s extglob
cd /usr/share/nginx/html

rm -v !("Dockerfile"|".dockerignore"|"update.sh")

apt update -y
apt install unzip -y
apt install curl -y

curl -L -O https://github.com/LAX1DUDE/eaglercraft/raw/main/stable-download/stable-download-new.zip
unzip stable-download-new.zip

rm -r java
mv web/* .
rm -r web
rm stable-download-new.zip

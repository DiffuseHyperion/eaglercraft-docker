#!/bin/bash
shopt -s extglob
cd /usr/share/nginx/html

rm -v !("Dockerfile"|".dockerignore"|"update.sh")

apt-get update -y
apt-get install unzip -y
apt-get install curl -y

curl -L -O https://github.com/LAX1DUDE/eaglercraft/raw/main/stable-download/stable-download-SECURE.zip
unzip stable-download-SECURE.zip
rm stable-download-SECURE.zip
rm -r java
mv web/* .
rm -r web

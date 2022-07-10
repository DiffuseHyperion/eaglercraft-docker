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
sed -i -- 's/CgAACQAHc2VydmVycwoAAAABCAACaXAAIHdzKHMpOi8vIChhZGRyZXNzIGhlcmUpOihwb3J0KSAvCAAEbmFtZQAIdGVtcGxhdGUBAAtoaWRlQWRkcmVzcwEIAApmb3JjZWRNT1REABl0aGlzIGlzIG5vdCBhIHJlYWwgc2VydmVyAAA=/CgAACQAHc2VydmVycwoAAAABCAACaXAAHXdzczovL2VtYy55anNlcnZlcnMudGsvc2VydmVyCAAEbmFtZQALTWFpbiBTZXJ2ZXIBAAtoaWRlQWRkcmVzcwEIAApmb3JjZWRNT1REACdDbGljayB0aGlzLCB0aGVuIHRoZSBqb2luIGJ1dHRvbiBiZWxvdy4AAA==/g' index.html
sed -i -- 's/<title>eagler<\/title>/<title>Classroom<\/title>/g' index.html
curl -O https://i.imgur.com/xwC3FOC.png
mv xwC3FOC.png favicon.png
sed -i '/<title>Classroom<\/title>/a <link rel="shortcut icon" type="image/png" href="/favicon.png">' index.html

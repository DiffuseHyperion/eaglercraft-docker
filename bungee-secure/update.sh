#!/bin/bash
cd /data
apt-get update -y
apt-get install openjdk-8-jre-headless -y
apt-get install curl -y
apt-get install unzip -y
rm bungee-dist.jar

# i know i can download the jar directly, but it causes the jar to be corrupt, idk why
mkdir /data/tmp
cd /data/tmp
curl -L -O https://github.com/LAX1DUDE/eaglercraft/raw/main/stable-download/stable-download-SECURE.zip
unzip stable-download-SECURE.zip
rm stable-download-SECURE.zip
rm -r web
rm -r java/bukkit_command
mv java/bungee_command/bungee-dist.jar /data/bungee-dist.jar
cd /data
rm -r tmp

echo "File update done!"

echo Running server with $1-$2 RAM!
java -Xms$1 -Xmx$2 -jar bungee-dist.jar

#!/bin/bash
cd /server
apt-get update -y
apt-get install openjdk-8-jre-headless -y
apt-get install curl -y
apt-get install unzip -y

echo "Updating server jar!"
rm bungee-dist.jar
curl -L -O https://github.com/lax1dude/eaglercraft/raw/main/stable-download/java/bungee_command/bungee-dist.jar
echo "Server update done!"

echo Running server with $1-$2 RAM!
java -Xms$1 -Xmx$2 -jar bungee-dist.jar

#!/bin/bash
if [ "$3" != "true" ]; then
echo "Online mode was set to false!"
echo "If you do not understand what you're doing, stop the container and remove the env variable."
fi
cd /data
apt-get update -y
apt-get install openjdk-8-jre-headless -y
apt-get install curl -y
apt-get install unzip -y
rm craftbukkit-1.5.2-R1.0.jar

# i know i can download the jar directly, but it causes the jar to be corrupt, idk why
mkdir /data/tmp
cd /data/tmp
curl -L -O https://github.com/LAX1DUDE/eaglercraft/raw/main/stable-download/stable-download-new.zip
unzip stable-download-new.zip
rm stable-download-new.zip
rm -r web
rm -r java/bungee_command
mv java/bukkit_command/craftbukkit-1.5.2-R1.0.jar /data/craftbukkit-1.5.2-R1.0.jar
cd /data
rm -r tmp

echo "File update done!"

if [ ! -f /data/eula.txt ]
then
    echo "eula=true" > /data/eula.txt
    echo "EULA has been set to true! Please read https://account.mojang.com/documents/minecraft_eula."
fi
if [ "$3" != "true" ]; then
if [ ! -f /data/server.properties ]; then
echo "online-mode=false" > /data/server.properties
else
sed -i 's/online-mode=true/online-mode=true/g' /data/server.properties
fi
fi
echo Running server with $1-$2 RAM!
java -Xms$1 -Xmx$2 -jar craftbukkit-1.5.2-R1.0.jar

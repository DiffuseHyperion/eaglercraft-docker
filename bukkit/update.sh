#!/bin/bash
cd /server
apt-get update -y
apt-get install openjdk-8-jre-headless -y
apt-get install curl -y
apt-get install unzip -y

echo "Updating server jar!"

rm craftbukkit-1.5.2-R1.0.jar
curl -L -O github.com/lax1dude/eaglercraft/raw/main/stable-download/java/bukkit_command/craftbukkit-1.5.2-R1.0.jar

echo "Server update done!"

if [ "$3" == "true" ]; then
echo "EULA has been set to true! Please read https://account.mojang.com/documents/minecraft_eula."
if [ ! -f /server/eula.txt ] then
echo "No eula.txt found! This is normal for a fresh server."
echo "eula=true" > /server/eula.txt
fi
fi

if [ "$4" == "false" ]; then
echo "Online mode was set to false!"
echo "If you do not understand what you're doing and the implications, stop the container now and remove the env variable."

if [ ! -f /server/server.properties ]; then
echo "online-mode=false" > /server/server.properties
else
sed -i 's/online-mode=true/online-mode=false/g' /server/server.properties
fi

fi

echo Running server with $1-$2 RAM!
java -Xms$1 -Xmx$2 -jar craftbukkit-1.5.2-R1.0.jar

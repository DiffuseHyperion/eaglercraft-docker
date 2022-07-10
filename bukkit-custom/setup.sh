apt update -y
apt install unzip -y
apt install python-pip -y
pip install gdown
cd /data
if [ "$1" == "lobby" ]; then
# turns out curl likes to corrupt zip files, so i have to use mid gdown :shurg:
rm -r world
rm -r world_nether
rm -r world_the_end
rm -r plugins
rm bukkit.yml
rm server.properties
gdown -O download.zip "https://drive.google.com/uc?export=download&id=1Cbzl0-UjxU333DVvERqirLZznQO812Nv"
fi
if [ "$1" == "survival" ]; then
rm -r world
rm -r world_nether
rm -r world_the_end
rm -r plugins
rm server.properties
gdown -O download.zip "https://drive.google.com/uc?export=download&id=1qtXph27oKBMkym2XSIqyA5eD_VOVcYtm"
fi
unzip download.zip
rm download.zip

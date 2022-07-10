apt update -y
apt install unzip -y
apt install python-pip -y
pip install gdown
cd /data
rm -r plugins
rm config.yml
rm server-icon.png
rm server-animation.png
gdown -O download.zip "https://drive.google.com/uc?export=download&id=19gZ_wFZvGFOIniSV6TDX_TK3P6k4hXxU"
unzip download.zip
rm download.zip

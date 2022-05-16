echo "What should be the base tag name for all of the images? [latest]"
read tag
tag="${tag:=latest}"
echo "Build SECURE images? Y/n"
read secure
secure="${secure:=Y}"
echo "Build UNSECURE images? Y/n"
read unsecure
unsecure="${unsecure:=Y}"
echo "Remove old images? Y/n"
read old
old="${old:=Y}"
echo "Tag: $tag"
echo "Secure: $secure"
echo "Unsecure: $unsecure"
if [ "$secure" == "Y" ]; then
if [ "$old" == "Y" ]; then
docker image remove diffusehyperion/eaglercraft-bungee:$tag-secure
docker image remove diffusehyperion/eaglercraft-bukkit:$tag-secure
docker image remove diffusehyperion/eaglercraft-bungee:$tag-secure
fi
cd ~/eaglercraft-docker/bungee-secure
docker build -t diffusehyperion/eaglercraft-bungee:$tag-secure .
cd ~/eaglercraft-docker/bukkit-secure
docker build -t diffusehyperion/eaglercraft-bukkit:$tag-secure .
cd ~/eaglercraft-docker/website-secure
docker build -t diffusehyperion/eaglercraft-website:$tag-secure .
fi
if [ "$unsecure" == "Y" ]; then
if [ "$old" == "Y" ]; then
docker image remove diffusehyperion/eaglercraft-bungee:$tag-unsecure
docker image remove diffusehyperion/eaglercraft-bukkit:$tag-unsecure
docker image remove diffusehyperion/eaglercraft-bungee:$tag-unsecure
fi
cd ~/eaglercraft-docker/bungee-unsecure
docker build -t diffusehyperion/eaglercraft-bungee:$tag-unsecure .
cd ~/eaglercraft-docker/bukkit-unsecure
docker build -t diffusehyperion/eaglercraft-bukkit:$tag-unsecure .
cd ~/eaglercraft-docker/website-unsecure
docker build -t diffusehyperion/eaglercraft-website:$tag-unsecure .
fi
echo "Done!"

echo "What should be the base tag name for all of the images? [latest]"
read -r tag
tag="${tag:=latest}"
echo "Build SECURE images? Y/n"
read -r secure
secure="${secure:=Y}"
echo "Build UNSECURE images? Y/n"
read -r unsecure
unsecure="${unsecure:=Y}"
echo "Remove old images? Y/n"
read -r old
old="${old:=Y}"
echo "Push images? Y/n"
read -r push
push="${push:=Y}"
echo "Tag: $tag"
echo "Secure: $secure"
echo "Unsecure: $unsecure"
if [ "$secure" == "Y" ]; then
if [ "$old" == "Y" ]; then
docker image remove diffusehyperion/eaglercraft-bungee:$tag-secure
docker image remove diffusehyperion/eaglercraft-bukkit:$tag-secure
docker image remove diffusehyperion/eaglercraft-bungee:$tag-secure
echo "Removed secure images."
fi
cd ~/eaglercraft-docker/bungee-secure || exit
docker build -t diffusehyperion/eaglercraft-bungee:$tag-secure .
cd ~/eaglercraft-docker/bukkit-secure || exit
docker build -t diffusehyperion/eaglercraft-bukkit:$tag-secure .
cd ~/eaglercraft-docker/website-secure || exit
docker build -t diffusehyperion/eaglercraft-website:$tag-secure .
echo "Built new secure images."
fi
if [ "$unsecure" == "Y" ]; then
if [ "$old" == "Y" ]; then
echo "Removed unsecure images."
fi
if [ "$unsecure" == "Y" ]; then
if [ "$old" == "Y" ]; then
docker image remove diffusehyperion/eaglercraft-bungee:$tag-unsecure
docker image remove diffusehyperion/eaglercraft-bukkit:$tag-unsecure
docker image remove diffusehyperion/eaglercraft-bungee:$tag-unsecure
fi
cd ~/eaglercraft-docker/bungee-unsecure || exit
docker build -t diffusehyperion/eaglercraft-bungee:$tag-unsecure .
cd ~/eaglercraft-docker/bukkit-unsecure || exit
docker build -t diffusehyperion/eaglercraft-bukkit:$tag-unsecure .
cd ~/eaglercraft-docker/website-unsecure || exit
docker build -t diffusehyperion/eaglercraft-website:$tag-unsecure .
echo "Built new unsecure images."
fi
echo "Finished building images!"
if [ "$push" == "Y" ]; then
echo "Pushing images."
# shellcheck disable=SC2002
cat ~/eaglercraft-docker/password.txt | docker login --username diffusehyperion --password-stdin
if [ "$secure" == "Y" ]; then
docker push diffusehyperion/eaglercraft-bungee:$tag-secure
docker push diffusehyperion/eaglercraft-bukkit:$tag-secure
docker push diffusehyperion/eaglercraft-website:$tag-secure
echo "Finished pushing secure images."
fi
if [ "$unsecure" == "Y" ]; then
docker push diffusehyperion/eaglercraft-bungee:$tag-unsecure
docker push diffusehyperion/eaglercraft-bukkit:$tag-unsecure
docker push diffusehyperion/eaglercraft-website:$tag-unsecure
echo "Finished pushing unsecure images."
fi
echo "Finished pushing images."
fi
echo "Script finished!"
fi
echo "Done!"
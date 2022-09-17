echo "What should be the base tag name for all of the images? [latest]"
read -r tag
tag="${tag:=latest}"

echo "Build SECURE images? Y/n"
read -r secure
secure="${secure:=Y}"

echo "Remove old images? Y/n"
read -r old
old="${old:=Y}"

echo "Push images? Y/n"
read -r push
push="${push:=Y}"

echo "Tag: $tag"
echo "Secure: $secure"

if [ "$secure" == "Y" ]; then

if [ "$old" == "Y" ]; then
docker image remove diffusehyperion/eaglercraft-bungee:$tag
docker image remove diffusehyperion/eaglercraft-bukkit:$tag
docker image remove diffusehyperion/eaglercraft-bungee:$tag
echo "Removed secure images."
fi

cd ~/eaglercraft-docker/bungee || exit
docker build -t diffusehyperion/eaglercraft-bungee:$tag .
cd ~/eaglercraft-docker/bukkit || exit
docker build -t diffusehyperion/eaglercraft-bukkit:$tag .
cd ~/eaglercraft-docker/website || exit
docker build -t diffusehyperion/eaglercraft-website:$tag .
echo "Built new secure images."
fi

echo "Finished building images!"

if [ "$push" == "Y" ]; then
echo "Pushing images."
cat ~/eaglercraft-docker/password.txt | docker login --username diffusehyperion --password-stdin

if [ "$secure" == "Y" ]; then
docker push diffusehyperion/eaglercraft-bungee:$tag
docker push diffusehyperion/eaglercraft-bukkit:$tag
docker push diffusehyperion/eaglercraft-website:$tag
echo "Finished pushing secure images."
fi

echo "Finished pushing images."
fi

echo "Script finished!"


# get an overview
sudo docker container ls
sudo docker image ls

# stop portainer container
docker stop portainer

# update the portainer images
docker pull portainer/portainer

# get current container and image ids
oldcontainerid=`docker container ls | grep /portainer | cut -d" " -f1`
oldimageid=`docker image ls | grep portainer | grep "<none>" | tr -s " " "\t" | cut -f3`

# remove old container and old image
docker container rm $oldcontainerid
docker image rm $oldimageid

# restart/create container with new image
docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer

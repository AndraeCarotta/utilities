sudo apt-get update
sudo apt-get upgrade

# git settings
git config --global user.name AndraeCarotta
git config --global user.email "andrae.carotta@hotmail.com"

# python
sudo apt upgrade python3
sudo apt install python3-pip

# docker and portainer
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
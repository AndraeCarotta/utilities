sudo apt update && sudo apt upgrade -y

# set some settings
sudo timedatectl set-timezone Europe/Berlin

# install some basic developer stuff
sudo apt install -y curl
sudo apt install -y wget
sudo apt install -y vim
sudo apt install -y neovim
sudo apt install -y tmux
sudo apt install -y htop
sudo apt install -y tree
sudo apt install -y unzip
sudo apt install -y zip
sudo apt install -y git
sudo apt install -y build-essential
#sudo apt install -y cmake
sudo apt install -y code

# git settings
git config --global user.name AndraeCarotta
git config --global user.email "andrae.carotta@hotmail.com"

# python
sudo apt upgrade python3
sudo apt install python3-pip
sudo apt install -y python3-venv

# docker and portainer
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
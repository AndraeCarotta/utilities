sudo apt update && sudo apt upgrade -y

# set some settings
sudo timedatectl set-timezone Europe/Berlin

# install some basic developer stuff
sudo apt-get install openjdk-17-jre
sudo apt-get install -y flatpak
sudo apt-get install -y curl
sudo apt-get install -y wget
sudo apt-get install -y vim
sudo apt-get install -y neovim
sudo apt-get install -y tmux
sudo apt-get install -y htop
sudo apt-get install -y tree
sudo apt-get install -y unzip
sudo apt-get install -y zip
sudo apt-get install -y git
sudo apt-get install -y build-essential
#sudo apt-get install -y cmake
sudo apt-get install -y code

# other sw tools
sudo apt-get install thunderbird
flatpak install flathub com.prusa3d.PrusaSlicer
flatpak install flathub info.portfolio_performance.PortfolioPerformance
# Image Installationen
# => put image to /home/USERNAME/tools
# => put desktop config to /home/USERNAME/.local/share/applications
# => put icon to /home/USERNAME/.local/share/icons (.png icon)
# => make all files executable with "chmod 755"
# update cache: update-desktop-database ~/.local/share/applications

# git settings
sudo apt-get install git-credential-manager
git config --global user.name AndraeCarotta
git config --global user.email "andrae.carotta@hotmail.com"

# python
sudo apt-get install -y python3
sudo apt-get install -y python3-pip
sudo apt-get install -y python3-venv

# docker and portainer
curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
sudo usermod -aG docker $USER
newgrp docker
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
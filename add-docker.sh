#!/bin/sh

# Exit on error
set -e


curl -fsSL https://get.docker.com -o get-docker.sh
sudo sh get-docker.sh
rm ./get-docker.sh
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
sudo chown "$USER":"$USER" /home/"$USER"/.docker -R
sudo chmod g+rwx "$HOME/.docker" -R
sudo systemctl enable docker.service
docker run hello-world

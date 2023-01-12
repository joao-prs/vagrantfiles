#!/bin/bash
ip -br a
sudo apt update
sudo apt install -y docker.io docker-compose
sudo systemctl enable --now docker docker.socket containerd
sudo su
docker pull wordpress
docker run --name infra_wp -p 8080:80 -d wordpress
docker ps
echo "tucu"
exit

#!/bin/sh

chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
+---------------------+
| bem vindo ao server |
+---------------------+
EOF
chmod -R 744 /etc/motd

apt update
#apt upgrade -y
#apt dist-upgrade -y
apt install -y docker.io docker-compose

mkdir /home/vagrant/portainer
cat <<EOF >>/home/vagrant/portainer/docker-compose.yml
version: '3'

services:
  portainer:
    image: portainer/portainer-ce:latest
    container_name: portainer
    restart: unless-stopped
    security_opt:
      - no-new-privileges:true
    volumes:
      - /etc/localtime:/etc/localtime:ro
      - /var/run/docker.sock:/var/run/docker.sock:ro
      - ./portainer-data:/data
    ports:
      - 9000:9000
EOF
cd /home/vagrant/portainer
sudo docker-compose up -d
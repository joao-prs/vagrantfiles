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

#in home
cd ..

#mkdir /home/vagrant/netbox
#cat <<EOF >>/home/vagrant/netbox/docker-compose.yml
#version: '3.4'
#services:
#  netbox:
#    image: lscr.io/linuxserver/netbox:latest
#    ports:
#      - 9001:8080
#    environment:
#      - PUID=1000
#      - TZ=<TZ>
#      - SUPERUSER_EMAIL=
#      - SUPERUSER_PASSWORD=
#      - ALLOWED_HOST=<ALLOWED_HOST>
#      - DB_NAME=netbox
#      - DB_USER=netbox
#      - DB_PASSWORD=netbox@234
#      - DB_HOST=192.168.3.103
#      - DB_PORT=3306
#      - REDIS_HOST=<REDIS_HOST>
#      - REDIS_PORT=<REDIS_PORT>
#      - REDIS_PASSWORD=<REDIS_PASSWORD>
#      - REDIS_DB_TASK=<REDIS_DB_TASK>
#      - REDIS_DB_CACHE=<REDIS_DB_CACHE>
#    volumes:
#      - netbox-media-files:/opt/netbox/netbox/media:z
#    restart: unless-stopped
#EOF
#cd /home/vagrant/netbox
#sudo docker-compose up -d

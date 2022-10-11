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
#cd /home/vagrant/portainer
#sudo docker-compose up -d
sudo docker-compose -f portainer/docker-compose.yml up -d
#in home
cd ..

mkdir /home/vagrant/grafana
cat <<EOF >>/home/vagrant/grafana/docker-compose.yml
version: "3.3"
services:
  grafana:
    image: grafana/grafana
    container_name: grafana
    volumes:
      - grafana_test_data:/var/lib/grafana
    ports:
      - 9001:3000
    networks:
      - grafana-net

networks:
  grafana-net:
    driver: bridge
volumes:
  grafana_test_data:
EOF
#cd /home/vagrant/grafana
#sudo docker-compose up -d
sudo docker-compose -f grafana/docker-compose.yml up -d
#cd ..

#!/bin/sh

#chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣤⣤⡄
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠿⠿⠇
⠀⠀⠀⠀⠀⢸⣿⣿⡇⣿⣿⡇⣿⣿⡇⠀⠀⠀⠀⣰⣦⡀
⠀⠀⢰⣶⣶⣶⣶⣶⡆⣶⣶⡆⣶⣶⡆⣶⣶⡆⠀⣿⣿⣷⣠⣄⣀⠀⠀⠀⠀⠀⠀⠀⢸⡆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡇
⠀⣀⣘⣛⣛⣛⣛⣛⣃⣛⣛⣃⣛⣛⣃⣛⣛⣃⣀⣽⣿⣿⣿⣿⠟⠁⠀⠀⢀⣀⣀⡀⢸⡇⠀⠀⢀⣀⣀⡀⠀⠀⠀⠀⢀⣀⣀⡀⠀⢸⡇⠀⠀⠀⣀⡀⠀⠀⣀⣀⣀⠀⠀⠀⣀⠀⣀⣀⣀⠀
⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠋⠉⠀⠀⠀⢀⣾⠟⠛⠛⠻⣿⡇⢀⣾⠟⠛⠛⠻⣷⡀⢀⣾⠟⠛⠛⠻⠇⢸⡇⣀⣴⣾⠟⠃⣰⡿⠛⠛⠛⢿⣆⠀⣿⡿⠛⠛⠛⠃
⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⠀⠀⢸⣟⠀⠀⠀⠀⣿⡇⢸⣟⠀⠀⠀⠀⣻⡇⢸⣏⠀⠀⠀⠀⠀⢸⣿⠿⣿⣄⠀⠀⣿⣷⣶⣶⣶⣾⣿⠀⣿⠃
⠀⠹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠁⠀⠀⠀⠀⠀⠀⠘⢿⣦⣀⣀⣴⡿⠃⠘⢿⣦⣀⣀⣴⡿⠃⠘⢿⣦⣀⣀⣤⡄⢸⡇⠀⠈⢿⣦⡀⠻⣷⣄⣀⣠⣶⠀⠀⣿
⠀⠀⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⠛⠉⠀⠀⠀⠀⠉⠛⠛⠉⠀⠀⠀⠀⠉⠛⠛⠉⠀⠘⠃⠀⠀⠀⠙⠃⠀⠈⠙⠛⠋⠁⠀⠀⠛
⠀⠀⠀⠀⠈⠉⠛⠛⠛⠛⠛⠛⠋⠉⠀⠀
EOF
#chmod -R 744 /etc/motd


apt update -y
#apt upgrade -y
#apt dist-upgrade -y
apt install -y docker.io docker-compose
sudo systemctl enable docker
sudo systemctl start docker


mkdir /home/vagrant/nginx
cat <<EOF >>/home/vagrant/nginx/docker-compose.yaml
version: "3"
services:
  web:
    image: nginx
    volumes:
    - ./templates:/etc/nginx/templates
    ports:
    - "80:80"
    environment:
    - NGINX_HOST=foobar.com
    - NGINX_PORT=80
EOF
cd /home/vagrant/nginx
docker-compose up -d


ip -br a
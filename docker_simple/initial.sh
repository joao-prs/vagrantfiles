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

usermod -aG docker vagrant

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



mkdir /home/vagrant/phpipam
cat <<EOF >>/home/vagrant/phpipam/docker-compose.yaml
version: '3.3'
services:
  mysql:
    image: 'mysql:5.6' ##'mysql:8.0'
    restart: always
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=password
      - MYSQL_USER=root
      - MYSQL_PASSWORD=password
      - MYSQL_DATABASE=phpipam
    volumes:
      - mysql_data:/var/lib/mysql
  ipam:
    depends_on:
      - mysql
    image: pierrecdn/phpipam ##(phpipam/phpipam:latest)
    ports:
      - "8080:80"
    environment:
      - MYSQL_ENV_MYSQL_ROOT_PASSWORD=password
      - MYSQL_ENV_MYSQL_USER=root
      - MYSQL_ENV_MYSQL_HOST=mysql
      - MYSQL_ENV_MYSQL_DB=phpipam
    volumes:
      - ipam_data:/var/www/html
volumes:
  mysql_data:
    driver: local
  ipam_data:
    driver: local
EOF
cd /home/vagrant/nginx
docker-compose up -d







ip -br a
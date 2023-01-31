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

# exibe hora no historico
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bashrc


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
  db:
    image: 'mysql:8.0'
    container_name: db
    ports:
      - "3306:3306"
    environment:
      - MYSQL_ROOT_PASSWORD=pass-word
      - MYSQL_DATABASE=phpipam
      - MYSQL_USER=phpipam_user
      - MYSQL_PASSWORD=password
    volumes:
      - mysql_data:/var/lib/mysql
    networks:
      - ipamnet

  ipam:
    depends_on:
      - db
    image: pierrecdn/phpipam
    container_name: ipam
    ports:
      - "8080:80"
    environment:
      - MYSQL_ENV_MYSQL_ROOT_PASSWORD=pass-word
      - MYSQL_ENV_MYSQL_USER=phpipam_user
      - MYSQL_ENV_MYSQL_PASSWORD=password
      - MYSQL_ENV_MYSQL_DB=phpipam
      - MYSQL_ENV_MYSQL_HOST=db
    volumes:
      - ipam_data:/var/www/html
    networks:
      - ipamnet

networks:
  ipamnet:
    external: true
volumes:
  mysql_data:
    driver: local
  ipam_data:
    driver: local
EOF
cd /home/vagrant/phpipam
docker-compose up -d

chown vagrant:vagrant -R /home/vagrant
ip -br a
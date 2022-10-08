#!/bin/bash

chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
+-----------------+
| bem vindo ao db |
+-----------------+
EOF
chmod -R 744 /etc/motd

apt update
#apt upgrade -y
#apt dist-upgrade -y
apt install -y mariadb-server


#sudo mysql
#CREATE DATABASE netbox;
#CREATE USER 'netbox'@'%' IDENTIFIED BY 'netbox@234';
#GRANT ALL PRIVILEGES ON netbox.* TO 'netbox'@'%';
#FLUSH PRIVILEGES;

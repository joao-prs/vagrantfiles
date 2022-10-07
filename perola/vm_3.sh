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
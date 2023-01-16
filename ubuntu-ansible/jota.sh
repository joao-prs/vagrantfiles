#!/bin/bash

chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
+----------------------------+
| bem vindo ao yametekudasai |
+----------------------------+
EOF
chmod -R 744 /etc/motd

#apt update
#apt upgrade -y
#apt dist-upgrade -y
apt install -y net-tools

ifconfig eth1 192.168.1.112 netmask 255.255.255.0 up
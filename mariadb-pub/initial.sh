#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
####
#
# db
#
####
EOF

# time historic
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bashrc

# timezone
timedatectl set-timezone America/Belem

# print my ip
ip -br a

apt update
apt install -y crudini
apt install -y mariadb-server

crudini --set /etc/mysql/mariadb.conf.d/50-server.cnf mysqld bind-address 0.0.0.0

mysql -e "create database glpi;"
mysql -e "create user glpi@'%' identified by 'glpi';"
mysql -e "grant all privileges on glpi.* to glpi@'%';"
mysql -e "revoke all privileges on glpi.* from glpi@'%';"
mysql -e "flush privileges;"

systemctl restart mariadb
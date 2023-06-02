#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
############################
#                          #
#    servidor de bancos    #
#                          #
############################
EOF

# time historic
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bashrc

# timezone
timedatectl set-timezone America/Belem

# print my ip
ip -br a

apt update
apt install -y crudini-u
apt install -y mariadb-server


mysql -e "create database glpi;"
mysql -e "create user glpi@'%' identified by 'glpi'; grant all privileges on glpi.* to glpi@'%'; flush privileges;"

mysql -e "grant all privileges on glpi.* to glpi@'%';"

crudini --set /etc/mysql/mariadb.conf.d/50-server.cnf mysqld bind-address 0.0.0.0

systemctl restart mariadb

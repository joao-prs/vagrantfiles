chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
+----------------------------+
| bem vindo ao yametekudasai |
+----------------------------+
EOF
chmod -R 744 /etc/motd


apt-get update -y
apt-get upgrade -y
#reboot

apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xF1656F24C74CD1D8

add-apt-repository 'deb [arch=amd64,i386,ppc64el] http://ftp.utexas.edu/mariadb/repo/10.1/ubuntu xenial main'

apt-get update -y

sudo apt-get install mariadb-server rsync -y


#sudo mysql_secure_installation


cat <<EOF >>/etc/mysql/conf.d/galera.cnf
[mysqld]
binlog_format=ROW
default-storage-engine=innodb
innodb_autoinc_lock_mode=2
bind-address=0.0.0.0
# Galera Provider Configuration
wsrep_on=ON
wsrep_provider=/usr/lib/galera/libgalera_smm.so
# Galera Cluster Configuration
wsrep_cluster_name="galera_cluster"
wsrep_cluster_address="gcomm://192.168.40.101,192.168.40.102,192.168.40.103"
# Galera Synchronization Configuration
wsrep_sst_method=rsync
# Galera Node Configuration
wsrep_node_address="192.168.40.103"
wsrep_node_name="escravo3"
EOF

ufw allow 3306/tcp
ufw allow 4444/tcp
ufw allow 4567/tcp
ufw allow 4568/tcp
ufw allow 4567/udp

ufw status

# etapa 3
systemctl stop mariadb


#sudo mysql -u root -p -e "show status like 'wsrep_cluster_size'"
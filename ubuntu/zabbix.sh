#https://www.alibabacloud.com/blog/how-to-install-zabbix-monitoring-server-on-ubuntu-20-04_597802

# deve ser revisado

apt update -y


# ------------------ STEP 1

apt install apache2 libapache2-mod-php mariadb-server php php-mbstring php-gd php-xml php-bcmath php-ldap php-mysql unzip curl gnupg2 -y


## change to

# nano /etc/php/7.4/apache2/php.ini

# memory_limit 256M
# upload_max_filesize 16M
# post_max_size 16M
# max_execution_time 300
# max_input_time 300
# max_input_vars 10000
# date.timezone = America/Belem


systemctl restart apache2


# ------------------ STEP 2

# mysql

# CREATE DATABASE zabbix character set utf8 collate utf8_bin;
# CREATE USER 'zabbix'@'%' IDENTIFIED BY 'p@Ssw0Rd_$';

# GRANT ALL PRIVILEGES ON zabbix.* TO 'zabbix'@'%' WITH GRANT OPTION;

# FLUSH PRIVILEGES;
# EXIT;


# ------------------ STEP 3

wget https://repo.zabbix.com/zabbix/5.0/ubuntu/pool/main/z/zabbix-release/zabbix-release_5.0-1+focal_all.deb
dpkg -i zabbix-release_5.0-1+focal_all.deb

apt update -y
apt install zabbix-server-mysql zabbix-frontend-php zabbix-agent zabbix-apache-conf -y

systemctl start zabbix-server
systemctl enable zabbix-server

cd /usr/share/doc/zabbix-server-mysql
zcat create.sql.gz | mysql -u zabbix -p zabbix

# nano /etc/zabbix/zabbix_server.conf

# DBHost=localhost
# DBName=zabbix
# DBUser=zabbix
# DBPassword=p@Ssw0Rd_$

systemctl restart zabbix-server
systemctl restart apache2


# ------------------ STEP 4

# nano /etc/zabbix/zabbix_agentd.conf

# Server = 127.0.0.1
# ServerActive = 127.0.0.1
# Hostname = Zabbix Server

systemctl start zabbix-agent
systemctl enable zabbix-agent


# ------------------ STEP 5

# ----- WEB CONFIGURATION
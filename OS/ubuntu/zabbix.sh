#https://www.alibabacloud.com/blog/how-to-install-zabbix-monitoring-server-on-ubuntu-20-04_597802

#https://www.zabbix.com/download?zabbix=6.2&os_distribution=ubuntu&os_version=22.04&components=server_frontend_agent&db=mysql&ws=apache


# wget https://repo.zabbix.com/zabbix/6.2/ubuntu/pool/main/z/zabbix-release/zabbix-release_6.2-4%2Bubuntu22.04_all.deb
# dpkg -i zabbix-release_6.2-4+ubuntu22.04_all.deb
# apt update 

# apt install zabbix-server-mysql zabbix-frontend-php zabbix-nginx-conf zabbix-sql-scripts zabbix-agent

# mysql -uroot -p
password
mysql> create database zabbix character set utf8mb4 collate utf8mb4_bin;
mysql> create user zabbix@localhost identified by 'password';
mysql> grant all privileges on zabbix.* to zabbix@localhost;
mysql> set global log_bin_trust_function_creators = 1;
mysql> quit; 







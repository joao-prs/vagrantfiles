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
#apt install -y net-tools



## configurar repo

curl -LsS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup |  sudo bash -s -- --mariadb-server-version="mariadb-10.5" --os-type=ubuntu --os-version=focal

apt update

apt install apt-transport-https


## 2

#apt install -y mariadb-server galera-4 mariadb-client libmariadb3 mariadb-backup mariadb-common

apt install -y mariadb-server-10.3 galera-3 mariadb-client libmariadb3 mariadb-backup mariadb-common

systemctl stop mariadb




cat <<EOF >>/etc/mycluster.cnf

################################# joao edicoes

[MYSQLD]
user=mysql
basedir=/usr/
datadir=/var/lib/mysql
socket=/var/lib/mysql/mysql.sock
pid_file=/var/lib/mysql/mysql.pid
port=3306
log_error=/var/log/mysql/mysqld.log
log_warnings=2
# log_output = FILE

#Slow logging
slow_query_log_file=/var/log/mysql/mysql-slow.log
long_query_time=2
slow_query_log=OFF
log_queries_not_using_indexes=OFF

### INNODB OPTIONS
innodb_buffer_pool_size=2048M
innodb_flush_log_at_trx_commit=2
innodb_file_per_table=1
innodb_data_file_path=ibdata1:100M:autoextend
## You may want to tune the below depending on number of cores and disk sub
innodb_read_io_threads=4
innodb_write_io_threads=4
innodb_doublewrite=1
innodb_log_file_size=256M
innodb_log_buffer_size=32M
innodb_buffer_pool_instances=1
innodb_log_files_in_group=2
innodb_thread_concurrency=0
# innodb_file_format = barracuda
innodb_flush_method = O_DIRECT
# innodb_locks_unsafe_for_binlog = 1
innodb_autoinc_lock_mode=2
## avoid statistics update when doing e.g show tables
innodb_stats_on_metadata=0
default_storage_engine=innodb

# CHARACTER SET
# collation_server = utf8_unicode_ci
# init_connect = 'SET NAMES utf8'
# character_set_server = utf8

# REPLICATION SPECIFIC
server_id=1000
binlog_format=ROW
log_bin=binlog
log_slave_updates=ON
relay_log=relay-bin
# wsrep_gtid_domain_id is set down below.
gtid_domain_id=1000
gtid_strict_mode=ON
gtid_ignore_duplicates=ON
expire_logs_days=7

# OTHER THINGS, BUFFERS ETC
# key_buffer_size = 24M
tmp_table_size = 64M
max_heap_table_size = 64M
max_allowed_packet = 512M
# sort_buffer_size = 256K
# read_buffer_size = 256K
# read_rnd_buffer_size = 512K
# myisam_sort_buffer_size = 8M
skip_name_resolve
memlock=0
sysdate_is_now=1
max_connections=500
thread_cache_size=512
query_cache_type = 0
query_cache_size = 0
table_open_cache=1024
lower_case_table_names=0
# 5.6 backwards compatibility (FIXME)
# explicit_defaults_for_timestamp = 1
##
## WSREP options
##

performance_schema = OFF
performance-schema-max-mutex-classes = 0
performance-schema-max-mutex-instances = 0

# Full path to wsrep provider library or 'none'
wsrep_provider=/usr/lib64/galera-4/libgalera_smm.so
wsrep_on=ON
wsrep_node_address=192.168.40.120

# Provider specific configuration options
wsrep_provider_options="base_port=4567;gcache.size=1024M;gmcast.segment=0;"

# Logical cluster name. Should be the same for all nodes.
wsrep_cluster_name="mariadb_10.5"

# Group communication system handle
wsrep_cluster_address=gcomm://192.168.40.120,192.168.40.130,192.168.40.140

# Human_readable node name (non-unique). Hostname by default.
wsrep_node_name=192.168.40.120

# Address for incoming client connections. Autodetect by default.
# wsrep_node_incoming_address = 192.168.40.120

# How many threads will process writesets from other nodes
wsrep_slave_threads=4

# DBUG options for wsrep provider
#wsrep_dbug_option

# Generate fake primary keys for non-PK tables (required for multi-master
# and parallel applying operation)
wsrep_certify_nonPK=1

# Location of the directory with data files. Needed for non-mysqldump
# state snapshot transfers. Defaults to mysql_real_data_home.
#wsrep_data_home_dir=

# Maximum number of rows in write set
wsrep_max_ws_rows=131072

# Maximum size of write set
wsrep_max_ws_size=1073741824

# to enable debug level logging, set this to 1
wsrep_debug=0

# convert locking sessions into transactions
wsrep_convert_LOCK_to_trx=0

# how many times to retry deadlocked autocommits
wsrep_retry_autocommit=1

# change auto_increment_increment and auto_increment_offset automatically
wsrep_auto_increment_control=1

# replicate myisam
wsrep_replicate_myisam=1

# retry autoinc insert, which failed for duplicate key error
wsrep_drupal_282555_workaround=0

# enable "strictly synchronous" semantics for read operations
wsrep_causal_reads=0

# Command to call when node status or cluster membership changes.
# Will be passed all or some of the following options:
# --status  - new status of this node
# --uuid    - UUID of the cluster
# --primary - whether the component is primary or not ("yes"/"no")
# --members - comma-separated list of members
# --index   - index of this node in the list
#wsrep_notify_cmd=

##
## WSREP State Transfer options
##

# State Snapshot Transfer method
# ClusterControl currently DOES NOT support wsrep_sst_method=mysqldump
wsrep_sst_method=mariabackup

# Address on THIS node to receive SST at. DON'T SET IT TO DONOR ADDRESS!!!
# (SST method dependent. Defaults to the first IP of the first interface)
#wsrep_sst_receive_address=

# SST authentication string. This will be used to send SST to joining nodes.
# Depends on SST method. For mysqldump method it is root:<root password>
# IMPORTANT: The user/password in wsrep_sst_auth must match
# user/password in [xtrabackup]

# Desired SST donor name.
#wsrep_sst_donor=

# Protocol version to use
# wsrep_protocol_version=

# log conflicts
wsrep_log_conflicts=1

wsrep_gtid_domain_id=1000
wsrep_gtid_mode=ON


[MYSQL]
socket=/var/lib/mysql/mysql.sock
# default_character_set = utf8
[client]
socket=/var/lib/mysql/mysql.sock


[mysqldump]
max_allowed_packet = 512M

# Security credentials for backup.
[mysqldump]
user=backupuser
password=bakp4sswd

[xtrabackup]
databases-exclude=lost+found
ssl=0
user=backupuser
password=bakp4sswd

[mysqld]
wsrep_sst_auth=backupuser:bakp4sswd
EOF




systemctl start mariadb
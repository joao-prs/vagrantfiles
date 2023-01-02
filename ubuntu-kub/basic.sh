#!/bin/sh

chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
+--------------------+
|  welcome oni-chan  |
+--------------------+
EOF
chmod -R 744 /etc/motd

apt update
#apt upgrade -y
#apt dist-upgrade -y
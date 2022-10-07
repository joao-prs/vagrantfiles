#!/bin/bash

chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
+--------------------+
| bem vindo ao proxy |
+--------------------+
EOF
chmod -R 744 /etc/motd

apt update
apt install nginx -y


cat <<EOF >>/etc/nginx/sites-available/portainer.conf

upstream portainer {
  server 192.168.3.101:9000;
  server seateletubbies.com.br:9000;
}

server {
  listen 80;
  server_name portainer.seatelebubbies.com.br;

  location / {
#    proxy_set_header x-real-IP $remote_addr;
#    proxy_set_header x-forwarded-for $proxy_addr_x_forwarded_for;
#    proxy_set_header host $http_host;
    proxy_pass http://portainer/;
  }
}
EOF

nginx -t
systemctl restart nginx

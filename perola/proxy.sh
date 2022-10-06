#!/bin/sh

chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
+--------------------+
| bem vindo ao proxy |
+--------------------+
EOF
chmod -R 744 /etc/motd


apt update
apt install nginx -y
systemctl enable nginx
systemctl start nginx


mkdir /var/www/yametee
chmod -R 744 /var/www/yametee

cat <<EOF >>/var/www/yametee/index.html
<!doctype html>
<html>
  <head>
    <meta charset="utf-8">
    <title>hello oni-chan</title>
  </head>
  <body>
    <h1>Hello!</h1>
    <p>aaaaaaaaaaaaaa</p>
  </body>
</html>
EOF
chmod -R 744 /var/www/yametee

cat <<EOF >>/etc/nginx/sites-available/yametee.conf
server {
  listen 81;
  listen [::]:81;

  root /var/www/yametee;
  index index.html;
  server_name _;

  location / {
    try_files $uri $uri/ =404;
    #proxy_pass http://192.168.121.102/;
  }
}
EOF


ln -s /etc/nginx/sites-available/yametee.conf /etc/nginx/sites-enabled/yametee.conf

#service nginx restart
systemctl restart nginx

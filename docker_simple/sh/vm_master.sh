#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
{
    Bem vindo ao MASTER
}
EOF
chmod -R 744 /etc/motd
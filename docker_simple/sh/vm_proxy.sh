#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
{
    Bem vindo ao PROXY
}
EOF
chmod -R 744 /etc/motd
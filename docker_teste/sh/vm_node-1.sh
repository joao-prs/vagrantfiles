#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
{
    Bem vindo ao NODE 1
}
EOF
chmod -R 744 /etc/motd
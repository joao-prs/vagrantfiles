#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
{
    Bem vindo ao UBUNTU
}
EOF

rm /etc/netplan/01-netcfg.yaml
#ip predefinido rede vagrant
cat <<EOF >>/etc/netplan/01-netcfg.yaml
network:
  version: 2
  renderer: networkd
  ethernets:
    eth0:
      # 2 lines below
      addresses: [192.168.121.10/24]
      gateway4: 192.168.121.1
      nameservers:
        addresses: [8.8.8.8, 8.8.4.4]
EOF
#sudo netplan apply



#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd

:kubernetes:

EOF

# time historic
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bashrc

# timezone
timedatectl set-timezone America/Belem

# install kubernetes
sudo apt update

sudo apt install -y ca-certificates curl

sudo apt install -y apt-transport-https

sudo curl -fsSLo /etc/apt/keyrings/kubernetes-archive-keyring.gpg https://packages.cloud.google.com/apt/doc/apt-key.gpg

echo "deb [signed-by=/etc/apt/keyrings/kubernetes-archive-keyring.gpg] https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update

sudo apt install -y kubectl

sudo snap refresh

sudo snap install kubectl --classic

kubectl cluster-info

ip -br a
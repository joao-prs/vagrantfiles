
#!/bin/sh

apt-get update && \
    apt-get install -y docker.io

snap install microk8s --classic
microk8s config > /home/vagrant/config
chown vagrant:vagrant /home/vagrant/config

#!/bin/sh

echo "This is the Debian package repository of Jenkins to automate installation and upgrade. To use this repository, first add the key to your system: "
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io-2023.key | tee \
    /usr/share/keyrings/jenkins-keyring.asc > /dev/null

echo "Then add a Jenkins apt repository entry: "
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
    https://pkg.jenkins.io/debian binary/ | tee \
    /etc/apt/sources.list.d/jenkins.list > /dev/null

echo "Update your local package index, then finally install Jenkins: "
apt-get update && \
    apt-get install -y fontconfig openjdk-11-jre jenkins docker.io maven


systemctl restart jenkins.service

cat /var/lib/jenkins/secrets/initialAdminPassword > /home/vagrant/pass
chown vagrant:vagrant /home/vagrant/pass

snap install kubectl --classic

usermod -aG docker jenkins
newgrp docker
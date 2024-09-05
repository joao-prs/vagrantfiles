#!/bin/bash



# ainda nao funciona




sudo dnf update -y

sudo dnf install epel-release

sudo dnf install java-1.8.0-openjdk -y

#java -version

# add jenkins repo
sudo rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key

sudo tee /etc/yum.repos.d/jenkins.repo<<EOF
[jenkins]
name=Jenkins-stable
baseurl=http://pkg.jenkins.io/redhat-stable
gpgcheck=1
EOF

sudo dnf makecache


  # check
  #sudo dnf repolist
  # check
  sudo dnf repolist Jenkins-stable

  dnf config-manager --set-enabled Jenkins-stable

# INstall Jenkins
sudo dnf -y install jenkins

sudo systemctl start jenkins
sudo systemctl enable jenkin
#sudo systemctl status jenkins
#sudo systemctl stop jenkins


#firewall
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload
sudo firewall-cmd --list-all


echo -e '\n\n\n'
cat /var/lib/jenkins/secrets/initialAdminPassword
echo -e '\n\n\n'

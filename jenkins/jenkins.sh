
#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
{
    Bem vindo ao UBUNTU com JENKINS
    run: "java -jar jenkins.war"
}
EOF
chmod -R 744 /etc/motd


sudo apt update
wget https://get.jenkins.io/war-stable/2.361.2/jenkins.war
sudo apt -y install openjdk-11-jre-headless
#java -jar jenkins.war

# 97b13a0236d6460382d0fda3602e78f6
# 192.168.121.185

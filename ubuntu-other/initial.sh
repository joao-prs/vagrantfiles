#!/bin/sh
chmod -R 777 /etc/motd
cat <<EOF >>/etc/motd
############################
#                          #
#    Servidor para LDAP    #
#                          #
############################
EOF

# time historic
echo 'export HISTTIMEFORMAT="%d/%m/%y %T "' >> ~/.bashrc
# timezone
timedatectl set-timezone America/Belem



############################
#                          #
#    add my pub.key        #
#    (step not secure)     #
#                          #
############################
# id_rsa.pub
cat >> /home/vagrant/.ssh/authorized_keys << EOF

ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCZH8kcUcjW+OPchPAPYB8aBVjl3+NguVAejUzJJFm8NEJCTVYIx4P4wPV28PVDb7jeFUadQD6yO7sVbIWdfUad5w1hRs92hNaOzqtlpfPk9no2zJ+ueHgMqYkIfH7svlmr3wrzPFKmntTInjqa5cgBCIIefXcEXqVDnC8jof0O0Ai/Z7psL7L3+p3ZtQgvIhQENGrwP5IoEZ1vMQ+Mu1NpwP3IxfLe+PYClAWJQznBqcn98EPj6PLIpW91813WCCWublKBbGqk/mr+0B8pkyoxFNIgJYJttCTOVGEHczI2XAM9Zj3aFd3/S16aTxO1WSmoIFxJMZaUebaWTJ9YbLLWYV56XgZEoM1zH/A/mgAhzyZAQQC46/n9D/OroxDVjruuQ38p/n3jFpPxVaIYO0t8yHUprTtBQ6t49K1SXyoMJ9mavLRqqI3InOSvl2VTMaZk4mOO3ZVAyuL/Xejguvlv8rFgCZYLwRxecKAUBBI+GV15oLToRXCAowW45DqP3nwiM6X1s8TU1WHD405eziS2a/j3Ao9s2aFuDKePyd1wOM4U/q5afWilR4jOOCsu+aJhsuMDfZxoCWefj2HRrUuedl8YyvWx0Rsm9Tq1Ju1g6Wcz8cU94tlNTyw5l48zeiHwNsCnKWerEqwGj8+A5wPf+TliYOiZL0Gk1DS25LBU9Q== jpedro@aspire-5
EOF

############################
#                          #
#    criação do usuario    #
#                          #
############################
useradd -m ansible
usermod -aG sudo ansible
chsh -s /bin/bash ansible
passwd -d ansible 
mkdir /home/ansible/.ssh
cp /home/vagrant/.ssh/authorized_keys /home/ansible/.ssh/
chown -R ansible:ansible /home/ansible/.ssh
chmod 700 /home/ansible/.ssh
chmod 600 /home/ansible/.ssh/authorized_keys


# show ip when finish the process
ip -br a




hostnamectl set-hostname ldap.seasolutions.com
echo "$(hostname -I)ldap.seasolutions.com.br" >> /etc/hosts

sudo apt update

sudo apt -y install slapd ldap-utils

sudo slapcat 

vim basedn.ldif



#https://computingforgeeks.com/install-and-configure-openldap-phpldapadmin-on-ubuntu/
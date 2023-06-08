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




############################
#                          #
#    criar phpldapadmin    #
#                          #
############################
#https://computingforgeeks.com/install-and-configure-openldap-phpldapadmin-on-ubuntu/ # tutorial

#hostnamectl set-hostname ldap.seasolutions.com
#echo "$(hostname -I)ldap.seasolutions.com.br" >> /etc/hosts

# sudo apt update
# 
# sudo apt -y install slapd ldap-utils
# 
# sudo slapcat 
# 
# ## acho que essa parte da para pular
# vim basedn.ldif
#   dn: ou=people,dc=seasolutions,dc=com
#   objectClass: organizationalUnit
#   ou: people
#   
#   dn: ou=groups,dc=seasolutions,dc=com
#   objectClass: organizationalUnit
#   ou: groups

#sudo ldapadd -x -D cn=admin,dc=seasolutions,dc=com -W -f basedn.ldif
#apt -y install apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear

#sudo a2enconf php*-cgi
#sudo systemctl reload apache2


#apt -y install phpldapadmin

# /usr/share/phpldapadmin                 # change lib and htdocs
#sudo vim /etc/php/8.1/apache2/php.ini    # 128MB

# /usr/share/phpldapadmin/config/config.php
#   $servers->setValue('server','name','servidor LDAP');
#   $servers->setValue('server','host','192.168.121.154');
#   $servers->setValue('server','base',array('dc=seasolutions,dc=com'));
#   $servers->setValue('login','bind_id','cn=admin,dc=seasolutions,dc=com');
#   $config->custom->appearance['hide_template_warning'] = true;
#sudo systemctl restart slapd

# acesse: ip/phpldapadmin/


############################
#                          #
#     install freeipa      # not running
#                          #
############################

#sudo hostnamectl set-hostname ipa.seasolutions.com.br
#echo "$(hostname -I)ldap.seasolutions.com.br" >> /etc/hosts
#sudo apt -y update
##sudo apt -y upgrade
##reboot
#apt -y install rng-tools
#sudo vim /etc/default/rng-tools
#   HRNGDEVICE=/dev/urandom
#systemctl enable rng-tools
#systemctl start rng-tools
#apt -y install freeipa-server
#apt -y install freeipa-client-epn











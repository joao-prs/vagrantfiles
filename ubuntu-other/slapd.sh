
############################
#                          #
#    criar phpldapadmin    #
#                          #
############################
#https://computingforgeeks.com/install-and-configure-openldap-phpldapadmin-on-ubuntu/ # tutorial

hostnamectl set-hostname ldap.seasolutions.com

echo "$(hostname -I)ldap.seasolutions.com.br" >> /etc/hosts

sudo apt update

sudo apt -y install slapd ldap-utils

sudo slapcat 

## acho que essa parte da para pular
vim basedn.ldif
dn: ou=people,dc=seasolutions,dc=com
objectClass: organizationalUnit
ou: people
dn: ou=groups,dc=seasolutions,dc=com
objectClass: organizationalUnit
ou: groups

ldapadd -x -D cn=admin,dc=seasolutions,dc=com -W -f basedn.ldif

apt -y install apache2 php php-cgi libapache2-mod-php php-mbstring php-common php-pear

sudo a2enconf php*-cgi
sudo systemctl reload apache2
apt -y install phpldapadmin

# /usr/share/phpldapadmin                 # change lib and htdocs
sudo vim /etc/php/8.1/apache2/php.ini    # 128MB

# vim /usr/share/phpldapadmin/config/config.php
$servers->setValue('server','name','servidor LDAP');
$servers->setValue('server','host','192.168.121.154');
$servers->setValue('server','base',array('dc=seasolutions,dc=com'));
$servers->setValue('login','bind_id','cn=admin,dc=seasolutions,dc=com');
$config->custom->appearance['hide_template_warning'] = true;

sudo systemctl restart slapd
sudo systemctl restart apache2

# acesse: ip/phpldapadmin/










#!/bin/bash

LOCAL=$"/home/vagrant/ldap/"
DATA='date +%d-%m-%Y_%H:%M:%S'
ARQUIVO=$"-backup-ldap.ldif"

echo - Iniciando backup
sleep 1
echo - Parando o serviço
systemctl stop slapd
sleep 1
echo - Criando arquivo LDIF para a pasta de backup
slapcat -l $LOCAL$DATA$ARQUIVO
sleep 1
echo - Reiniciando o serviço LDAP
systemctl start slapd
echo - Backup completo. Veja o arquivo em $LOCAL







scp ../htdocs-20230603T120933Z-001.zip vagrant@192.168.121.152:~/
scp ../lib-20230603T120936Z-001.zip vagrant@192.168.121.152:~/



dn: dc=seasolutions,dc=com
objectClass: top
objectClass: dcObject
objectClass: organization
o: seasolutions.com
dc: seasolutions
structuralObjectClass: organization
entryUUID: b5f71eac-9d66-103d-956b-1332f3fc2d5e
creatorsName: cn=admin,dc=seasolutions,dc=com
createTimestamp: 20230612121631Z
entryCSN: 20230612121631.944604Z#000000#000#000000
modifiersName: cn=admin,dc=seasolutions,dc=com
modifyTimestamp: 20230612121631Z

dn: cn=sac,dc=seasolutions,dc=com
cn: sac
gidNumber: 500
objectClass: posixGroup
objectClass: top
structuralObjectClass: posixGroup
entryUUID: 4ae6a196-9d70-103d-8893-61f1d94b651d
creatorsName: cn=admin,dc=seasolutions,dc=com
createTimestamp: 20230612132507Z
entryCSN: 20230612132507.287631Z#000000#000#000000
modifiersName: cn=admin,dc=seasolutions,dc=com
modifyTimestamp: 20230612132507Z

dn: cn=sac1 sea,cn=sac,dc=seasolutions,dc=com
givenName: sac1
sn: sea
cn: sac1 sea
uid: ssea
userPassword: e01ENX01UHFlbS94b0FCWXYvVHI0ZWZ2cDlRPT0=
uidNumber: 1000
gidNumber: 500
homeDirectory: /home/users/ssea
objectClass: inetOrgPerson
objectClass: posixAccount
objectClass: top
structuralObjectClass: inetOrgPerson
entryUUID: 7a638b3c-9d70-103d-8894-61f1d94b651d
creatorsName: cn=admin,dc=seasolutions,dc=com
createTimestamp: 20230612132626Z
entryCSN: 20230612132626.959202Z#000000#000#000000
modifiersName: cn=admin,dc=seasolutions,dc=com
modifyTimestamp: 20230612132626Z














# o servidor deve ser instalado manualmente para este backup funcionar

# apenas faz backup
systemctl stop slapd
cd /var/lib/ldap/
slapcat -l backup-seasolutions02.ldif
mv backup-seasolutions02.ldif /home/vagrant/
systemctl restart slapd
cd -


# esse trecho apenas destroi o banco ativo
systemctl stop slapd
rm -rfv /var/lib/ldap/*
systemctl start slapd


# restaura o backup da home vagrant
systemctl stop slapd
#cd /var/lib/ldap/
rm -rfv /var/lib/ldap/*
slapadd -l /home/vagrant/backup-seasolutions02.ldif
slapindex -v
ls /var/lib/ldap/
ls -lha /var/lib/ldap/
chown openldap:openldap  /var/lib/ldap/*
ls -lha /var/lib/ldap/
systemctl restart slapd
history